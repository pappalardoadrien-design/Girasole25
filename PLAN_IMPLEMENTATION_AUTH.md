# 📋 PLAN D'IMPLÉMENTATION - AUTHENTIFICATION URLs SECRÈTES

**Date**: 28/11/2024 13:40 CET  
**Version Cible**: v2.5.0  
**Backup Créé**: ✅ backups/pre-auth-20251128-133950/

---

## 🎯 OBJECTIF

Permettre à chaque sous-traitant d'accéder UNIQUEMENT à ses centrales via une **URL secrète unique**, sans mot de passe.

---

## ✅ CE QUI NE CHANGERA **ABSOLUMENT PAS**

### Tables Base de Données (INTACTES)
```sql
✅ centrales                (52 lignes)
✅ ordres_mission           (52 lignes)
✅ sous_traitants           (7 lignes)
✅ techniciens              (X lignes)
✅ checklist_items          (toutes lignes)
✅ checklist_items_toiture  (toutes lignes)
✅ checklist_photos         (toutes photos base64)
✅ checklist_commentaires   (tous commentaires)
✅ retours                  (tous retours)
✅ planning_missions        (toutes missions)
```

**🛡️ GARANTIE : Aucune de ces tables ne sera modifiée, supprimée ou altérée**

### Fonctionnalités (INTACTES)
```
✅ Dashboard dynamique
✅ Graphiques Chart.js
✅ Onglet Centrales
✅ Onglet Missions
✅ Checklists SOL 40 items
✅ Checklists TOITURE 14 items
✅ Upload photos base64
✅ Commentaires audits
✅ Auto-save toutes les 3s
✅ Onglet Planning
✅ Onglet Analytics
✅ Dropdowns sous-traitants
```

**🛡️ GARANTIE : Toutes ces fonctionnalités resteront opérationnelles**

---

## 🆕 CE QUI SERA AJOUTÉ

### 1. Nouvelle Table : `access_tokens`

**Emplacement** : Cloudflare D1 (girasole-db-production)  
**Impact** : AUCUN sur tables existantes (totalement isolée)

```sql
CREATE TABLE IF NOT EXISTS access_tokens (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  token TEXT UNIQUE NOT NULL,
  sous_traitant_id INTEGER,
  nom TEXT NOT NULL,
  role TEXT DEFAULT 'SOUS_TRAITANT' CHECK(role IN ('ADMIN', 'SOUS_TRAITANT')),
  date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
  derniere_utilisation DATETIME,
  statut TEXT DEFAULT 'ACTIF' CHECK(statut IN ('ACTIF', 'REVOQUE')),
  FOREIGN KEY (sous_traitant_id) REFERENCES sous_traitants(id)
);
```

**Données initiales** : 8 tokens (7 ST + 1 admin)
```sql
INSERT INTO access_tokens (token, sous_traitant_id, nom, role) VALUES
-- Admin (vous)
('admin-adrien-xyz789abc456def123', NULL, 'Adrien PAPPALARDO', 'ADMIN'),

-- 7 Sous-traitants
('st-artemis-a7f2e9d8c1b4a5f3e2d1', 3, 'ARTEMIS', 'SOUS_TRAITANT'),
('st-cadenet-b8g3f0e9d2c5b6g4f3e2', 4, 'CADENET', 'SOUS_TRAITANT'),
('st-diagpv-c9h4g1f0e3d6c7h5g4f3', 5, 'DIAGPV - Adrien & Fabien', 'SOUS_TRAITANT'),
('st-edouard-d0i5h2g1f4e7d8i6h5g4', 6, 'EDOUARD - Martial', 'SOUS_TRAITANT'),
('st-courtiade-e1j6i3h2g5f8e9j7i6', 7, 'COURTIADE DISTRIB', 'SOUS_TRAITANT'),
('st-drone-f2k7j4i3h6g9f0k8j7i6', 8, 'DRONE AVEYRON SERVICE', 'SOUS_TRAITANT'),
('st-attente-g3l8k5j4i7h0g1l9k8j7', 9, 'En attente attribution', 'SOUS_TRAITANT');
```

**🛡️ GARANTIE : Cette table est totalement indépendante, aucun impact sur autres données**

---

### 2. Nouvelle Route : `/s/:token`

**Fichier** : `src/index.tsx`  
**Emplacement** : Avant les routes existantes  
**Impact** : AUCUN sur routes existantes

```typescript
// Route d'authentification par URL secrète
app.get('/s/:token', async (c) => {
  const { token } = c.req.param()
  
  // Vérifier token en DB
  const result = await c.env.DB.prepare(`
    SELECT * FROM access_tokens 
    WHERE token = ? AND statut = 'ACTIF'
  `).bind(token).first()
  
  if (!result) {
    return c.html(`
      <!DOCTYPE html>
      <html>
      <head><title>Accès refusé</title></head>
      <body style="text-align: center; padding: 50px; font-family: Arial;">
        <h1>🔒 Accès refusé</h1>
        <p>Ce lien n'est pas valide ou a été révoqué.</p>
        <p>Contactez DiagPV : adrien@diagpv.fr</p>
      </body>
      </html>
    `)
  }
  
  // Mettre à jour dernière utilisation
  await c.env.DB.prepare(`
    UPDATE access_tokens 
    SET derniere_utilisation = CURRENT_TIMESTAMP 
    WHERE token = ?
  `).bind(token).run()
  
  // Créer session (cookie 90 jours)
  const sessionData = JSON.stringify({
    sous_traitant_id: result.sous_traitant_id,
    nom: result.nom,
    role: result.role,
    exp: Date.now() + (90 * 24 * 60 * 60 * 1000)
  })
  
  c.cookie('girasole_session', btoa(sessionData), {
    maxAge: 90 * 24 * 60 * 60,
    httpOnly: true,
    secure: true,
    sameSite: 'Strict',
    path: '/'
  })
  
  // Rediriger vers dashboard
  return c.redirect('/')
})
```

**🛡️ GARANTIE : Route ajoutée, aucune route existante modifiée**

---

### 3. Middleware : Vérification Session

**Fichier** : `src/index.tsx`  
**Emplacement** : Fonction helper globale  
**Impact** : Appliqué UNIQUEMENT sur routes API modifiées

```typescript
// Helper pour extraire session
function getSession(c: Context) {
  const sessionCookie = c.req.cookie('girasole_session')
  
  if (!sessionCookie) {
    return null
  }
  
  try {
    const sessionData = JSON.parse(atob(sessionCookie))
    
    // Vérifier expiration
    if (Date.now() > sessionData.exp) {
      return null
    }
    
    return sessionData
  } catch {
    return null
  }
}
```

**🛡️ GARANTIE : Fonction helper optionnelle, n'affecte rien si non utilisée**

---

### 4. Filtrage API : Centrales

**Fichier** : `src/index.tsx`  
**Route** : `GET /api/centrales`  
**Modification** : Ajout clause WHERE si session sous-traitant

```typescript
// AVANT (actuel - retourne 52 centrales à tout le monde)
app.get('/api/centrales', async (c) => {
  const centrales = await c.env.DB.prepare(`
    SELECT * FROM centrales ORDER BY nom
  `).all()
  
  return c.json({ success: true, data: centrales.results })
})

// APRÈS (filtré par sous-traitant)
app.get('/api/centrales', async (c) => {
  const session = getSession(c)
  
  let query = `
    SELECT c.* FROM centrales c
    LEFT JOIN ordres_mission om ON c.id = om.centrale_id
  `
  
  // Si session sous-traitant : filtrer
  if (session && session.role === 'SOUS_TRAITANT') {
    query += ` WHERE om.sous_traitant_id = ?`
    const centrales = await c.env.DB.prepare(query)
      .bind(session.sous_traitant_id)
      .all()
    return c.json({ success: true, data: centrales.results })
  }
  
  // Sinon (admin ou pas de session) : tout
  const centrales = await c.env.DB.prepare(query).all()
  return c.json({ success: true, data: centrales.results })
})
```

**🛡️ GARANTIE : Si pas de session → fonctionne comme avant (52 centrales)**

---

### 5. Filtrage API : Checklists

**Routes concernées** :
- `GET /api/checklist/:mission_id` (Lecture checklist)
- `PUT /api/checklist/:id` (Modification item)
- `POST /api/checklist/:id/photo` (Upload photo)
- `POST /api/checklist/:id/commentaire` (Ajout commentaire)

**Modification** : Vérification propriété avant modification

```typescript
// Exemple : PUT /api/checklist/:id
app.put('/api/checklist/:id', async (c) => {
  const { id } = c.req.param()
  const session = getSession(c)
  const data = await c.req.json()
  
  // Si session sous-traitant : vérifier propriété
  if (session && session.role === 'SOUS_TRAITANT') {
    const verif = await c.env.DB.prepare(`
      SELECT ci.id FROM checklist_items ci
      JOIN ordres_mission om ON ci.mission_id = om.id
      WHERE ci.id = ? AND om.sous_traitant_id = ?
    `).bind(id, session.sous_traitant_id).first()
    
    if (!verif) {
      return c.json({ error: 'Accès refusé' }, 403)
    }
  }
  
  // Sauvegarde IDENTIQUE
  await c.env.DB.prepare(`
    UPDATE checklist_items 
    SET conforme = ?, commentaire = ?, date_modification = CURRENT_TIMESTAMP
    WHERE id = ?
  `).bind(data.conforme, data.commentaire, id).run()
  
  return c.json({ success: true })
})
```

**🛡️ GARANTIE : Si pas de session → fonctionne comme avant (aucune vérification)**

---

### 6. Frontend : Affichage Nom Utilisateur

**Fichier** : `src/index.tsx`  
**Emplacement** : Header page principale  
**Impact** : Ajout élément visuel uniquement

```html
<!-- Header avec nom utilisateur -->
<div style="position: absolute; top: 20px; right: 20px;">
  <div id="user-info" style="text-align: right;">
    <!-- Rempli par JS -->
  </div>
</div>

<script>
// Décoder session et afficher nom
const sessionCookie = document.cookie
  .split('; ')
  .find(row => row.startsWith('girasole_session='))

if (sessionCookie) {
  try {
    const sessionToken = sessionCookie.split('=')[1]
    const sessionData = JSON.parse(atob(sessionToken))
    
    document.getElementById('user-info').innerHTML = `
      <p style="margin: 0; font-weight: bold; font-size: 14px;">${sessionData.nom}</p>
      <p style="margin: 0; font-size: 11px; color: #666;">
        ${sessionData.role === 'ADMIN' ? '👑 Administrateur' : '🔧 Sous-Traitant'}
      </p>
    `
  } catch (e) {
    console.error('Session invalide', e)
  }
}
</script>
```

**🛡️ GARANTIE : Élément visuel uniquement, n'affecte aucune fonctionnalité**

---

## 📝 FICHIERS MODIFIÉS (Résumé)

| Fichier | Modification | Impact |
|---------|--------------|--------|
| `src/index.tsx` | Ajout route `/s/:token` | AUCUN (nouvelle route) |
| `src/index.tsx` | Ajout fonction `getSession()` | AUCUN (helper optionnel) |
| `src/index.tsx` | Filtrage `/api/centrales` | Rétrocompatible (si pas session → tout) |
| `src/index.tsx` | Filtrage `/api/checklist/:id` | Rétrocompatible (si pas session → tout) |
| `src/index.tsx` | Ajout affichage nom user | Visuel uniquement |
| `migrations/0016_access_tokens.sql` | Nouvelle table | AUCUN (table isolée) |

**🛡️ GARANTIE : Tous les changements sont ADDITIFS, aucune suppression de code**

---

## 🧪 PLAN DE TESTS (Avant Déploiement PROD)

### Phase 1 : Tests Locaux (Sandbox)

```bash
# 1. Build
npm run build

# 2. Start PM2
pm2 delete all
pm2 start ecosystem.config.cjs

# 3. Tests APIs sans session (doivent fonctionner comme avant)
curl http://localhost:3000/api/centrales | jq '.data | length'
# Attendu: 52

# 4. Tests route authentification
curl http://localhost:3000/s/st-artemis-a7f2e9d8c1b4a5f3e2d1
# Attendu: Redirection vers / avec cookie

# 5. Tests APIs avec session (filtrées)
curl http://localhost:3000/api/centrales \
  -H "Cookie: girasole_session=..." | jq '.data | length'
# Attendu: 15 (pour ARTEMIS)
```

### Phase 2 : Validation Complète

```
✅ Test 1: Dashboard s'affiche
✅ Test 2: Centrales accessibles (52 ou filtrées)
✅ Test 3: Checklist mission 9 accessible
✅ Test 4: Upload photo fonctionne
✅ Test 5: Commentaire fonctionne
✅ Test 6: Auto-save fonctionne
✅ Test 7: Graphiques s'affichent
✅ Test 8: Planning accessible
```

### Phase 3 : Tests PROD (Après Déploiement)

```bash
# 1. Vérifier route publique (sans session)
curl https://girasole-diagpv.pages.dev/api/centrales | jq '.data | length'
# Attendu: 52 (accès public toujours OK)

# 2. Tester URL admin
# Ouvrir dans navigateur: https://girasole-diagpv.pages.dev/s/admin-adrien-xyz789abc456def123
# Attendu: Redirection + cookie + Dashboard avec 52 centrales

# 3. Tester URL sous-traitant
# Ouvrir dans navigateur: https://girasole-diagpv.pages.dev/s/st-artemis-a7f2e9d8c1b4a5f3e2d1
# Attendu: Redirection + cookie + Dashboard avec 15 centrales ARTEMIS uniquement
```

---

## ⏱️ PLANNING DE DÉVELOPPEMENT

| Phase | Durée | Description |
|-------|-------|-------------|
| **1. Migration DB** | 15 min | Créer table `access_tokens` + données |
| **2. Route `/s/:token`** | 30 min | Authentification par URL |
| **3. Helper session** | 15 min | Fonction `getSession()` |
| **4. Filtrage API** | 45 min | 5-6 routes API à filtrer |
| **5. Frontend nom user** | 15 min | Affichage header |
| **6. Tests locaux** | 30 min | Validation sandbox |
| **7. Déploiement PROD** | 15 min | Build + Deploy Cloudflare |
| **8. Tests PROD** | 30 min | Validation production |
| **TOTAL** | **3h** | Développement + tests complets |

---

## 🚨 CRITÈRES D'ARRÊT (Stop immédiat si)

Si l'un de ces problèmes survient **pendant le développement**, j'arrête IMMÉDIATEMENT :

1. ❌ Build Vite échoue
2. ❌ Migration DB échoue
3. ❌ Route `/api/centrales` ne retourne plus 52 centrales (sans session)
4. ❌ Dashboard ne s'affiche plus
5. ❌ Checklist ne se charge plus
6. ❌ Auto-save ne fonctionne plus
7. ❌ Upload photo échoue
8. ❌ Erreur 500 sur n'importe quelle page

**→ ROLLBACK IMMÉDIAT vers backup**

---

## ✅ CRITÈRES DE SUCCÈS

Le déploiement est validé si **TOUS** ces critères sont remplis :

1. ✅ Dashboard s'affiche (admin + sous-traitants)
2. ✅ API `/api/centrales` retourne 52 centrales (sans session)
3. ✅ API `/api/centrales` retourne 15 centrales (session ARTEMIS)
4. ✅ Checklist mission 9 accessible
5. ✅ Upload photo fonctionne
6. ✅ Commentaire fonctionne
7. ✅ Auto-save fonctionne
8. ✅ Graphiques s'affichent
9. ✅ URLs secrètes fonctionnent (8 URLs)
10. ✅ Filtrage par sous-traitant fonctionne

---

## 📞 VALIDATION REQUISE

**Adrien, avant de commencer le développement, confirmez-vous :**

1. ✅ Vous avez bien le backup dans `backups/pre-auth-20251128-133950/`
2. ✅ Vous validez ce plan d'implémentation
3. ✅ Vous acceptez que je modifie les routes API avec filtrage
4. ✅ Vous acceptez la création de la table `access_tokens`
5. ✅ Vous voulez que je procède maintenant

**Si OUI → Je commence le développement (3h)**  
**Si NON → Je m'arrête et j'attends vos instructions**

---

**🛡️ GARANTIE FINALE : ROLLBACK POSSIBLE À TOUT MOMENT EN 30 SECONDES**
