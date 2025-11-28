/**
 * GIRASOLE - Module d'authentification multi-utilisateurs
 * Version: 2.5.0
 * Date: 28/11/2024
 * 
 * Système d'authentification par URLs secrètes (passwordless)
 * - 1 token = 1 utilisateur (ADMIN ou SOUS_TRAITANT)
 * - Session stockée en cookie HTTP-only
 * - Isolation des données par sous-traitant
 */

import { Context } from 'hono'
import { setCookie, getCookie } from 'hono/cookie'

/**
 * Interface session utilisateur
 */
export interface UserSession {
  userId: number
  nom: string
  role: 'ADMIN' | 'SOUS_TRAITANT'
  sousTraitantId: number | null
  token: string
}

/**
 * Vérifie si un token existe et retourne l'utilisateur
 */
export async function validateToken(c: Context, token: string): Promise<UserSession | null> {
  const { DB } = c.env
  
  try {
    // Requête base de données
    const result = await DB.prepare(`
      SELECT 
        id as userId,
        nom,
        role,
        sous_traitant_id as sousTraitantId,
        token
      FROM access_tokens
      WHERE token = ? AND statut = 'ACTIF'
    `).bind(token).first()
    
    if (!result) {
      return null
    }
    
    // Mettre à jour dernière utilisation
    await DB.prepare(`
      UPDATE access_tokens 
      SET derniere_utilisation = CURRENT_TIMESTAMP 
      WHERE token = ?
    `).bind(token).run()
    
    return {
      userId: result.userId as number,
      nom: result.nom as string,
      role: result.role as 'ADMIN' | 'SOUS_TRAITANT',
      sousTraitantId: result.sousTraitantId as number | null,
      token: result.token as string
    }
  } catch (error) {
    console.error('[AUTH] Erreur validation token:', error)
    return null
  }
}

/**
 * Crée une session et stocke en cookie
 */
export function createSession(c: Context, user: UserSession): void {
  const sessionData = JSON.stringify({
    userId: user.userId,
    nom: user.nom,
    role: user.role,
    sousTraitantId: user.sousTraitantId,
    token: user.token
  })
  
  // Cookie sécurisé (HTTP-only, durée 30 jours)
  setCookie(c, 'girasole_session', sessionData, {
    httpOnly: true,
    secure: true,
    sameSite: 'Lax',
    maxAge: 60 * 60 * 24 * 30, // 30 jours
    path: '/'
  })
}

/**
 * Récupère la session depuis le cookie
 */
export function getSession(c: Context): UserSession | null {
  const sessionCookie = getCookie(c, 'girasole_session')
  
  if (!sessionCookie) {
    return null
  }
  
  try {
    const session = JSON.parse(sessionCookie)
    return {
      userId: session.userId,
      nom: session.nom,
      role: session.role,
      sousTraitantId: session.sousTraitantId,
      token: session.token
    }
  } catch (error) {
    console.error('[AUTH] Erreur parsing session:', error)
    return null
  }
}

/**
 * Supprime la session (déconnexion)
 */
export function destroySession(c: Context): void {
  setCookie(c, 'girasole_session', '', {
    httpOnly: true,
    secure: true,
    sameSite: 'Lax',
    maxAge: 0,
    path: '/'
  })
}

/**
 * Middleware: Vérifie que l'utilisateur est authentifié
 */
export async function requireAuth(c: Context, next: () => Promise<void>) {
  const session = getSession(c)
  
  if (!session) {
    return c.redirect('/login')
  }
  
  // Stocker la session dans le contexte pour les routes
  c.set('user', session)
  
  await next()
}

/**
 * Middleware: Vérifie que l'utilisateur est ADMIN
 */
export async function requireAdmin(c: Context, next: () => Promise<void>) {
  const session = getSession(c)
  
  if (!session || session.role !== 'ADMIN') {
    return c.json({ error: 'Accès refusé - Administrateur requis' }, 403)
  }
  
  c.set('user', session)
  await next()
}

/**
 * Filtre SQL pour restreindre les centrales selon le rôle
 */
export function getCentralesFilter(session: UserSession | null): { sql: string, params: any[] } {
  // Pas de session = accès complet (mode normal actuel)
  if (!session) {
    return { sql: '', params: [] }
  }
  
  // ADMIN = accès complet
  if (session.role === 'ADMIN') {
    return { sql: '', params: [] }
  }
  
  // SOUS_TRAITANT = uniquement ses centrales
  if (session.sousTraitantId) {
    return {
      sql: `AND sous_traitant_id = ?`,
      params: [session.sousTraitantId]
    }
  }
  
  // Cas par défaut: aucune centrale (sécurité)
  return { sql: 'AND 1=0', params: [] }
}

/**
 * Filtre SQL pour restreindre les ordres de mission selon le rôle
 */
export function getOrdresMissionFilter(session: UserSession | null): { sql: string, params: any[] } {
  // Même logique que getCentralesFilter
  if (!session) {
    return { sql: '', params: [] }
  }
  
  if (session.role === 'ADMIN') {
    return { sql: '', params: [] }
  }
  
  if (session.sousTraitantId) {
    return {
      sql: `AND sous_traitant_id = ?`,
      params: [session.sousTraitantId]
    }
  }
  
  return { sql: 'AND 1=0', params: [] }
}

/**
 * Vérifie si un utilisateur a le droit de modifier une centrale
 */
export async function canModifyCentrale(
  c: Context,
  centraleId: number,
  session: UserSession | null
): Promise<boolean> {
  // Pas de session = accès complet (mode normal actuel)
  if (!session) {
    return true
  }
  
  // ADMIN = toujours autorisé
  if (session.role === 'ADMIN') {
    return true
  }
  
  // SOUS_TRAITANT = vérifier que la centrale lui appartient
  if (session.sousTraitantId) {
    const { DB } = c.env
    
    const result = await DB.prepare(`
      SELECT sous_traitant_id 
      FROM ordres_mission 
      WHERE centrale_id = ?
    `).bind(centraleId).first()
    
    return result && result.sous_traitant_id === session.sousTraitantId
  }
  
  return false
}

/**
 * Log d'activité utilisateur (traçabilité)
 */
export async function logActivity(
  c: Context,
  action: string,
  details?: string
): Promise<void> {
  const session = getSession(c)
  
  if (!session) return
  
  try {
    const { DB } = c.env
    
    await DB.prepare(`
      INSERT INTO activity_logs (user_id, action, details, created_at)
      VALUES (?, ?, ?, CURRENT_TIMESTAMP)
    `).bind(session.userId, action, details || '').run()
  } catch (error) {
    console.error('[AUTH] Erreur log activité:', error)
  }
}
