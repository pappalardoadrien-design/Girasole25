import { Hono } from 'hono'
import { cors } from 'hono/cors'
// COMMENTED: serveStatic not needed - Cloudflare Pages serves public/ files automatically
// import { serveStatic } from 'hono/cloudflare-workers'

type Bindings = {
  DB: D1Database;
}

const app = new Hono<{ Bindings: Bindings }>()

// Enable CORS for API routes
app.use('/api/*', cors())

// COMMENTED: Cloudflare Pages automatically serves files from public/ directory
// No need for serveStatic middleware - files are accessible directly
// app.use('/static/*', serveStatic({ root: './public' }))
// app.use('/documents/*', serveStatic({ root: './public' }))

// ======================
// API ROUTES - CENTRALES
// ======================

// GET /api/centrales - Liste toutes les centrales
app.get('/api/centrales', async (c) => {
  const { DB } = c.env
  
  try {
    const result = await DB.prepare(`
      SELECT 
        c.*,
        0 as nb_retours,
        0 as total_photos
      FROM centrales c
      ORDER BY c.nom
    `).all()
    
    return c.json({ success: true, data: result.results })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// GET /api/centrales/:id - Détail une centrale
app.get('/api/centrales/:id', async (c) => {
  const { DB } = c.env
  const id = c.req.param('id')
  
  try {
    const centrale = await DB.prepare(`
      SELECT * FROM centrales WHERE id = ?
    `).bind(id).first()
    
    if (!centrale) {
      return c.json({ success: false, error: 'Centrale non trouvée' }, 404)
    }
    
    const retours = await DB.prepare(`
      SELECT * FROM retours_json WHERE centrale_id = ? ORDER BY date_upload DESC
    `).bind(id).all()
    
    return c.json({ 
      success: true, 
      data: { 
        centrale, 
        retours: retours.results 
      } 
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// POST /api/centrales - Créer nouvelle centrale
app.post('/api/centrales', async (c) => {
  const { DB } = c.env
  
  try {
    const body = await c.req.json()
    const { nom, type, puissance_kwc, localisation } = body
    
    if (!nom || !type) {
      return c.json({ success: false, error: 'Nom et type requis' }, 400)
    }
    
    const result = await DB.prepare(`
      INSERT INTO centrales (nom, type, puissance_kwc, localisation)
      VALUES (?, ?, ?, ?)
    `).bind(nom, type, puissance_kwc || 0, localisation || '').run()
    
    return c.json({ 
      success: true, 
      data: { id: result.meta.last_row_id } 
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// PUT /api/centrales/:id/statut - Mettre à jour statut
app.put('/api/centrales/:id/statut', async (c) => {
  const { DB } = c.env
  const id = c.req.param('id')
  
  try {
    const { statut } = await c.req.json()
    
    if (!['A_AUDITER', 'EN_COURS', 'TERMINE', 'VALIDE'].includes(statut)) {
      return c.json({ success: false, error: 'Statut invalide' }, 400)
    }
    
    await DB.prepare(`
      UPDATE centrales 
      SET statut = ?,
          date_audit = CASE WHEN ? = 'EN_COURS' THEN CURRENT_TIMESTAMP ELSE date_audit END,
          date_validation = CASE WHEN ? = 'VALIDE' THEN CURRENT_TIMESTAMP ELSE date_validation END
      WHERE id = ?
    `).bind(statut, statut, statut, id).run()
    
    return c.json({ success: true })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// =======================
// API ROUTES - RETOURS JSON
// =======================

// POST /api/retours - Enregistrer métadonnées retour JSON
app.post('/api/retours', async (c) => {
  const { DB } = c.env
  
  try {
    const body = await c.req.json()
    const { ordre_mission_id, centrale_id, technicien_id, json_data, taille_mo, nb_photos } = body
    
    if (!ordre_mission_id || !centrale_id || !technicien_id || !json_data) {
      return c.json({ success: false, error: 'ordre_mission_id, centrale_id, technicien_id et json_data requis' }, 400)
    }
    
    const result = await DB.prepare(`
      INSERT INTO retours_json (ordre_mission_id, centrale_id, technicien_id, json_data, taille_mo, nb_photos)
      VALUES (?, ?, ?, ?, ?, ?)
    `).bind(ordre_mission_id, centrale_id, technicien_id, json_data, taille_mo || 0, nb_photos || 0).run()
    
    // Mettre à jour statut centrale
    await DB.prepare(`
      UPDATE centrales SET statut = 'TERMINE' WHERE id = ?
    `).bind(centrale_id).run()
    
    return c.json({ 
      success: true, 
      data: { id: result.meta.last_row_id } 
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// ======================
// API ROUTES - STATISTIQUES
// ======================

// GET /api/stats - Statistiques mission globales
app.get('/api/stats', async (c) => {
  const { DB } = c.env
  
  try {
    // Stats centrales par statut
    const statsStatut = await DB.prepare(`
      SELECT 
        statut,
        COUNT(*) as count
      FROM centrales
      GROUP BY statut
    `).all()
    
    // Stats par type
    const statsType = await DB.prepare(`
      SELECT 
        type,
        COUNT(*) as count,
        SUM(CASE WHEN statut = 'VALIDE' THEN 1 ELSE 0 END) as valides
      FROM centrales
      GROUP BY type
    `).all()
    
    // Stats globales
    const statsGlobal = await DB.prepare(`
      SELECT 
        COUNT(*) as total_centrales,
        SUM(CASE WHEN statut IN ('TERMINE', 'VALIDE') THEN 1 ELSE 0 END) as auditees,
        SUM(CASE WHEN statut = 'VALIDE' THEN 1 ELSE 0 END) as validees
      FROM centrales
    `).first()
    
    // Stats missions (ordres_mission)
    const statsMissions = await DB.prepare(`
      SELECT 
        COUNT(*) as total_missions,
        SUM(CASE WHEN statut = 'PLANIFIE' THEN 1 ELSE 0 END) as planifiees
      FROM ordres_mission
    `).first()
    
    return c.json({ 
      success: true, 
      data: {
        global: statsGlobal,
        par_statut: statsStatut.results,
        par_type: statsType.results,
        missions: statsMissions
      }
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// GET /api/stats/progression - Progression temporelle
app.get('/api/stats/progression', async (c) => {
  const { DB } = c.env
  
  try {
    const progression = await DB.prepare(`
      SELECT 
        DATE(date_upload) as date,
        COUNT(*) as nb_retours,
        SUM(nb_photos) as photos
      FROM retours_json
      GROUP BY DATE(date_upload)
      ORDER BY date DESC
      LIMIT 30
    `).all()
    
    return c.json({ success: true, data: progression.results })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// ==============================
// API ROUTES - SOUS-TRAITANTS
// ==============================

// GET /api/sous-traitants - Liste tous les sous-traitants
app.get('/api/sous-traitants', async (c) => {
  const { DB } = c.env
  
  try {
    const result = await DB.prepare(`
      SELECT 
        st.*,
        COUNT(DISTINCT t.id) as nb_techniciens,
        COUNT(DISTINCT om.id) as nb_missions
      FROM sous_traitants st
      LEFT JOIN techniciens t ON st.id = t.sous_traitant_id AND t.statut != 'INDISPONIBLE'
      LEFT JOIN ordres_mission om ON st.id = om.sous_traitant_id AND om.statut NOT IN ('ANNULE', 'TERMINE', 'VALIDE')
      WHERE st.statut = 'ACTIF'
      GROUP BY st.id
      ORDER BY st.nom_entreprise
    `).all()
    
    return c.json({ success: true, data: result.results })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// POST /api/sous-traitants - Créer nouveau sous-traitant
app.post('/api/sous-traitants', async (c) => {
  const { DB } = c.env
  
  try {
    const body = await c.req.json()
    const { nom_entreprise, email_contact, telephone, adresse, siret, contact_principal } = body
    
    if (!nom_entreprise) {
      return c.json({ success: false, error: 'Nom entreprise requis' }, 400)
    }
    
    const result = await DB.prepare(`
      INSERT INTO sous_traitants (nom_entreprise, email_contact, telephone, adresse, siret, contact_principal)
      VALUES (?, ?, ?, ?, ?, ?)
    `).bind(nom_entreprise, email_contact || null, telephone || null, adresse || null, siret || null, contact_principal || null).run()
    
    return c.json({ success: true, data: { id: result.meta.last_row_id } })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// PUT /api/sous-traitants/:id - Modifier sous-traitant
app.put('/api/sous-traitants/:id', async (c) => {
  const { DB } = c.env
  const id = c.req.param('id')
  
  try {
    const body = await c.req.json()
    const { nom_entreprise, email_contact, telephone, adresse, siret, contact_principal, statut } = body
    
    await DB.prepare(`
      UPDATE sous_traitants 
      SET nom_entreprise = ?, email_contact = ?, telephone = ?, adresse = ?, siret = ?, contact_principal = ?, statut = ?, date_modification = CURRENT_TIMESTAMP
      WHERE id = ?
    `).bind(nom_entreprise, email_contact, telephone, adresse, siret, contact_principal, statut || 'ACTIF', id).run()
    
    return c.json({ success: true })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// ==========================
// API ROUTES - TECHNICIENS
// ==========================

// GET /api/techniciens - Liste tous les techniciens
app.get('/api/techniciens', async (c) => {
  const { DB } = c.env
  
  try {
    const result = await DB.prepare(`
      SELECT 
        t.*,
        st.nom_entreprise,
        COUNT(DISTINCT om.id) as nb_missions_actives
      FROM techniciens t
      LEFT JOIN sous_traitants st ON t.sous_traitant_id = st.id
      LEFT JOIN ordres_mission om ON t.id = om.technicien_id AND om.statut NOT IN ('ANNULE', 'TERMINE', 'VALIDE')
      GROUP BY t.id
      ORDER BY st.nom_entreprise, t.nom, t.prenom
    `).all()
    
    return c.json({ success: true, data: result.results })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// POST /api/techniciens - Créer nouveau technicien
app.post('/api/techniciens', async (c) => {
  const { DB } = c.env
  
  try {
    const body = await c.req.json()
    const { sous_traitant_id, prenom, nom, email, telephone } = body
    
    if (!sous_traitant_id || !prenom || !nom) {
      return c.json({ success: false, error: 'sous_traitant_id, prenom et nom requis' }, 400)
    }
    
    const result = await DB.prepare(`
      INSERT INTO techniciens (sous_traitant_id, prenom, nom, email, telephone)
      VALUES (?, ?, ?, ?, ?)
    `).bind(sous_traitant_id, prenom, nom, email || null, telephone || null).run()
    
    return c.json({ success: true, data: { id: result.meta.last_row_id } })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// PUT /api/techniciens/:id - Modifier technicien
app.put('/api/techniciens/:id', async (c) => {
  const { DB } = c.env
  const id = c.req.param('id')
  
  try {
    const body = await c.req.json()
    const { sous_traitant_id, prenom, nom, email, telephone, statut } = body
    
    await DB.prepare(`
      UPDATE techniciens 
      SET sous_traitant_id = ?, prenom = ?, nom = ?, email = ?, telephone = ?, statut = ?, date_modification = CURRENT_TIMESTAMP
      WHERE id = ?
    `).bind(sous_traitant_id, prenom, nom, email, telephone, statut || 'DISPONIBLE', id).run()
    
    return c.json({ success: true })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// ==============================
// API ROUTES - ORDRES DE MISSION
// ==============================

// GET /api/ordres-mission - Liste tous les ordres de mission
app.get('/api/ordres-mission', async (c) => {
  const { DB } = c.env
  
  try {
    const result = await DB.prepare(`
      SELECT 
        om.*,
        c.nom as centrale_nom,
        c.type as centrale_type,
        c.puissance_kwc,
        c.localisation,
        t.prenom as technicien_prenom,
        t.nom as technicien_nom,
        t.email as technicien_email,
        st.nom_entreprise as sous_traitant_nom
      FROM ordres_mission om
      JOIN centrales c ON om.centrale_id = c.id
      JOIN techniciens t ON om.technicien_id = t.id
      LEFT JOIN sous_traitants st ON om.sous_traitant_id = st.id
      ORDER BY om.date_mission DESC, om.id DESC
    `).all()
    
    return c.json({ success: true, data: result.results })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// POST /api/ordres-mission - Créer nouvel ordre de mission
app.post('/api/ordres-mission', async (c) => {
  const { DB } = c.env
  
  try {
    const body = await c.req.json()
    const { centrale_id, technicien_id, sous_traitant_id, date_mission, heure_debut, duree_estimee_heures, commentaires } = body
    
    if (!centrale_id || !technicien_id || !sous_traitant_id || !date_mission) {
      return c.json({ success: false, error: 'centrale_id, technicien_id, sous_traitant_id et date_mission requis' }, 400)
    }
    
    // Vérifier si centrale déjà attribuée
    const existing = await DB.prepare(`
      SELECT id FROM ordres_mission 
      WHERE centrale_id = ? AND statut NOT IN ('ANNULE', 'VALIDE')
    `).bind(centrale_id).first()
    
    if (existing) {
      return c.json({ success: false, error: 'Cette centrale a déjà un ordre de mission actif' }, 400)
    }
    
    // Créer ordre de mission
    const result = await DB.prepare(`
      INSERT INTO ordres_mission (centrale_id, technicien_id, sous_traitant_id, date_mission, heure_debut, duree_estimee_heures, commentaires)
      VALUES (?, ?, ?, ?, ?, ?, ?)
    `).bind(centrale_id, technicien_id, sous_traitant_id, date_mission, heure_debut || null, duree_estimee_heures || 7.0, commentaires || null).run()
    
    const ordreId = result.meta.last_row_id
    
    // Créer événement planning
    const heure_fin = heure_debut ? `${parseInt(heure_debut.split(':')[0]) + (duree_estimee_heures || 7)}:${heure_debut.split(':')[1]}` : null
    
    await DB.prepare(`
      INSERT INTO planning_events (ordre_mission_id, centrale_id, technicien_id, sous_traitant_id, date_debut, date_fin, titre, statut)
      VALUES (?, ?, ?, ?, ?, ?, ?, 'PLANIFIE')
    `).bind(
      ordreId, 
      centrale_id, 
      technicien_id, 
      sous_traitant_id,
      `${date_mission} ${heure_debut || '08:00'}`,
      `${date_mission} ${heure_fin || '16:00'}`,
      `Audit Centrale`
    ).run()
    
    // Mettre à jour statut centrale
    await DB.prepare(`
      UPDATE centrales SET statut = 'EN_COURS' WHERE id = ?
    `).bind(centrale_id).run()
    
    return c.json({ success: true, data: { id: ordreId } })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// PUT /api/ordres-mission/:id/statut - Changer statut ordre de mission
app.put('/api/ordres-mission/:id/statut', async (c) => {
  const { DB } = c.env
  const id = c.req.param('id')
  
  try {
    const { statut, raison_annulation } = await c.req.json()
    
    if (!['PLANIFIE', 'CONFIRME', 'EN_COURS', 'TERMINE', 'VALIDE', 'ANNULE', 'REPORTE'].includes(statut)) {
      return c.json({ success: false, error: 'Statut invalide' }, 400)
    }
    
    await DB.prepare(`
      UPDATE ordres_mission 
      SET statut = ?,
          raison_annulation = ?,
          date_annulation = CASE WHEN ? = 'ANNULE' THEN CURRENT_TIMESTAMP ELSE date_annulation END,
          date_validation = CASE WHEN ? = 'VALIDE' THEN CURRENT_TIMESTAMP ELSE date_validation END
      WHERE id = ?
    `).bind(statut, raison_annulation || null, statut, statut, id).run()
    
    // Mettre à jour planning event
    await DB.prepare(`
      UPDATE planning_events SET statut = ? WHERE ordre_mission_id = ?
    `).bind(statut, id).run()
    
    return c.json({ success: true })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// PUT /api/ordres-mission/:id/date - Mettre à jour date intervention
app.put('/api/ordres-mission/:id/date', async (c) => {
  const { DB } = c.env
  const id = c.req.param('id')
  
  try {
    const { date_mission, heure_debut, heure_fin } = await c.req.json()
    
    if (!date_mission) {
      return c.json({ success: false, error: 'Date mission requise' }, 400)
    }
    
    // Mettre à jour ordre de mission
    await DB.prepare(`
      UPDATE ordres_mission 
      SET date_mission = ?,
          heure_debut = ?,
          heure_fin = ?
      WHERE id = ?
    `).bind(date_mission, heure_debut || '08:00', heure_fin || '16:00', id).run()
    
    // Mettre à jour planning event
    await DB.prepare(`
      UPDATE planning_events 
      SET date_debut = ?,
          date_fin = ?
      WHERE ordre_mission_id = ?
    `).bind(
      `${date_mission} ${heure_debut || '08:00'}`,
      `${date_mission} ${heure_fin || '16:00'}`,
      id
    ).run()
    
    return c.json({ success: true })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// PUT /api/ordres-mission/:id/subcontractor - Attribuer sous-traitant
app.put('/api/ordres-mission/:id/subcontractor', async (c) => {
  const { DB } = c.env
  const id = c.req.param('id')
  
  try {
    const { sous_traitant_id } = await c.req.json()
    
    if (!sous_traitant_id) {
      return c.json({ success: false, error: 'sous_traitant_id requis' }, 400)
    }
    
    // Vérifier que le sous-traitant existe
    const st = await DB.prepare(`SELECT id, nom_entreprise FROM sous_traitants WHERE id = ?`)
      .bind(sous_traitant_id).first()
    
    if (!st) {
      return c.json({ success: false, error: 'Sous-traitant non trouvé' }, 404)
    }
    
    // Mettre à jour ordre de mission
    await DB.prepare(`
      UPDATE ordres_mission 
      SET sous_traitant_id = ?
      WHERE id = ?
    `).bind(sous_traitant_id, id).run()
    
    return c.json({ 
      success: true,
      message: `Mission ${id} attribuée à ${st.nom_entreprise}`,
      data: { mission_id: id, sous_traitant: st.nom_entreprise }
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// POST /api/ordres-mission/batch-assign - Attribution en masse
app.post('/api/ordres-mission/batch-assign', async (c) => {
  const { DB } = c.env
  
  try {
    const { assignments } = await c.req.json()
    
    if (!assignments || !Array.isArray(assignments)) {
      return c.json({ success: false, error: 'Format invalide' }, 400)
    }
    
    let updated = 0
    for (const { mission_id, sous_traitant_id } of assignments) {
      await DB.prepare(`
        UPDATE ordres_mission 
        SET sous_traitant_id = ?
        WHERE id = ?
      `).bind(sous_traitant_id, mission_id).run()
      updated++
    }
    
    return c.json({ 
      success: true,
      message: `${updated} missions attribuées`,
      count: updated
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// GET /api/planning - Événements planning (vue calendrier)
app.get('/api/planning', async (c) => {
  const { DB } = c.env
  const { start, end } = c.req.query()
  
  try {
    let query = `
      SELECT 
        pe.*,
        c.nom as centrale_nom,
        c.type as centrale_type,
        c.puissance_kwc,
        t.prenom as technicien_prenom,
        t.nom as technicien_nom,
        st.nom_entreprise
      FROM planning_events pe
      JOIN centrales c ON pe.centrale_id = c.id
      JOIN techniciens t ON pe.technicien_id = t.id
      JOIN sous_traitants st ON pe.sous_traitant_id = st.id
      WHERE 1=1
    `
    
    if (start && end) {
      query += ` AND date_debut >= '${start}' AND date_fin <= '${end}'`
    }
    
    query += ` ORDER BY pe.date_debut ASC`
    
    const result = await DB.prepare(query).all()
    
    return c.json({ success: true, data: result.results })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// GET /api/annexe2/export-csv - Export ANNEXE 2 GIRASOLE (CSV)
app.get('/api/annexe2/export-csv', async (c) => {
  const { DB } = c.env
  const { sous_traitant, statut } = c.req.query()
  
  try {
    // Query complexe pour récupérer toutes les données ANNEXE 2
    let query = `
      SELECT 
        c.id_ref as "ID référent",
        c.nom as "Nom des projets",
        c.puissance_kwc as "Puissance EXE",
        c.spv as "SPV",
        c.latitude as "Latitude",
        c.longitude as "Longitude",
        c.adresse as "Adresse",
        c.dept as "Dept",
        c.type_centrale as "Type de chantier",
        c.installateur as "Installateur",
        om.date_mission as "Date réelle démarrage centrale PV",
        om.date_validation as "Date réelle fin centrale PV",
        '' as "Entreprise",
        '' as "Date de réception réelle des DRE 155/162",
        c.date_mes as "Date MES",
        c.si as "SI",
        c.panneaux as "Panneaux",
        CASE WHEN c.audit_toiture = 'X' THEN 'OUI' ELSE 'NON' END as "Audit en toiture",
        CASE WHEN c.audit_hors_toiture = 'X' THEN 'NON' ELSE 'OUI' END as "Audit hors toiture",
        '' as "Sous performance non identifié",
        st.nom_entreprise as "Sous-traitant"
      FROM centrales c
      LEFT JOIN ordres_mission om ON c.id = om.centrale_id
      LEFT JOIN sous_traitants st ON om.sous_traitant_id = st.id
      WHERE 1=1
    `
    
    if (sous_traitant) {
      query += ` AND st.nom_entreprise = '${sous_traitant}'`
    }
    
    if (statut) {
      query += ` AND om.statut = '${statut}'`
    } else {
      query += ` AND om.statut IN ('TERMINE', 'VALIDE')`
    }
    
    query += ` ORDER BY c.nom ASC`
    
    const result = await DB.prepare(query).all()
    
    if (!result.results || result.results.length === 0) {
      return c.text('Aucune mission complétée trouvée.', 404)
    }
    
    // Générer CSV avec en-têtes
    const headers = [
      'ID référent', 'Nom des projets', 'Puissance EXE', 'SPV', 'Latitude', 'Longitude',
      'Adresse', 'Dept', 'Type de chantier', 'Installateur',
      'Date réelle démarrage centrale PV', 'Date réelle fin centrale PV',
      'Entreprise', 'Date de réception réelle des DRE 155/162', 'Date MES',
      'SI', 'Panneaux', 'Audit en toiture', 'Audit hors toiture',
      'Sous performance non identifié', 'Sous-traitant',
      'NF C 15-100 (O/N)', 'NF C 15-100 Description',
      'UTE C 15-712 (O/N)', 'UTE C 15-712 Description',
      'DTU 40.35 (O/N)', 'DTU 40.35 Description',
      'Respect ETN', 'Respect ETN Description',
      'Respect notice montage panneaux', 'Respect notice montage Description',
      'Bonnes pratiques constatées (O/N)', 'Bonnes pratiques Description',
      'Mauvaises pratiques constatées (O/N)', 'Mauvaises pratiques Description',
      'Autocontrôle présent (O/N)', 'Autocontrôle complet (O/N)', 'Autocontrôle Description',
      'PV réception lot PV présent (O/N)', 'PV réception lot PV correct (O/N)', 'PV réception Description',
      'CR visite chantier présent (O/N)',
      'Tranchées respectent CDC GIRASOLE (O/N)', 'Tranchées Description',
      'Documents GIRASOLE signalent écarts (O/N)', 'Écarts Description',
      'Documents GIRASOLE signalent pratiques (O/N)', 'Pratiques Description'
    ]
    
    let csv = headers.join(';') + '\n'
    
    // Ajouter les données (pour l'instant sans analyse checklist détaillée)
    for (const row of result.results) {
      const values = [
        row['ID référent'] || '',
        row['Nom des projets'] || '',
        row['Puissance EXE'] || '',
        row['SPV'] || '',
        row['Latitude'] || '',
        row['Longitude'] || '',
        row['Adresse'] || '',
        row['Dept'] || '',
        row['Type de chantier'] || '',
        row['Installateur'] || '',
        row['Date réelle démarrage centrale PV'] || '',
        row['Date réelle fin centrale PV'] || '',
        row['Entreprise'] || '',
        row['Date de réception réelle des DRE 155/162'] || '',
        row['Date MES'] || '',
        row['SI'] || '',
        row['Panneaux'] || '',
        row['Audit en toiture'] || 'NON',
        row['Audit hors toiture'] || 'OUI',
        row['Sous performance non identifié'] || '',
        row['Sous-traitant'] || '',
        // Colonnes à compléter depuis checklist_items (à développer)
        '', '', '', '', '', '', '', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '', '', '', '', ''
      ]
      
      // Échapper les guillemets et virgules dans CSV
      const escapedValues = values.map(v => {
        const str = String(v || '')
        if (str.includes(';') || str.includes('"') || str.includes('\n')) {
          return '"' + str.replace(/"/g, '""') + '"'
        }
        return str
      })
      
      csv += escapedValues.join(';') + '\n'
    }
    
    // Retourner CSV avec bon content-type
    const date = new Date().toISOString().split('T')[0]
    return c.text(csv, 200, {
      'Content-Type': 'text/csv; charset=utf-8',
      'Content-Disposition': `attachment; filename="ANNEXE2_GIRASOLE_${date}.csv"`
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// GET /api/ordres-mission/:id/document - Générer ordre de mission PDF/HTML
app.get('/api/ordres-mission/:id/document', async (c) => {
  const { DB } = c.env
  const id = c.req.param('id')
  
  try {
    // Récupérer ordre de mission complet
    const mission = await DB.prepare(`
      SELECT 
        om.*,
        c.nom as centrale_nom,
        c.type as centrale_type,
        c.puissance_kwc,
        c.localisation,
        t.prenom as technicien_prenom,
        t.nom as technicien_nom,
        t.email as technicien_email,
        t.telephone as technicien_telephone,
        st.nom_entreprise,
        st.email_contact as entreprise_email,
        st.telephone as entreprise_telephone,
        st.adresse as entreprise_adresse
      FROM ordres_mission om
      JOIN centrales c ON om.centrale_id = c.id
      JOIN techniciens t ON om.technicien_id = t.id
      JOIN sous_traitants st ON om.sous_traitant_id = st.id
      WHERE om.id = ?
    `).bind(id).first()
    
    if (!mission) {
      return c.json({ success: false, error: 'Ordre de mission non trouvé' }, 404)
    }
    
    const dateFormatee = new Date(mission.date_mission).toLocaleDateString('fr-FR', { 
      weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' 
    })
    
    const qrCodeData = JSON.stringify({
      mission_id: mission.id,
      centrale_id: mission.centrale_id,
      technicien_id: mission.technicien_id,
      date: mission.date_mission
    })
    
    // Générer QR Code URL (utilise un service public)
    const qrCodeUrl = `https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=${encodeURIComponent(qrCodeData)}`
    
    return c.html(`
      <!DOCTYPE html>
      <html lang="fr">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ordre de Mission #${mission.id} - ${mission.centrale_nom}</title>
        <style>
          @media print {
            body { margin: 0; }
            .no-print { display: none; }
            @page { margin: 1cm; }
          }
          body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 21cm;
            margin: 0 auto;
            padding: 20px;
            background: white;
          }
          .header {
            border-bottom: 4px solid #2563eb;
            padding-bottom: 20px;
            margin-bottom: 30px;
          }
          .header h1 {
            color: #2563eb;
            margin: 0 0 5px 0;
            font-size: 28px;
          }
          .header .subtitle {
            color: #666;
            font-size: 14px;
          }
          .section {
            margin-bottom: 25px;
            padding: 15px;
            background: #f8fafc;
            border-left: 4px solid #2563eb;
          }
          .section h2 {
            color: #2563eb;
            margin: 0 0 15px 0;
            font-size: 18px;
            text-transform: uppercase;
          }
          .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
          }
          .info-item {
            margin-bottom: 10px;
          }
          .info-label {
            font-weight: bold;
            color: #475569;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
          }
          .info-value {
            color: #1e293b;
            font-size: 16px;
            margin-top: 3px;
          }
          .checklist {
            background: white;
            padding: 20px;
            border: 1px solid #e2e8f0;
          }
          .checklist-category {
            margin-bottom: 20px;
          }
          .checklist-category h3 {
            background: #2563eb;
            color: white;
            padding: 8px 15px;
            margin: 0 0 10px 0;
            font-size: 14px;
          }
          .checklist-item {
            padding: 8px 15px;
            border-bottom: 1px solid #e2e8f0;
            display: flex;
            align-items: center;
          }
          .checkbox {
            width: 20px;
            height: 20px;
            border: 2px solid #cbd5e1;
            margin-right: 15px;
            flex-shrink: 0;
          }
          .qr-section {
            text-align: center;
            padding: 20px;
            background: #f8fafc;
            border: 2px dashed #cbd5e1;
          }
          .footer {
            margin-top: 40px;
            padding-top: 20px;
            border-top: 2px solid #e2e8f0;
            text-align: center;
            color: #64748b;
            font-size: 12px;
          }
          .btn-print {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #2563eb;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
          }
          .btn-print:hover {
            background: #1d4ed8;
          }
        </style>
      </head>
      <body>
        <button class="btn-print no-print" onclick="window.print()">🖨️ Imprimer / Sauvegarder PDF</button>
        
        <div class="header">
          <h1>📋 ORDRE DE MISSION</h1>
          <div class="subtitle">Mission GIRASOLE 2025 - Diagnostic Photovoltaïque</div>
          <div class="subtitle">Ordre n°${String(mission.id).padStart(4, '0')} - Créé le ${new Date(mission.date_creation).toLocaleDateString('fr-FR')}</div>
        </div>

        <!-- Informations Centrale -->
        <div class="section">
          <h2>🏭 Centrale Photovoltaïque</h2>
          <div class="info-grid">
            <div class="info-item">
              <div class="info-label">Nom Installation</div>
              <div class="info-value">${mission.centrale_nom}</div>
            </div>
            <div class="info-item">
              <div class="info-label">Type</div>
              <div class="info-value">${mission.centrale_type}</div>
            </div>
            <div class="info-item">
              <div class="info-label">Puissance Installée</div>
              <div class="info-value">${mission.puissance_kwc} kWc</div>
            </div>
            <div class="info-item">
              <div class="info-label">Localisation</div>
              <div class="info-value">${mission.localisation || 'Non renseignée'}</div>
            </div>
          </div>
        </div>

        <!-- Informations Technicien -->
        <div class="section">
          <h2>👤 Technicien Assigné</h2>
          <div class="info-grid">
            <div class="info-item">
              <div class="info-label">Nom Complet</div>
              <div class="info-value">${mission.technicien_prenom} ${mission.technicien_nom}</div>
            </div>
            <div class="info-item">
              <div class="info-label">Entreprise</div>
              <div class="info-value">${mission.nom_entreprise}</div>
            </div>
            <div class="info-item">
              <div class="info-label">Email</div>
              <div class="info-value">${mission.technicien_email || 'N/A'}</div>
            </div>
            <div class="info-item">
              <div class="info-label">Téléphone</div>
              <div class="info-value">${mission.technicien_telephone || 'N/A'}</div>
            </div>
          </div>
        </div>

        <!-- Informations Mission -->
        <div class="section">
          <h2>📅 Planification</h2>
          <div class="info-grid">
            <div class="info-item">
              <div class="info-label">Date Mission</div>
              <div class="info-value">${dateFormatee}</div>
            </div>

            <div class="info-item">
              <div class="info-label">Statut</div>
              <div class="info-value">${mission.statut}</div>
            </div>
          </div>
          ${mission.commentaires ? `
            <div class="info-item" style="margin-top: 15px">
              <div class="info-label">Commentaires</div>
              <div class="info-value">${mission.commentaires}</div>
            </div>
          ` : ''}
        </div>

        <!-- Checklist V4 -->
        <div class="section">
          <h2>✅ Checklist Audit V4 (54 Points CDC)</h2>
          <div class="checklist">
            <div class="checklist-category">
              <h3>📄 1. DOCUMENTATION (8 points)</h3>
              <div class="checklist-item"><div class="checkbox"></div> Plaques signalétiques modules</div>
              <div class="checklist-item"><div class="checkbox"></div> Plaque onduleur(s)</div>
              <div class="checklist-item"><div class="checkbox"></div> Schéma électrique unifilaire</div>
              <div class="checklist-item"><div class="checkbox"></div> Plan implantation modules</div>
              <div class="checklist-item"><div class="checkbox"></div> Attestation Consuel</div>
              <div class="checklist-item"><div class="checkbox"></div> Contrat de raccordement</div>
              <div class="checklist-item"><div class="checkbox"></div> Garanties constructeurs</div>
              <div class="checklist-item"><div class="checkbox"></div> Rapports maintenance existants</div>
            </div>

            <div class="checklist-category">
              <h3>⚡ 2. CONTRÔLES ÉLECTRIQUES (12 points)</h3>
              <div class="checklist-item"><div class="checkbox"></div> Tension Voc à vide (strings)</div>
              <div class="checklist-item"><div class="checkbox"></div> Courant Isc court-circuit</div>
              <div class="checklist-item"><div class="checkbox"></div> Courbes I-V production</div>
              <div class="checklist-item"><div class="checkbox"></div> Courbes I-V sombres</div>
              <div class="checklist-item"><div class="checkbox"></div> Test isolement (≥1 MΩ)</div>
              <div class="checklist-item"><div class="checkbox"></div> Continuité terre/masses</div>
              <div class="checklist-item"><div class="checkbox"></div> Polarité connexions DC</div>
              <div class="checklist-item"><div class="checkbox"></div> Serrage bornes (couple)</div>
              <div class="checklist-item"><div class="checkbox"></div> État connecteurs MC4</div>
              <div class="checklist-item"><div class="checkbox"></div> Protection surtensions</div>
              <div class="checklist-item"><div class="checkbox"></div> Fonctionnement onduleur(s)</div>
              <div class="checklist-item"><div class="checkbox"></div> Production instantanée</div>
            </div>

            <div class="checklist-category">
              <h3>🔌 3. TABLEAUX & PROTECTIONS (8 points)</h3>
              <div class="checklist-item"><div class="checkbox"></div> État tableau AC</div>
              <div class="checklist-item"><div class="checkbox"></div> État tableau DC (boîtes jonction)</div>
              <div class="checklist-item"><div class="checkbox"></div> Calibrage disjoncteurs</div>
              <div class="checklist-item"><div class="checkbox"></div> Parafoudres opérationnels</div>
              <div class="checklist-item"><div class="checkbox"></div> Étiquetage circuits</div>
              <div class="checklist-item"><div class="checkbox"></div> Ventilation locaux techniques</div>
              <div class="checklist-item"><div class="checkbox"></div> Signalétique sécurité</div>
              <div class="checklist-item"><div class="checkbox"></div> Accès/consignation</div>
            </div>

            <div class="checklist-category">
              <h3>🔧 4. CÂBLAGE & CHEMINEMENTS (7 points)</h3>
              <div class="checklist-item"><div class="checkbox"></div> État câbles DC (UV, rongeurs)</div>
              <div class="checklist-item"><div class="checkbox"></div> Fixations chemins câbles</div>
              <div class="checklist-item"><div class="checkbox"></div> Passages traversées étanches</div>
              <div class="checklist-item"><div class="checkbox"></div> Rayon courbure respecté</div>
              <div class="checklist-item"><div class="checkbox"></div> Protection mécanique adéquate</div>
              <div class="checklist-item"><div class="checkbox"></div> Tranchées/enterrés conformes</div>
              <div class="checklist-item"><div class="checkbox"></div> Distance sécurité respectée</div>
            </div>

            <div class="checklist-category">
              <h3>☀️ 5. MODULES PHOTOVOLTAÏQUES (10 points)</h3>
              <div class="checklist-item"><div class="checkbox"></div> Inspection visuelle (fissures, délamination)</div>
              <div class="checklist-item"><div class="checkbox"></div> Encrassement/salissures</div>
              <div class="checklist-item"><div class="checkbox"></div> Points chauds (si thermographie)</div>
              <div class="checklist-item"><div class="checkbox"></div> Diodes bypass fonctionnelles</div>
              <div class="checklist-item"><div class="checkbox"></div> Boîtiers jonction modules</div>
              <div class="checklist-item"><div class="checkbox"></div> État cadres/joints</div>
              <div class="checklist-item"><div class="checkbox"></div> Fixations/clips</div>
              <div class="checklist-item"><div class="checkbox"></div> Mise à la terre modules</div>
              <div class="checklist-item"><div class="checkbox"></div> Ombrage(s) identifié(s)</div>
              <div class="checklist-item"><div class="checkbox"></div> Homogénéité installation</div>
            </div>

            <div class="checklist-category">
              <h3>🏗️ 6. STRUCTURES & ANCRAGE (5 points)</h3>
              <div class="checklist-item"><div class="checkbox"></div> Corrosion structures</div>
              <div class="checklist-item"><div class="checkbox"></div> Boulonnerie/serrage</div>
              <div class="checklist-item"><div class="checkbox"></div> Niveau/alignement</div>
              <div class="checklist-item"><div class="checkbox"></div> Ancrage toiture/sol</div>
              <div class="checklist-item"><div class="checkbox"></div> Drainage eaux pluviales</div>
            </div>

            <div class="checklist-category">
              <h3>🏠 7. SUPPORT TOITURE (si applicable - 4 points)</h3>
              <div class="checklist-item"><div class="checkbox"></div> État couverture (tuiles, bac acier)</div>
              <div class="checklist-item"><div class="checkbox"></div> Étanchéité traversées</div>
              <div class="checklist-item"><div class="checkbox"></div> Charpente/structure porteuse</div>
              <div class="checklist-item"><div class="checkbox"></div> Infiltrations eau</div>
            </div>
          </div>
        </div>

        <!-- QR Code -->
        <div class="qr-section">
          <h3 style="margin-top: 0">📱 QR Code Mission</h3>
          <p style="color: #64748b; font-size: 14px">Scanner pour accès rapide aux données mission</p>
          <img src="${qrCodeUrl}" alt="QR Code Mission" style="margin: 15px 0">
          <p style="color: #94a3b8; font-size: 12px">Mission ID: #${String(mission.id).padStart(4, '0')}</p>
        </div>

        <div class="footer">
          <p><strong>Diagnostic Photovoltaïque - Adrien Pappalardo</strong></p>
          <p>Mission GIRASOLE 2025 - Audit 52 Centrales Photovoltaïques</p>
          <p>Document généré le ${new Date().toLocaleString('fr-FR')}</p>
        </div>
      </body>
      </html>
    `)
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// GET /api/stats/planning - Stats planning
app.get('/api/stats/planning', async (c) => {
  const { DB } = c.env
  
  try {
    // Centrales non attribuées
    const nonAttribuees = await DB.prepare(`
      SELECT COUNT(*) as count
      FROM centrales c
      WHERE NOT EXISTS (
        SELECT 1 FROM ordres_mission om 
        WHERE om.centrale_id = c.id AND om.statut NOT IN ('ANNULE')
      )
    `).first()
    
    // Missions par statut
    const parStatut = await DB.prepare(`
      SELECT statut, COUNT(*) as count
      FROM ordres_mission
      GROUP BY statut
    `).all()
    
    // Techniciens disponibles
    const techniciensDisponibles = await DB.prepare(`
      SELECT COUNT(*) as count
      FROM techniciens
      WHERE statut = 'DISPONIBLE'
    `).first()
    
    // Missions par sous-traitant
    const parSousTraitant = await DB.prepare(`
      SELECT 
        st.nom_entreprise,
        COUNT(om.id) as nb_missions,
        SUM(CASE WHEN om.statut IN ('PLANIFIE', 'CONFIRME', 'EN_COURS') THEN 1 ELSE 0 END) as missions_actives
      FROM sous_traitants st
      LEFT JOIN ordres_mission om ON st.id = om.sous_traitant_id
      WHERE st.statut = 'ACTIF'
      GROUP BY st.id
    `).all()
    
    return c.json({ 
      success: true, 
      data: {
        centrales_non_attribuees: nonAttribuees?.count || 0,
        techniciens_disponibles: techniciensDisponibles?.count || 0,
        missions_par_statut: parStatut.results,
        missions_par_sous_traitant: parSousTraitant.results
      }
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// ========================================
// API ROUTES - PLANNING GIRASOLE
// ========================================

// GET /api/planning/centrales - Liste centrales avec distances Toulouse/Lyon
app.get('/api/planning/centrales', async (c) => {
  const { DB } = c.env
  
  try {
    // Récupérer toutes les centrales avec distances GPS réelles
    const centrales = await DB.prepare(`
      SELECT * FROM centrales 
      WHERE distance_toulouse_km IS NOT NULL OR distance_lyon_km IS NOT NULL
      ORDER BY 
        CASE 
          WHEN distance_toulouse_km IS NULL THEN distance_lyon_km
          WHEN distance_lyon_km IS NULL THEN distance_toulouse_km
          WHEN distance_toulouse_km < distance_lyon_km THEN distance_toulouse_km
          ELSE distance_lyon_km
        END ASC
    `).all()
    
    // Ajouter distance_km calculée côté JavaScript
    const centralesAvecDistance = centrales.results.map((c: any) => {
      const distToulouse = c.distance_toulouse_km || 999999
      const distLyon = c.distance_lyon_km || 999999
      return {
        ...c,
        distance_km: Math.min(distToulouse, distLyon)
      }
    })
    
    return c.json({ 
      success: true, 
      data: centralesAvecDistance,
      total: centralesAvecDistance.length
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// POST /api/planning/export-batch-missions - Créer ordres de mission en batch
app.post('/api/planning/export-batch-missions', async (c) => {
  const { DB } = c.env
  
  try {
    const body = await c.req.json()
    const { centrale_ids, technicien_id, sous_traitant_id, date_debut } = body
    
    if (!centrale_ids || !Array.isArray(centrale_ids) || !technicien_id || !sous_traitant_id || !date_debut) {
      return c.json({ success: false, error: 'centrale_ids (array), technicien_id, sous_traitant_id et date_debut requis' }, 400)
    }
    
    const created = []
    const errors = []
    let currentDate = new Date(date_debut)
    
    for (const centraleId of centrale_ids) {
      try {
        // Vérifier si centrale existe et n'a pas déjà de mission
        const existing = await DB.prepare(`
          SELECT id FROM ordres_mission 
          WHERE centrale_id = ? AND statut NOT IN ('ANNULE')
        `).bind(centraleId).first()
        
        if (existing) {
          errors.push({ centrale_id: centraleId, error: 'Mission déjà existante' })
          continue
        }
        
        // Créer ordre de mission
        const result = await DB.prepare(`
          INSERT INTO ordres_mission (centrale_id, technicien_id, sous_traitant_id, date_mission, heure_debut, duree_estimee_heures)
          VALUES (?, ?, ?, ?, '08:00', 7.0)
        `).bind(centraleId, technicien_id, sous_traitant_id, currentDate.toISOString().split('T')[0]).run()
        
        // Mettre à jour statut centrale
        await DB.prepare(`UPDATE centrales SET statut = 'EN_COURS' WHERE id = ?`).bind(centraleId).run()
        
        created.push({ 
          centrale_id: centraleId, 
          mission_id: result.meta.last_row_id,
          date: currentDate.toISOString().split('T')[0]
        })
        
        // Incrémenter date (1 jour par mission)
        currentDate.setDate(currentDate.getDate() + 1)
        
      } catch (error) {
        errors.push({ centrale_id: centraleId, error: String(error) })
      }
    }
    
    return c.json({ 
      success: true, 
      data: {
        created: created.length,
        errors: errors.length,
        details: { created, errors }
      }
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// GET /api/planning/stats - Statistiques planning
app.get('/api/planning/stats', async (c) => {
  const { DB } = c.env
  
  try {
    // Total centrales
    const totalCentrales = await DB.prepare(`SELECT COUNT(*) as count FROM centrales`).first()
    
    // Centrales par statut
    const parStatut = await DB.prepare(`
      SELECT statut, COUNT(*) as count FROM centrales GROUP BY statut
    `).all()
    
    // Puissance totale
    const puissanceTotale = await DB.prepare(`
      SELECT SUM(puissance_kwc) as total FROM centrales
    `).first()
    
    // Missions actives
    const missionsActives = await DB.prepare(`
      SELECT COUNT(*) as count FROM ordres_mission WHERE statut NOT IN ('ANNULE', 'VALIDE')
    `).first()
    
    return c.json({
      success: true,
      data: {
        total_centrales: totalCentrales?.count || 0,
        puissance_totale_kwc: puissanceTotale?.total || 0,
        missions_actives: missionsActives?.count || 0,
        centrales_par_statut: parStatut.results
      }
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// ========================================
// API ROUTES - CHECKLIST TEMPS RÉEL
// ========================================

// POST /api/admin/init-all-tables - Initialiser TOUTES les tables (migrations 0001, 0002, 0003)
app.post('/api/admin/init-all-tables', async (c) => {
  const { DB } = c.env
  
  try {
    // Migration 0001: Centrales (lecture du fichier de migration)
    const migration0001Statements = `
      CREATE TABLE IF NOT EXISTS centrales (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nom TEXT UNIQUE NOT NULL,
        type TEXT NOT NULL CHECK(type IN ('SOL', 'TOITURE')),
        puissance_kwc REAL,
        localisation TEXT,
        statut TEXT DEFAULT 'A_AUDITER' CHECK(statut IN ('A_AUDITER', 'EN_COURS', 'TERMINE', 'VALIDE')),
        date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
        date_audit DATETIME,
        date_validation DATETIME
      );
      
      CREATE TABLE IF NOT EXISTS retours_json_old (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        centrale_id INTEGER NOT NULL,
        date_upload DATETIME DEFAULT CURRENT_TIMESTAMP,
        json_data TEXT NOT NULL,
        taille_bytes INTEGER,
        nb_photos INTEGER,
        commentaire TEXT,
        FOREIGN KEY (centrale_id) REFERENCES centrales(id) ON DELETE CASCADE
      );
      
      CREATE INDEX IF NOT EXISTS idx_centrales_statut ON centrales(statut);
      CREATE INDEX IF NOT EXISTS idx_centrales_type ON centrales(type);
      CREATE INDEX IF NOT EXISTS idx_retours_centrale ON retours_json_old(centrale_id);
    `.split(';').filter(s => s.trim());
    
    for (const stmt of migration0001Statements) {
      if (stmt.trim()) {
        await DB.prepare(stmt).run();
      }
    }
    
    // Migration 0002: Planning
    const migration0002Statements = `
      CREATE TABLE IF NOT EXISTS sous_traitants (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nom_entreprise TEXT UNIQUE NOT NULL,
        email_contact TEXT,
        telephone TEXT,
        adresse TEXT,
        siret TEXT,
        contact_principal TEXT,
        statut TEXT DEFAULT 'ACTIF' CHECK(statut IN ('ACTIF', 'INACTIF', 'SUSPENDU')),
        date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
        date_modification DATETIME DEFAULT CURRENT_TIMESTAMP,
        notes TEXT
      );
      
      CREATE TABLE IF NOT EXISTS techniciens (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sous_traitant_id INTEGER NOT NULL,
        prenom TEXT NOT NULL,
        nom TEXT NOT NULL,
        email TEXT UNIQUE,
        telephone TEXT,
        statut TEXT DEFAULT 'DISPONIBLE' CHECK(statut IN ('DISPONIBLE', 'OCCUPE', 'INDISPONIBLE', 'CONGE')),
        date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
        date_modification DATETIME DEFAULT CURRENT_TIMESTAMP,
        notes TEXT,
        FOREIGN KEY (sous_traitant_id) REFERENCES sous_traitants(id) ON DELETE CASCADE
      );
      
      CREATE TABLE IF NOT EXISTS ordres_mission (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        centrale_id INTEGER NOT NULL,
        technicien_id INTEGER NOT NULL,
        sous_traitant_id INTEGER NOT NULL,
        date_mission DATE NOT NULL,
        heure_debut TIME,
        heure_fin TIME,
        duree_estimee_heures REAL DEFAULT 7.0,
        statut TEXT DEFAULT 'PLANIFIE' CHECK(statut IN ('PLANIFIE', 'CONFIRME', 'EN_COURS', 'TERMINE', 'VALIDE', 'ANNULE', 'REPORTE')),
        checklist_generee BOOLEAN DEFAULT 0,
        ordre_mission_pdf TEXT,
        date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
        date_validation DATETIME,
        date_annulation DATETIME,
        commentaires TEXT,
        raison_annulation TEXT,
        FOREIGN KEY (centrale_id) REFERENCES centrales(id) ON DELETE CASCADE,
        FOREIGN KEY (technicien_id) REFERENCES techniciens(id) ON DELETE CASCADE,
        FOREIGN KEY (sous_traitant_id) REFERENCES sous_traitants(id) ON DELETE CASCADE,
        UNIQUE(centrale_id)
      );
      
      CREATE TABLE IF NOT EXISTS planning_events (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ordre_mission_id INTEGER NOT NULL,
        centrale_id INTEGER NOT NULL,
        technicien_id INTEGER NOT NULL,
        sous_traitant_id INTEGER NOT NULL,
        date_debut DATETIME NOT NULL,
        date_fin DATETIME NOT NULL,
        titre TEXT NOT NULL,
        description TEXT,
        couleur TEXT DEFAULT '#3b82f6',
        statut TEXT DEFAULT 'PLANIFIE',
        FOREIGN KEY (ordre_mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE,
        FOREIGN KEY (centrale_id) REFERENCES centrales(id) ON DELETE CASCADE,
        FOREIGN KEY (technicien_id) REFERENCES techniciens(id) ON DELETE CASCADE,
        FOREIGN KEY (sous_traitant_id) REFERENCES sous_traitants(id) ON DELETE CASCADE
      );
      
      CREATE INDEX IF NOT EXISTS idx_techniciens_sous_traitant ON techniciens(sous_traitant_id);
      CREATE INDEX IF NOT EXISTS idx_techniciens_statut ON techniciens(statut);
      CREATE INDEX IF NOT EXISTS idx_ordres_centrale ON ordres_mission(centrale_id);
      CREATE INDEX IF NOT EXISTS idx_ordres_technicien ON ordres_mission(technicien_id);
      CREATE INDEX IF NOT EXISTS idx_ordres_sous_traitant ON ordres_mission(sous_traitant_id);
      CREATE INDEX IF NOT EXISTS idx_ordres_date ON ordres_mission(date_mission);
      CREATE INDEX IF NOT EXISTS idx_ordres_statut ON ordres_mission(statut);
      CREATE INDEX IF NOT EXISTS idx_planning_date ON planning_events(date_debut, date_fin);
      CREATE INDEX IF NOT EXISTS idx_planning_technicien ON planning_events(technicien_id);
    `.split(';').filter(s => s.trim());
    
    for (const stmt of migration0002Statements) {
      if (stmt.trim()) {
        await DB.prepare(stmt).run();
      }
    }
    
    // Migration 0003: Checklist temps réel
    const migration0003Statements = `
      CREATE TABLE IF NOT EXISTS checklist_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ordre_mission_id INTEGER NOT NULL,
        categorie TEXT NOT NULL CHECK(categorie IN ('DOC', 'ELEC', 'TABLEAUX', 'CABLAGE', 'MODULES', 'STRUCTURES', 'TOITURE')),
        item_numero INTEGER NOT NULL,
        item_texte TEXT NOT NULL,
        statut TEXT DEFAULT 'NON_VERIFIE' CHECK(statut IN ('NON_VERIFIE', 'CONFORME', 'NON_CONFORME', 'NA', 'ANOMALIE_MINEURE', 'ANOMALIE_MAJEURE')),
        conformite BOOLEAN,
        commentaire TEXT,
        photo_base64 TEXT,
        photo_filename TEXT,
        mesure_valeur TEXT,
        mesure_unite TEXT,
        date_verification DATETIME DEFAULT CURRENT_TIMESTAMP,
        date_modification DATETIME DEFAULT CURRENT_TIMESTAMP,
        technicien_nom TEXT,
        FOREIGN KEY (ordre_mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE,
        UNIQUE(ordre_mission_id, categorie, item_numero)
      );
      
      CREATE TABLE IF NOT EXISTS retours_json (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ordre_mission_id INTEGER NOT NULL,
        centrale_id INTEGER NOT NULL,
        technicien_id INTEGER NOT NULL,
        json_data TEXT NOT NULL,
        taille_mo REAL,
        nb_photos INTEGER,
        date_upload DATETIME DEFAULT CURRENT_TIMESTAMP,
        statut TEXT DEFAULT 'RECU' CHECK(statut IN ('RECU', 'EN_ANALYSE', 'VALIDE', 'REJETE')),
        rapport_final_genere BOOLEAN DEFAULT 0,
        date_rapport_final DATETIME,
        FOREIGN KEY (ordre_mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE,
        FOREIGN KEY (centrale_id) REFERENCES centrales(id) ON DELETE CASCADE,
        FOREIGN KEY (technicien_id) REFERENCES techniciens(id) ON DELETE CASCADE
      );
      
      CREATE INDEX IF NOT EXISTS idx_checklist_mission ON checklist_items(ordre_mission_id);
      CREATE INDEX IF NOT EXISTS idx_checklist_categorie ON checklist_items(categorie);
      CREATE INDEX IF NOT EXISTS idx_checklist_statut ON checklist_items(statut);
      CREATE INDEX IF NOT EXISTS idx_retours_mission ON retours_json(ordre_mission_id);
      CREATE INDEX IF NOT EXISTS idx_retours_centrale ON retours_json(centrale_id);
      CREATE INDEX IF NOT EXISTS idx_retours_date ON retours_json(date_upload);
    `.split(';').filter(s => s.trim());
    
    for (const stmt of migration0003Statements) {
      if (stmt.trim()) {
        await DB.prepare(stmt).run();
      }
    }
    
    return c.json({ 
      success: true, 
      message: 'Toutes les tables créées avec succès (migrations 0001, 0002, 0003)' 
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// POST /api/admin/init-migration - Initialiser table checklist (admin)
app.post('/api/admin/init-migration', async (c) => {
  const { DB } = c.env
  
  try {
    // Créer table checklist_items
    await DB.prepare(`
      CREATE TABLE IF NOT EXISTS checklist_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ordre_mission_id INTEGER NOT NULL,
        categorie TEXT NOT NULL CHECK(categorie IN ('DOC', 'ELEC', 'TABLEAUX', 'CABLAGE', 'MODULES', 'STRUCTURES', 'TOITURE')),
        item_numero INTEGER NOT NULL,
        item_texte TEXT NOT NULL,
        statut TEXT DEFAULT 'NON_VERIFIE' CHECK(statut IN ('NON_VERIFIE', 'CONFORME', 'NON_CONFORME', 'NA', 'ANOMALIE_MINEURE', 'ANOMALIE_MAJEURE')),
        conformite BOOLEAN,
        commentaire TEXT,
        photo_base64 TEXT,
        photo_filename TEXT,
        mesure_valeur TEXT,
        mesure_unite TEXT,
        date_verification DATETIME DEFAULT CURRENT_TIMESTAMP,
        date_modification DATETIME DEFAULT CURRENT_TIMESTAMP,
        technicien_nom TEXT,
        FOREIGN KEY (ordre_mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE,
        UNIQUE(ordre_mission_id, categorie, item_numero)
      )
    `).run()
    
    // Créer table retours_json
    await DB.prepare(`
      CREATE TABLE IF NOT EXISTS retours_json (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ordre_mission_id INTEGER NOT NULL,
        centrale_id INTEGER NOT NULL,
        technicien_id INTEGER NOT NULL,
        json_data TEXT NOT NULL,
        taille_mo REAL,
        nb_photos INTEGER,
        date_upload DATETIME DEFAULT CURRENT_TIMESTAMP,
        statut TEXT DEFAULT 'RECU' CHECK(statut IN ('RECU', 'EN_ANALYSE', 'VALIDE', 'REJETE')),
        rapport_final_genere BOOLEAN DEFAULT 0,
        date_rapport_final DATETIME,
        FOREIGN KEY (ordre_mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE,
        FOREIGN KEY (centrale_id) REFERENCES centrales(id) ON DELETE CASCADE,
        FOREIGN KEY (technicien_id) REFERENCES techniciens(id) ON DELETE CASCADE
      )
    `).run()
    
    // Créer indexes
    await DB.prepare(`CREATE INDEX IF NOT EXISTS idx_checklist_mission ON checklist_items(ordre_mission_id)`).run()
    await DB.prepare(`CREATE INDEX IF NOT EXISTS idx_checklist_categorie ON checklist_items(categorie)`).run()
    await DB.prepare(`CREATE INDEX IF NOT EXISTS idx_retours_mission ON retours_json(ordre_mission_id)`).run()
    
    return c.json({ success: true, message: 'Tables checklist_items et retours_json créées avec succès' })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// GET /api/checklist/:mission_id - Récupérer checklist mission
app.get('/api/checklist/:mission_id', async (c) => {
  const { DB } = c.env
  const missionId = c.req.param('mission_id')
  
  try {
    const result = await DB.prepare(`
      SELECT * FROM checklist_items 
      WHERE ordre_mission_id = ?
      ORDER BY categorie, item_numero
    `).bind(missionId).all()
    
    return c.json({ success: true, data: result.results })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// POST /api/checklist/:mission_id/init - Initialiser checklist vide pour mission
app.post('/api/checklist/:mission_id/init', async (c) => {
  const { DB } = c.env
  const missionId = parseInt(c.req.param('mission_id'))
  
  try {
    // Récupérer type centrale pour checklist conditionnelle
    const mission = await DB.prepare(`
      SELECT c.type FROM ordres_mission om
      JOIN centrales c ON om.centrale_id = c.id
      WHERE om.id = ?
    `).bind(missionId).first()
    
    const isToiture = mission?.type === 'TOITURE'
    
    // Structure checklist CDC GIRASOLE 2025 (40 points AUDIT VISUEL + 12 TOITURE)
    const checklistStructure = [
      // 1. DOCUMENTATION (6 points)
      { cat: 'DOCUMENTATION', items: [
        'Présence autocontrôle renseigné installateur',
        'PV réception lot PV signé (GIRASOLE + installateur)',
        'CR visite chantier lot PV (GIRASOLE)',
        'Plans TQC présents sur place',
        'Attestation DRE bureau contrôle',
        'Plans électriques tel que construit'
      ]},
      // 2. NORMES NF C 15-100 + UTE C 15-712 (10 points)
      { cat: 'NORMES_ELEC', items: [
        'Réglages AGCP conformes aux plans',
        'Protection différentielle 30mA fonctionnelle',
        'Disjoncteurs calibrage correct',
        'Parafoudres DC/AC en bon état',
        'Signalétique circuits présente et conforme',
        'Repérage équipements (inscrit sur équipement)',
        'Mesure continuité terres conforme',
        'Polarité strings (+ et -) correcte',
        'Couleurs câbles DC -/+ différentes',
        'Test isolement DC (> 1 MΩ)'
      ]},
      // 3. BONNES PRATIQUES CABLAGE (8 points)
      { cat: 'CABLAGE', items: [
        'Fixations chemin câbles (qualité + méthode)',
        'Type cheminement câbles (galvanisé chaud/froid)',
        'Protections mécaniques câbles (contacts saillants)',
        'Rayons courbure câbles AC/DC respectés',
        'Qualité brassage câbles',
        'Repérage serrage connexions AC',
        'Type repérage câbles (sérigraphié/manuscrit/tenant-aboutissant)',
        'Cheminement terre (crapauds/bornier laiton)'
      ]},
      // 4. TRANCHEES (5 points)
      { cat: 'TRANCHEES', items: [
        'Respect préconisations tranchée AC (Shelter → PDL)',
        'Cahier charges tranchées bailleur respecté',
        'Rebouchage entrée/sortie fourreaux (TPC)',
        'Matériaux rebouchage conformes',
        'Profondeur tranchées conforme'
      ]},
      // 5. INSTALLATIONS ELECTRIQUES (6 points)
      { cat: 'INSTALL_ELEC', items: [
        'Cosses bimétal jonctions cuivre/alu présentes',
        'Connecteurs MC4 serrés/étanches',
        'État général coffrets DC',
        'Étanchéité IP65 boîtiers',
        'Serrage bornes électriques',
        'Ventilation coffrets adéquate'
      ]},
      // 6. INSPECTIONS VISUELLES (5 points)
      { cat: 'INSPECTIONS_VISUELLES', items: [
        'Alignement modules PV conforme',
        'État visuel modules (fissures/casse)',
        'État cadres modules (corrosion/déformation)',
        'Boîtiers jonction étanches',
        'Absence corrosion/oxydation générale'
      ]}
    ]
    
    // TOITURE uniquement si centrale TOITURE (12 points DTU 40.35)
    if (isToiture) {
      checklistStructure.push({
        cat: 'TOITURE_DTU_40_35',
        items: [
          'Qualité/conformité montage SI sur support',
          'Qualité/conformité montage panneau sur SI',
          'Fixation cheminement câbles (supports + étanchéité)',
          'Compatibilité connecteurs mâle/femelle (PVZH202B)',
          'Serrages connecteurs toiture',
          'Étanchéité connecteurs toiture',
          'Exposition ruissellement connecteurs',
          'Qualité cheminement câbles DC (chemin câbles)',
          'Pas de câbles directement sur couverture',
          'Raccordement terres toiture conforme',
          'Étiquettes réglementaires tension DC présentes',
          'Démontage 25 panneaux (1er/dernier chaîne)'
        ]
      })
    }
    
    // Insérer tous les items
    for (const category of checklistStructure) {
      for (let i = 0; i < category.items.length; i++) {
        await DB.prepare(`
          INSERT OR IGNORE INTO checklist_items (ordre_mission_id, categorie, item_numero, item_texte)
          VALUES (?, ?, ?, ?)
        `).bind(missionId, category.cat, i + 1, category.items[i]).run()
      }
    }
    
    const totalPoints = isToiture ? 52 : 40
    return c.json({ 
      success: true, 
      message: `Checklist initialisée (${totalPoints} points CDC GIRASOLE 2025)`,
      type: isToiture ? 'AUDIT_VISUEL_TOITURE' : 'AUDIT_VISUEL',
      points: totalPoints
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// PUT /api/checklist/:id - Mettre à jour item checklist (auto-save)
app.put('/api/checklist/:id', async (c) => {
  const { DB } = c.env
  const id = c.req.param('id')
  
  try {
    const body = await c.req.json()
    const { statut, conformite, commentaire, photo_base64, photo_filename, mesure_valeur, mesure_unite, technicien_nom } = body
    
    await DB.prepare(`
      UPDATE checklist_items 
      SET statut = ?, conformite = ?, commentaire = ?, photo_base64 = ?, photo_filename = ?,
          mesure_valeur = ?, mesure_unite = ?, technicien_nom = ?, date_modification = CURRENT_TIMESTAMP
      WHERE id = ?
    `).bind(
      statut || 'NON_VERIFIE',
      conformite !== undefined ? conformite : null,
      commentaire || null,
      photo_base64 || null,
      photo_filename || null,
      mesure_valeur || null,
      mesure_unite || null,
      technicien_nom || null,
      id
    ).run()
    
    return c.json({ success: true, message: 'Item sauvegardé' })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// POST /api/retours-json - Upload JSON V4 complet
app.post('/api/retours-json', async (c) => {
  const { DB } = c.env
  
  try {
    const body = await c.req.json()
    const { ordre_mission_id, centrale_id, technicien_id, json_data, taille_mo, nb_photos } = body
    
    if (!ordre_mission_id || !centrale_id || !technicien_id || !json_data) {
      return c.json({ success: false, error: 'Champs obligatoires manquants' }, 400)
    }
    
    const result = await DB.prepare(`
      INSERT INTO retours_json (ordre_mission_id, centrale_id, technicien_id, json_data, taille_mo, nb_photos)
      VALUES (?, ?, ?, ?, ?, ?)
    `).bind(ordre_mission_id, centrale_id, technicien_id, json_data, taille_mo || 0, nb_photos || 0).run()
    
    // Mettre à jour statut mission
    await DB.prepare(`
      UPDATE ordres_mission SET statut = 'TERMINE' WHERE id = ?
    `).bind(ordre_mission_id).run()
    
    return c.json({ success: true, data: { id: result.meta.last_row_id } })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// ========================================
// API ROUTES - RAPPORT FINAL PDF
// ========================================

// GET /api/ordres-mission/:id/rapport-final - Générer rapport final avec photos
app.get('/api/ordres-mission/:id/rapport-final', async (c) => {
  const { DB } = c.env
  const id = c.req.param('id')
  
  try {
    // Récupérer mission complète
    const mission = await DB.prepare(`
      SELECT om.*, c.nom as centrale_nom, c.type as centrale_type, c.puissance_kwc, c.localisation,
             t.prenom as technicien_prenom, t.nom as technicien_nom, st.nom_entreprise
      FROM ordres_mission om
      JOIN centrales c ON om.centrale_id = c.id
      JOIN techniciens t ON om.technicien_id = t.id
      JOIN sous_traitants st ON om.sous_traitant_id = st.id
      WHERE om.id = ?
    `).bind(id).first()
    
    if (!mission) {
      return c.json({ success: false, error: 'Mission non trouvée' }, 404)
    }
    
    // Récupérer checklist remplie
    const checklist = await DB.prepare(`
      SELECT * FROM checklist_items 
      WHERE ordre_mission_id = ?
      ORDER BY categorie, item_numero
    `).bind(id).all()
    
    // Récupérer JSON V4 si uploadé
    const retourJson = await DB.prepare(`
      SELECT * FROM retours_json 
      WHERE ordre_mission_id = ?
      ORDER BY date_upload DESC
      LIMIT 1
    `).bind(id).first()
    
    // Grouper checklist par catégorie
    const categories = ['DOC', 'ELEC', 'TABLEAUX', 'CABLAGE', 'MODULES', 'STRUCTURES', 'TOITURE']
    const checklistGrouped: any = {}
    
    categories.forEach(cat => {
      checklistGrouped[cat] = checklist.results.filter((item: any) => item.categorie === cat)
    })
    
    // Extraire photos du JSON V4 si disponible
    let photosJson: any[] = []
    if (retourJson && retourJson.json_data) {
      try {
        const jsonParsed = JSON.parse(retourJson.json_data)
        if (jsonParsed.photos && Array.isArray(jsonParsed.photos)) {
          photosJson = jsonParsed.photos
        }
      } catch (e) {
        console.error('Erreur parsing JSON V4:', e)
      }
    }
    
    const dateAudit = mission.date_mission ? new Date(mission.date_mission).toLocaleDateString('fr-FR', {
      weekday: 'long', year: 'numeric', month: 'long', day: 'numeric'
    }) : 'Non définie'
    
    const statsConformite = {
      conforme: checklist.results.filter((i: any) => i.statut === 'CONFORME').length,
      non_conforme: checklist.results.filter((i: any) => i.statut === 'NON_CONFORME').length,
      anomalie_mineure: checklist.results.filter((i: any) => i.statut === 'ANOMALIE_MINEURE').length,
      anomalie_majeure: checklist.results.filter((i: any) => i.statut === 'ANOMALIE_MAJEURE').length,
      na: checklist.results.filter((i: any) => i.statut === 'NA').length,
      total: checklist.results.length
    }
    
    const tauxConformite = statsConformite.total > 0 
      ? ((statsConformite.conforme / statsConformite.total) * 100).toFixed(1)
      : '0'
    
    // Fonction pour générer HTML item checklist
    const renderChecklistItem = (item: any) => {
      const statusIcons: any = {
        'CONFORME': '✅',
        'NON_CONFORME': '❌',
        'ANOMALIE_MINEURE': '⚠️',
        'ANOMALIE_MAJEURE': '🚨',
        'NA': '➖',
        'NON_VERIFIE': '⏸️'
      }
      
      const statusColors: any = {
        'CONFORME': '#10b981',
        'NON_CONFORME': '#ef4444',
        'ANOMALIE_MINEURE': '#f59e0b',
        'ANOMALIE_MAJEURE': '#dc2626',
        'NA': '#6b7280',
        'NON_VERIFIE': '#9ca3af'
      }
      
      const icon = statusIcons[item.statut] || '❓'
      const color = statusColors[item.statut] || '#6b7280'
      
      let photoHtml = ''
      if (item.photo_base64) {
        photoHtml = `
          <div style="margin-top: 10px;">
            <img src="data:image/jpeg;base64,${item.photo_base64}" 
                 style="max-width: 300px; border: 2px solid #e5e7eb; border-radius: 8px;" 
                 alt="${item.photo_filename || 'Photo'}">
          </div>
        `
      }
      
      let commentaireHtml = ''
      if (item.commentaire) {
        commentaireHtml = `<div style="margin-top: 8px; padding: 8px; background: #fef3c7; border-left: 3px solid #f59e0b; font-size: 13px; color: #78350f;"><strong>💬 Commentaire:</strong> ${item.commentaire}</div>`
      }
      
      let mesureHtml = ''
      if (item.mesure_valeur) {
        mesureHtml = `<div style="margin-top: 6px; font-size: 13px; color: #1e40af;"><strong>📊 Mesure:</strong> ${item.mesure_valeur} ${item.mesure_unite || ''}</div>`
      }
      
      return `
        <div style="padding: 12px; margin-bottom: 10px; background: white; border-left: 4px solid ${color}; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
          <div style="display: flex; align-items: center; gap: 10px;">
            <span style="font-size: 18px;">${icon}</span>
            <div style="flex: 1;">
              <div style="font-weight: 600; color: #1f2937;">${item.item_texte}</div>
              <div style="font-size: 12px; color: #6b7280; margin-top: 4px;">Statut: <strong style="color: ${color};">${item.statut}</strong></div>
              ${mesureHtml}
            </div>
          </div>
          ${commentaireHtml}
          ${photoHtml}
        </div>
      `
    }
    
    // Générer sections checklist par catégorie
    const checklistHtml = categories.map(cat => {
      const items = checklistGrouped[cat] || []
      if (items.length === 0) return ''
      
      const categoryIcons: any = {
        'DOC': '📄',
        'ELEC': '⚡',
        'TABLEAUX': '🔌',
        'CABLAGE': '🔌',
        'MODULES': '☀️',
        'STRUCTURES': '🏗️',
        'TOITURE': '🏠'
      }
      
      return `
        <div style="page-break-inside: avoid; margin-bottom: 30px;">
          <h3 style="background: linear-gradient(135deg, #3b82f6, #2563eb); color: white; padding: 12px 20px; border-radius: 8px; margin: 20px 0 15px 0; font-size: 18px;">
            ${categoryIcons[cat]} ${cat} (${items.length} points)
          </h3>
          ${items.map(renderChecklistItem).join('')}
        </div>
      `
    }).join('')
    
    // Section photos JSON V4
    let photosHtml = ''
    if (photosJson.length > 0) {
      photosHtml = `
        <div style="page-break-before: always; padding: 20px 0;">
          <h2 style="color: #1e40af; border-bottom: 3px solid #3b82f6; padding-bottom: 10px; margin-bottom: 20px;">
            📸 Galerie Photos Audit (${photosJson.length} photos)
          </h2>
          <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 15px;">
            ${photosJson.slice(0, 20).map((photo: any, idx: number) => `
              <div style="border: 2px solid #e5e7eb; border-radius: 8px; overflow: hidden;">
                <img src="data:image/jpeg;base64,${photo.base64}" style="width: 100%; height: auto;" alt="Photo ${idx + 1}">
                <div style="padding: 8px; background: #f3f4f6; font-size: 12px; color: #4b5563;">
                  <strong>${photo.categorie || 'Photo'}</strong> - ${photo.filename || `photo_${idx + 1}.jpg`}
                </div>
              </div>
            `).join('')}
          </div>
          ${photosJson.length > 20 ? `<p style="text-align: center; color: #6b7280; margin-top: 20px;"><em>+ ${photosJson.length - 20} photos supplémentaires disponibles dans le JSON V4</em></p>` : ''}
        </div>
      `
    }
    
    // HTML Complet
    return c.html(`
      <!DOCTYPE html>
      <html lang="fr">
      <head>
        <meta charset="UTF-8">
        <title>Rapport Final Audit - ${mission.centrale_nom}</title>
        <style>
          @media print {
            body { margin: 0; }
            .no-print { display: none !important; }
            @page { margin: 1.5cm; size: A4; }
          }
          
          body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            max-width: 21cm;
            margin: 0 auto;
            padding: 20px;
            background: #f9fafb;
          }
          
          .btn-print {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #2563eb;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            z-index: 1000;
          }
          
          .btn-print:hover {
            background: #1d4ed8;
          }
          
          .header {
            background: linear-gradient(135deg, #1e40af, #3b82f6);
            color: white;
            padding: 30px;
            border-radius: 12px;
            margin-bottom: 30px;
            box-shadow: 0 10px 15px rgba(0,0,0,0.1);
          }
          
          .header h1 {
            margin: 0 0 10px 0;
            font-size: 32px;
          }
          
          .header .subtitle {
            font-size: 18px;
            opacity: 0.9;
          }
          
          .info-section {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            border-left: 5px solid #3b82f6;
          }
          
          .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
          }
          
          .info-item {
            padding: 10px;
            background: #f9fafb;
            border-radius: 6px;
          }
          
          .info-label {
            font-size: 12px;
            color: #6b7280;
            text-transform: uppercase;
            font-weight: 600;
            margin-bottom: 5px;
          }
          
          .info-value {
            font-size: 16px;
            font-weight: 600;
            color: #1f2937;
          }
          
          .stats-box {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            margin: 20px 0;
          }
          
          .stat-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
          }
          
          .stat-value {
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 5px;
          }
          
          .stat-label {
            font-size: 13px;
            color: #6b7280;
            text-transform: uppercase;
          }
        </style>
      </head>
      <body>
        <button class="btn-print no-print" onclick="window.print()">🖨️ Imprimer / Sauvegarder PDF</button>
        
        <div class="header">
          <h1>📋 RAPPORT FINAL AUDIT</h1>
          <div class="subtitle">Mission GIRASOLE 2025 - Diagnostic Photovoltaïque Premium</div>
          <div style="margin-top: 15px; font-size: 14px; opacity: 0.85;">
            Rapport généré le ${new Date().toLocaleString('fr-FR')} | Diagnostic Photovoltaïque - Adrien Pappalardo
          </div>
        </div>

        <!-- Informations Centrale -->
        <div class="info-section">
          <h2 style="color: #1e40af; margin-top: 0;">🏭 Centrale Photovoltaïque</h2>
          <div class="info-grid">
            <div class="info-item">
              <div class="info-label">Nom Installation</div>
              <div class="info-value">${mission.centrale_nom}</div>
            </div>
            <div class="info-item">
              <div class="info-label">Type</div>
              <div class="info-value">${mission.centrale_type === 'SOL' ? '☀️ Au Sol' : '🏠 Toiture'}</div>
            </div>
            <div class="info-item">
              <div class="info-label">Puissance Installée</div>
              <div class="info-value">${mission.puissance_kwc} kWc</div>
            </div>
            <div class="info-item">
              <div class="info-label">Localisation</div>
              <div class="info-value">${mission.localisation || 'Non renseignée'}</div>
            </div>
          </div>
        </div>

        <!-- Informations Mission -->
        <div class="info-section">
          <h2 style="color: #1e40af; margin-top: 0;">📅 Détails Mission</h2>
          <div class="info-grid">
            <div class="info-item">
              <div class="info-label">Date Audit</div>
              <div class="info-value">${dateAudit}</div>
            </div>
            <div class="info-item">
              <div class="info-label">Technicien</div>
              <div class="info-value">${mission.technicien_prenom} ${mission.technicien_nom}</div>
            </div>
            <div class="info-item">
              <div class="info-label">Sous-Traitant</div>
              <div class="info-value">${mission.nom_entreprise}</div>
            </div>
          </div>
        </div>

        <!-- Statistiques Conformité -->
        <div class="info-section">
          <h2 style="color: #1e40af; margin-top: 0;">📊 Synthèse Conformité</h2>
          <div class="stats-box">
            <div class="stat-card" style="border-left: 5px solid #10b981;">
              <div class="stat-value" style="color: #10b981;">${statsConformite.conforme}</div>
              <div class="stat-label">✅ Conforme</div>
            </div>
            <div class="stat-card" style="border-left: 5px solid #ef4444;">
              <div class="stat-value" style="color: #ef4444;">${statsConformite.non_conforme + statsConformite.anomalie_majeure}</div>
              <div class="stat-label">❌ Non Conforme</div>
            </div>
            <div class="stat-card" style="border-left: 5px solid #3b82f6;">
              <div class="stat-value" style="color: #3b82f6;">${tauxConformite}%</div>
              <div class="stat-label">Taux Conformité</div>
            </div>
          </div>
          <div style="padding: 15px; background: #dbeafe; border-left: 4px solid #3b82f6; border-radius: 6px; margin-top: 15px;">
            <strong>📌 Détails:</strong> ${statsConformite.anomalie_mineure} anomalies mineures • ${statsConformite.na} points N/A • Total ${statsConformite.total} vérifications
          </div>
        </div>

        <!-- Synthèse Exécutive & Recommandations -->
        <div class="info-section" style="background: #fffbeb; border-left: 5px solid #f59e0b;">
          <h2 style="color: #92400e; margin-top: 0;">📋 Synthèse Exécutive & Recommandations DiagPV</h2>
          
          ${statsConformite.anomalie_majeure > 0 || statsConformite.non_conforme > 0 ? `
            <div style="padding: 15px; background: #fee2e2; border-left: 4px solid #dc2626; border-radius: 8px; margin-bottom: 20px;">
              <h3 style="color: #7f1d1d; margin: 0 0 10px 0; font-size: 16px;">🚨 Actions Prioritaires</h3>
              <p style="margin: 0; color: #991b1b; font-size: 14px; line-height: 1.6;">
                <strong>${statsConformite.anomalie_majeure + statsConformite.non_conforme} non-conformités majeures</strong> détectées nécessitant une intervention immédiate pour garantir la sécurité et les performances de l'installation.
              </p>
            </div>
          ` : ''}
          
          <div style="padding: 20px; background: white; border-radius: 10px; border: 2px solid #e5e7eb; margin-bottom: 20px;">
            <h3 style="color: #1f2937; margin: 0 0 15px 0; font-size: 18px;">🎯 Préconisations Hiérarchisées</h3>
            
            ${statsConformite.anomalie_majeure > 0 || statsConformite.non_conforme > 0 ? `
              <div style="padding: 15px; background: #fef2f2; border-left: 5px solid #dc2626; border-radius: 8px; margin-bottom: 15px;">
                <div style="display: flex; align-items: center; gap: 10px; margin-bottom: 10px;">
                  <span style="background: #dc2626; color: white; padding: 4px 12px; border-radius: 20px; font-size: 11px; font-weight: 700; text-transform: uppercase;">PRIORITÉ HAUTE</span>
                  <strong style="color: #7f1d1d; font-size: 15px;">Résolution Non-Conformités Majeures</strong>
                </div>
                <p style="margin: 0 0 10px 0; color: #991b1b; font-size: 14px; line-height: 1.6;">
                  Traitement immédiat des ${statsConformite.anomalie_majeure + statsConformite.non_conforme} points critiques identifiés. Risque : sécurité électrique, garanties constructeur, pertes production.
                </p>
                <div style="display: flex; gap: 15px; font-size: 13px; font-weight: 600; color: #7f1d1d;">
                  <span>💰 Impact : ${((statsConformite.anomalie_majeure + statsConformite.non_conforme) * mission.puissance_kwc * 0.15 * 150).toFixed(0)} €/an</span>
                  <span>⚡ Perte prod. : ${((statsConformite.anomalie_majeure + statsConformite.non_conforme) * mission.puissance_kwc * 0.15 * 1000).toFixed(0)} kWh/an</span>
                  <span>⏱️ Délai : < 30 jours</span>
                </div>
              </div>
            ` : ''}
            
            ${statsConformite.anomalie_mineure > 0 ? `
              <div style="padding: 15px; background: #fffbeb; border-left: 5px solid #f59e0b; border-radius: 8px; margin-bottom: 15px;">
                <div style="display: flex; align-items: center; gap: 10px; margin-bottom: 10px;">
                  <span style="background: #f59e0b; color: white; padding: 4px 12px; border-radius: 20px; font-size: 11px; font-weight: 700; text-transform: uppercase;">PRIORITÉ MOYENNE</span>
                  <strong style="color: #78350f; font-size: 15px;">Optimisations Performance</strong>
                </div>
                <p style="margin: 0 0 10px 0; color: #92400e; font-size: 14px; line-height: 1.6;">
                  Correction de ${statsConformite.anomalie_mineure} anomalies mineures pour optimiser le rendement. Nettoyage modules, resserrage connexions, équilibrage strings.
                </p>
                <div style="display: flex; gap: 15px; font-size: 13px; font-weight: 600; color: #78350f;">
                  <span>💰 Gain potentiel : ${(statsConformite.anomalie_mineure * mission.puissance_kwc * 0.05 * 150).toFixed(0)} €/an</span>
                  <span>⚡ Gain prod. : ${(statsConformite.anomalie_mineure * mission.puissance_kwc * 0.05 * 1000).toFixed(0)} kWh/an</span>
                  <span>⏱️ Délai : 2-3 mois</span>
                </div>
              </div>
            ` : ''}
            
            <div style="padding: 15px; background: #f0fdf4; border-left: 5px solid #10b981; border-radius: 8px;">
              <div style="display: flex; align-items: center; gap: 10px; margin-bottom: 10px;">
                <span style="background: #10b981; color: white; padding: 4px 12px; border-radius: 20px; font-size: 11px; font-weight: 700; text-transform: uppercase;">RECOMMANDÉ</span>
                <strong style="color: #065f46; font-size: 15px;">Maintenance Préventive Continue</strong>
              </div>
              <p style="margin: 0 0 10px 0; color: #047857; font-size: 14px; line-height: 1.6;">
                Mise en place contrat O&M avec audits semestriels, nettoyage annuel, monitoring temps réel, vérifications thermographiques.
              </p>
              <div style="display: flex; gap: 15px; font-size: 13px; font-weight: 600; color: #065f46;">
                <span>💰 ROI maintenance : +3-5% production/an</span>
                <span>📊 Monitoring : Détection précoce pannes</span>
                <span>🛡️ Protection : Garanties prolongées</span>
              </div>
            </div>
          </div>
          
          <div style="padding: 15px; background: #dbeafe; border-left: 4px solid #3b82f6; border-radius: 6px;">
            <strong style="color: #1e40af;">📌 Note DiagPV:</strong> 
            <span style="color: #1e3a8a; font-size: 14px;">
              Audit conforme normes IEC 62446-1, IEC 61215/61730, NF C 15-100. 
              Rapport complet avec photos HD, mesures électriques, recommandations chiffrées. 
              Validité 12 mois. Contact : adrien@diagpv.fr | +33 6 XX XX XX XX
            </span>
          </div>
        </div>

        <!-- Checklist Détaillée -->
        <div class="info-section">
          <h2 style="color: #1e40af; margin-top: 0;">✅ Checklist Audit V4 (54 Points CDC)</h2>
          ${checklistHtml}
        </div>

        <!-- Photos Audit -->
        ${photosHtml}

        <!-- Footer -->
        <div style="margin-top: 40px; padding: 20px; background: #1f2937; color: white; border-radius: 10px; text-align: center;">
          <p style="margin: 0; font-size: 14px;">© 2025 Diagnostic Photovoltaïque - Adrien Pappalardo</p>
          <p style="margin: 5px 0 0 0; font-size: 12px; opacity: 0.7;">
            Mission GIRASOLE 2025 - Audit Conforme IEC 62446-1, IEC 61215/61730, NF C 15-100
          </p>
        </div>
      </body>
      </html>
    `)
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// ========================================
// PAGE AUDIT TERRAIN MOBILE
// ========================================

app.get('/audit/:mission_id', async (c) => {
  const { DB } = c.env
  const missionId = c.req.param('mission_id')
  
  try {
    // Récupérer mission
    const mission = await DB.prepare(`
      SELECT om.*, c.nom as centrale_nom, c.type as centrale_type, c.puissance_kwc, c.localisation,
             t.prenom as technicien_prenom, t.nom as technicien_nom, st.nom_entreprise
      FROM ordres_mission om
      JOIN centrales c ON om.centrale_id = c.id
      JOIN techniciens t ON om.technicien_id = t.id
      JOIN sous_traitants st ON om.sous_traitant_id = st.id
      WHERE om.id = ?
    `).bind(missionId).first()
    
    if (!mission) {
      return c.html('<h1 style="text-align:center;margin-top:50px;">❌ Mission non trouvée</h1>')
    }
    
    return c.html(`
      <!DOCTYPE html>
      <html lang="fr">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <title>Audit ${mission.centrale_nom}</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.0/css/all.min.css" rel="stylesheet">
        <style>
          body {
            -webkit-tap-highlight-color: transparent;
            touch-action: pan-y;
            overscroll-behavior-y: contain;
          }
          
          .checklist-item {
            transition: all 0.2s ease;
          }
          
          .checklist-item.saved {
            background: #d1fae5 !important;
            border-left-color: #10b981 !important;
          }
          
          .status-btn {
            flex: 1;
            padding: 12px;
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            background: white;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
          }
          
          .status-btn.active {
            transform: scale(1.05);
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
          }
          
          .status-btn.conforme.active {
            background: #10b981;
            color: white;
            border-color: #10b981;
          }
          
          .status-btn.non-conforme.active {
            background: #ef4444;
            color: white;
            border-color: #ef4444;
          }
          
          .status-btn.na.active {
            background: #6b7280;
            color: white;
            border-color: #6b7280;
          }
          
          .category-header {
            position: sticky;
            top: 60px;
            z-index: 10;
            background: linear-gradient(135deg, #3b82f6, #2563eb);
            color: white;
            padding: 15px;
            margin: 0 -15px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
          }
          
          .progress-bar {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: #e5e7eb;
            z-index: 50;
          }
          
          .progress-bar-fill {
            height: 100%;
            background: linear-gradient(90deg, #10b981, #3b82f6);
            transition: width 0.3s ease;
          }
          
          .floating-save-indicator {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: #10b981;
            color: white;
            padding: 12px 20px;
            border-radius: 50px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            display: none;
            animation: fadeIn 0.3s;
            z-index: 40;
          }
          
          @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
          }
          
          .photo-preview {
            max-width: 100%;
            max-height: 200px;
            border-radius: 8px;
            margin-top: 10px;
            border: 2px solid #e5e7eb;
          }
          
          input[type="file"] {
            display: none;
          }
          
          .photo-btn {
            width: 100%;
            padding: 12px;
            background: #3b82f6;
            color: white;
            border-radius: 8px;
            border: none;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
          }
          
          .photo-btn:active {
            background: #2563eb;
          }
        </style>
      </head>
      <body class="bg-gray-50">
        <div class="progress-bar">
          <div id="progressBar" class="progress-bar-fill" style="width: 0%"></div>
        </div>
        
        <div class="floating-save-indicator" id="saveIndicator">
          <i class="fas fa-check-circle mr-2"></i>Sauvegardé
        </div>
        
        <!-- Header fixe -->
        <header class="bg-gradient-to-r from-blue-600 to-blue-800 text-white p-4 shadow-lg" style="position: sticky; top: 0; z-index: 20;">
          <div class="flex items-center justify-between">
            <div class="flex items-center space-x-3">
              <i class="fas fa-clipboard-check text-2xl"></i>
              <div>
                <h1 class="text-lg font-bold">${mission.centrale_nom}</h1>
                <p class="text-xs text-blue-200">${mission.centrale_type === 'SOL' ? '☀️ Sol' : '🏠 Toiture'} • ${mission.puissance_kwc} kWc</p>
              </div>
            </div>
            <button onclick="finishAudit()" class="bg-green-500 hover:bg-green-600 px-4 py-2 rounded-lg font-semibold text-sm">
              <i class="fas fa-check mr-1"></i>Terminer
            </button>
          </div>
          <div class="mt-3 flex items-center text-sm" data-technicien-nom="${mission.technicien_prenom} ${mission.technicien_nom}">
            <i class="fas fa-user-hard-hat mr-2"></i>
            <span>${mission.technicien_prenom} ${mission.technicien_nom}</span>
            <span class="mx-2">•</span>
            <span id="progressText">0/54 vérifications</span>
          </div>
        </header>

        <!-- Contenu -->
        <main class="p-4 pb-20" id="checklistContainer">
          <div class="text-center py-8">
            <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto mb-4"></div>
            <p class="text-gray-600">Chargement checklist...</p>
          </div>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/axios@1.6.0/dist/axios.min.js"></script>
        <script src="/static/audit.js"></script>
      </body>
      </html>
    `)
  } catch (error) {
    return c.html('<h1 style="text-align:center;margin-top:50px;">❌ Erreur: ' + String(error) + '</h1>')
  }
})

// ========================================
// PAGE PHOTOS AUDIT - GALERIE PAR MISSION
// ========================================
app.get('/photos-audit/:mission_id', async (c) => {
  const { DB } = c.env
  const missionId = c.req.param('mission_id')
  
  try {
    // Récupérer mission
    const mission = await DB.prepare(`
      SELECT om.*, c.nom as centrale_nom, c.id_ref, c.type as centrale_type, c.puissance_kwc
      FROM ordres_mission om
      JOIN centrales c ON om.centrale_id = c.id
      WHERE om.id = ?
    `).bind(missionId).first()
    
    if (!mission) {
      return c.html('<h1 style="text-align:center;margin-top:50px;">❌ Mission non trouvée</h1>')
    }
    
    // Récupérer photos avec items checklist
    const photos = await DB.prepare(`
      SELECT ci.id, ci.categorie, ci.item_texte, ci.photo_base64, ci.date_modification
      FROM checklist_items ci
      WHERE ci.ordre_mission_id = ? AND ci.photo_base64 IS NOT NULL
      ORDER BY ci.categorie, ci.item_numero
    `).bind(missionId).all()
    
    return c.html(`
      <!DOCTYPE html>
      <html lang="fr">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Photos Audit ${mission.centrale_nom}</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.0/css/all.min.css" rel="stylesheet">
        <style>
          .photo-gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1.5rem;
          }
          
          .photo-card {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.2s;
          }
          
          .photo-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 12px rgba(0,0,0,0.15);
          }
          
          .photo-img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            cursor: pointer;
          }
          
          .lightbox {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0,0,0,0.9);
            z-index: 1000;
            justify-content: center;
            align-items: center;
          }
          
          .lightbox img {
            max-width: 90%;
            max-height: 90vh;
            border-radius: 8px;
          }
        </style>
      </head>
      <body class="bg-gray-50">
        <!-- Header -->
        <header class="bg-gradient-to-r from-purple-600 to-purple-700 text-white py-6 shadow-lg">
          <div class="container mx-auto px-4">
            <div class="flex items-center justify-between">
              <div>
                <h1 class="text-3xl font-bold mb-2">
                  <i class="fas fa-images mr-3"></i>${mission.centrale_nom}
                </h1>
                <p class="text-purple-100">
                  ID Ref: ${mission.id_ref || 'N/A'} | ${mission.puissance_kwc || 0} kWc | ${mission.centrale_type}
                </p>
              </div>
              <div class="text-right">
                <div class="bg-white bg-opacity-20 rounded-lg px-6 py-3">
                  <p class="text-sm text-purple-100">Total Photos</p>
                  <p class="text-4xl font-bold">${photos.results?.length || 0}</p>
                </div>
              </div>
            </div>
          </div>
        </header>
        
        <!-- Actions -->
        <div class="container mx-auto px-4 py-4">
          <div class="flex gap-3">
            <a href="/audit/${missionId}" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg">
              <i class="fas fa-clipboard-check mr-2"></i>Retour Checklist
            </a>
            <a href="/" class="bg-gray-600 hover:bg-gray-700 text-white px-6 py-2 rounded-lg">
              <i class="fas fa-home mr-2"></i>Dashboard
            </a>
            <button onclick="downloadAll()" class="ml-auto bg-green-600 hover:bg-green-700 text-white px-6 py-2 rounded-lg">
              <i class="fas fa-download mr-2"></i>Télécharger Toutes (ZIP)
            </button>
          </div>
        </div>
        
        <!-- Galerie -->
        <div class="container mx-auto px-4 pb-12">
          ${photos.results && photos.results.length > 0 ? `
            <div class="photo-gallery">
              ${photos.results.map((photo, idx) => `
                <div class="photo-card bg-white">
                  <img 
                    src="${photo.photo_base64}" 
                    alt="${photo.item_texte}"
                    class="photo-img"
                    onclick="openLightbox(${idx})"
                  />
                  <div class="p-4">
                    <span class="inline-block px-2 py-1 bg-purple-100 text-purple-800 text-xs font-semibold rounded mb-2">
                      ${photo.categorie}
                    </span>
                    <h3 class="font-bold text-gray-800 mb-2">${photo.item_texte}</h3>
                    <p class="text-xs text-gray-500">
                      <i class="fas fa-calendar mr-1"></i>
                      ${new Date(photo.date_modification).toLocaleString('fr-FR')}
                    </p>
                  </div>
                </div>
              `).join('')}
            </div>
          ` : `
            <div class="text-center py-20">
              <i class="fas fa-image text-gray-300 text-6xl mb-4"></i>
              <p class="text-gray-500 text-lg">Aucune photo disponible pour cette mission</p>
              <a href="/audit/${missionId}" class="inline-block mt-6 bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg">
                <i class="fas fa-camera mr-2"></i>Prendre des photos
              </a>
            </div>
          `}
        </div>
        
        <!-- Lightbox -->
        <div id="lightbox" class="lightbox" onclick="closeLightbox()">
          <button onclick="prevPhoto()" class="absolute left-4 text-white text-4xl hover:scale-110 transition">
            <i class="fas fa-chevron-left"></i>
          </button>
          <img id="lightbox-img" src="" alt="">
          <button onclick="nextPhoto()" class="absolute right-4 text-white text-4xl hover:scale-110 transition">
            <i class="fas fa-chevron-right"></i>
          </button>
          <button onclick="closeLightbox()" class="absolute top-4 right-4 text-white text-3xl hover:scale-110 transition">
            <i class="fas fa-times"></i>
          </button>
        </div>
        
        <script>
          const photos = ${JSON.stringify(photos.results || [])};
          let currentPhotoIndex = 0;
          
          function openLightbox(index) {
            currentPhotoIndex = index;
            document.getElementById('lightbox-img').src = photos[index].photo_base64;
            document.getElementById('lightbox').style.display = 'flex';
          }
          
          function closeLightbox() {
            document.getElementById('lightbox').style.display = 'none';
          }
          
          function prevPhoto() {
            event.stopPropagation();
            currentPhotoIndex = (currentPhotoIndex - 1 + photos.length) % photos.length;
            document.getElementById('lightbox-img').src = photos[currentPhotoIndex].photo_base64;
          }
          
          function nextPhoto() {
            event.stopPropagation();
            currentPhotoIndex = (currentPhotoIndex + 1) % photos.length;
            document.getElementById('lightbox-img').src = photos[currentPhotoIndex].photo_base64;
          }
          
          function downloadAll() {
            alert('Fonctionnalité ZIP en développement\\n\\nPour l\\'instant, vous pouvez:\\n1. Clic droit > Enregistrer sur chaque photo\\n2. Utiliser l\\'export PDF depuis la checklist');
          }
          
          // Navigation clavier
          document.addEventListener('keydown', (e) => {
            if (document.getElementById('lightbox').style.display === 'flex') {
              if (e.key === 'ArrowLeft') prevPhoto();
              if (e.key === 'ArrowRight') nextPhoto();
              if (e.key === 'Escape') closeLightbox();
            }
          });
        </script>
      </body>
      </html>
    `)
  } catch (error) {
    return c.html('<h1 style="text-align:center;margin-top:50px;">❌ Erreur: ' + String(error) + '</h1>')
  }
})

// ======================
// PAGE PRINCIPALE
// ======================

app.get('/', (c) => {
  return c.html(`
    <!DOCTYPE html>
    <html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>GIRASOLE 2025 - Dashboard Mission</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.0/css/all.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        
        <!-- FullCalendar CSS + JS -->
        <link href='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.css' rel='stylesheet' />
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
        
        <link href="/static/styles.css" rel="stylesheet">
    </head>
    <body class="bg-gray-50">
        <!-- Header -->
        <header class="bg-gradient-to-r from-blue-600 to-blue-800 text-white shadow-lg">
            <div class="container mx-auto px-6 py-4">
                <div class="flex items-center justify-between">
                    <div class="flex items-center space-x-4">
                        <i class="fas fa-solar-panel text-3xl"></i>
                        <div>
                            <h1 class="text-2xl font-bold">GIRASOLE 2025</h1>
                            <p class="text-blue-200 text-sm">Mission 52 Centrales Photovoltaïques</p>
                        </div>
                    </div>
                    <div class="flex items-center space-x-6">
                        <div class="text-right">
                            <p class="text-sm text-blue-200">Diagnostic Photovoltaïque</p>
                            <p class="font-semibold">Adrien Pappalardo</p>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Navigation Tabs -->
        <nav class="bg-white shadow-md border-b">
            <div class="container mx-auto px-6">
                <div class="flex space-x-8">
                    <button onclick="showTab('dashboard')" class="tab-btn active py-4 px-4 border-b-2 border-blue-600 font-semibold text-blue-600">
                        <i class="fas fa-chart-line mr-2"></i>Dashboard
                    </button>
                    <button onclick="showTab('centrales')" class="tab-btn py-4 px-4 border-b-2 border-transparent hover:border-gray-300 text-gray-600">
                        <i class="fas fa-list mr-2"></i>Centrales
                    </button>
                    <button onclick="showTab('missions')" class="tab-btn py-4 px-4 border-b-2 border-transparent hover:border-gray-300 text-gray-600">
                        <i class="fas fa-tasks mr-2"></i>Missions
                    </button>
                    <button onclick="showTab('upload')" class="tab-btn py-4 px-4 border-b-2 border-transparent hover:border-gray-300 text-gray-600">
                        <i class="fas fa-upload mr-2"></i>Upload JSON
                    </button>
                    <button onclick="showTab('planning')" class="tab-btn py-4 px-4 border-b-2 border-transparent hover:border-gray-300 text-gray-600">
                        <i class="fas fa-calendar-alt mr-2"></i>Planning
                    </button>
                    <button onclick="showTab('analytics')" class="tab-btn py-4 px-4 border-b-2 border-transparent hover:border-gray-300 text-gray-600">
                        <i class="fas fa-chart-pie mr-2"></i>Analytics
                    </button>
                    <button onclick="showTab('docs')" class="tab-btn py-4 px-4 border-b-2 border-transparent hover:border-gray-300 text-gray-600">
                        <i class="fas fa-book mr-2"></i>Documentation
                    </button>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="container mx-auto px-6 py-8">
            <!-- Dashboard Tab -->
            <div id="tab-dashboard" class="tab-content">
                <!-- Stats Cards -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500 text-sm">Total Centrales</p>
                                <p id="stat-total" class="text-3xl font-bold text-gray-800">-</p>
                            </div>
                            <i class="fas fa-solar-panel text-4xl text-blue-500"></i>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500 text-sm">Auditées</p>
                                <p id="stat-auditees" class="text-3xl font-bold text-green-600">-</p>
                            </div>
                            <i class="fas fa-check-circle text-4xl text-green-500"></i>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500 text-sm">Validées</p>
                                <p id="stat-validees" class="text-3xl font-bold text-purple-600">-</p>
                            </div>
                            <i class="fas fa-star text-4xl text-purple-500"></i>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500 text-sm">Missions Total</p>
                                <p id="stat-photos" class="text-3xl font-bold text-orange-600">-</p>
                            </div>
                            <i class="fas fa-clipboard-list text-4xl text-orange-500"></i>
                        </div>
                    </div>
                </div>

                <!-- Charts -->
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
                    <div class="bg-white rounded-lg shadow p-6">
                        <h3 class="text-lg font-bold mb-4">Répartition par Statut</h3>
                        <canvas id="chartStatut"></canvas>
                    </div>
                    <div class="bg-white rounded-lg shadow p-6">
                        <h3 class="text-lg font-bold mb-4">SOL vs TOITURE</h3>
                        <canvas id="chartType"></canvas>
                    </div>
                </div>

                <!-- Volumétrie -->
                <div class="bg-white rounded-lg shadow p-6">
                    <h3 class="text-lg font-bold mb-4"><i class="fas fa-database mr-2"></i>Volumétrie Mission</h3>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                        <div class="border-l-4 border-blue-500 pl-4">
                            <p class="text-gray-500 text-sm">Missions Créées</p>
                            <p id="vol-json" class="text-2xl font-bold text-blue-600">-</p>
                        </div>
                        <div class="border-l-4 border-green-500 pl-4">
                            <p class="text-gray-500 text-sm">Missions Planifiées</p>
                            <p id="vol-photos" class="text-2xl font-bold text-green-600">-</p>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Centrales Tab -->
            <div id="tab-centrales" class="tab-content hidden">
                <div class="bg-white rounded-lg shadow">
                    <div class="p-6 border-b">
                        <div class="flex items-center justify-between mb-4">
                            <h3 class="text-lg font-bold">Liste des 52 Centrales</h3>
                            <div class="flex items-center space-x-2">
                                <span id="centrales-count" class="text-sm text-gray-600 font-medium">52 centrales</span>
                            </div>
                        </div>
                        <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                            <input 
                                type="text" 
                                id="search-centrales" 
                                placeholder="🔍 Rechercher par nom ou localisation..." 
                                onkeyup="loadCentrales()"
                                class="px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                            >
                            <select id="filter-type" onchange="loadCentrales()" class="px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
                                <option value="">📂 Tous types</option>
                                <option value="SOL">☀️ SOL (39)</option>
                                <option value="TOITURE">🏠 TOITURE (13)</option>
                            </select>
                            <select id="filter-statut" onchange="loadCentrales()" class="px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
                                <option value="">📊 Tous statuts</option>
                                <option value="A_AUDITER">⏳ À auditer</option>
                                <option value="EN_COURS">🔄 En cours</option>
                                <option value="TERMINE">✅ Terminé</option>
                                <option value="VALIDE">⭐ Validé</option>
                            </select>
                            <select id="sort-by" onchange="loadCentrales()" class="px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
                                <option value="nom">📝 Trier par nom</option>
                                <option value="date_audit">📅 Trier par date</option>
                                <option value="nb_retours">📊 Trier par retours</option>
                            </select>
                        </div>
                    </div>
                    <div id="centrales-list" class="p-6">
                        <p class="text-center text-gray-500">Chargement...</p>
                    </div>
                </div>
            </div>

            <!-- Missions Tab -->
            <div id="tab-missions" class="tab-content hidden">
                <div class="bg-white rounded-lg shadow p-6 mb-6">
                    <h2 class="text-2xl font-bold mb-4 flex items-center">
                        <i class="fas fa-tasks text-blue-600 mr-3"></i>
                        Suivi Missions - Checklists & Photos
                    </h2>
                    
                    <!-- Filtres -->
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="fas fa-building mr-2"></i>Sous-Traitant
                            </label>
                            <select id="filter-st-missions" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                                <option value="">Tous les sous-traitants</option>
                                <option value="ARTEMIS">ARTEMIS</option>
                                <option value="CADENET">CADENET</option>
                                <option value="DIAGPV">DIAGPV - Adrien & Fabien</option>
                                <option value="EDOUARD">EDOUARD</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="fas fa-filter mr-2"></i>Statut
                            </label>
                            <select id="filter-statut-missions" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                                <option value="">Tous les statuts</option>
                                <option value="0">Non commencée</option>
                                <option value="en-cours">En cours</option>
                                <option value="100">Terminée</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="fas fa-search mr-2"></i>Recherche
                            </label>
                            <input 
                                type="text" 
                                id="search-centrale-missions" 
                                placeholder="Nom centrale..."
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                            >
                        </div>
                    </div>
                </div>
                
                <!-- Liste Missions -->
                <div id="missions-container" class="space-y-4">
                    <div class="text-center py-8">
                        <i class="fas fa-spinner fa-spin text-4xl text-blue-500"></i>
                        <p class="text-gray-600 mt-4">Chargement des missions...</p>
                    </div>
                </div>
                
                <script>
                    // Charger missions
                    async function loadMissions() {
                        try {
                            const response = await axios.get('/api/suivi-missions');
                            const missions = response.data.data;
                            
                            const container = document.getElementById('missions-container');
                            
                            if (!missions || missions.length === 0) {
                                container.innerHTML = '<div class="text-center py-12 text-gray-500">Aucune mission trouvée</div>';
                                return;
                            }
                            
                            container.innerHTML = missions.map(m => {
                                const progression = m.nb_points_total > 0 
                                    ? Math.round((m.nb_points_completes / m.nb_points_total) * 100) 
                                    : 0;
                                
                                let statutBadge = '';
                                if (progression === 0) {
                                    statutBadge = '<span class="px-3 py-1 rounded-full text-xs font-semibold bg-gray-200 text-gray-800">Non commencée</span>';
                                } else if (progression === 100) {
                                    statutBadge = '<span class="px-3 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-800">✅ Terminée</span>';
                                } else {
                                    statutBadge = '<span class="px-3 py-1 rounded-full text-xs font-semibold bg-yellow-100 text-yellow-800">🔄 En cours</span>';
                                }
                                
                                return \`
                                    <div class="mission-card bg-white rounded-lg shadow-md p-6" data-st="\${m.sous_traitant}" data-centrale="\${m.centrale_nom}" data-progression="\${progression}">
                                        <div class="flex items-start justify-between mb-4">
                                            <div class="flex-1">
                                                <h3 class="text-xl font-bold text-gray-800 mb-1">\${m.centrale_nom}</h3>
                                                <p class="text-sm text-gray-600">ID Ref: \${m.id_ref || 'N/A'} | \${m.puissance_kwc || 0} kWc</p>
                                            </div>
                                            \${statutBadge}
                                        </div>
                                        
                                        <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-4">
                                            <div>
                                                <p class="text-xs text-gray-500 mb-1">Sous-Traitant</p>
                                                <p class="font-semibold text-gray-800">\${m.sous_traitant}</p>
                                            </div>
                                            <div>
                                                <p class="text-xs text-gray-500 mb-1">Technicien</p>
                                                <p class="font-semibold text-gray-800">\${m.technicien_nom}</p>
                                            </div>
                                            <div>
                                                <p class="text-xs text-gray-500 mb-1">Date Mission</p>
                                                <p class="font-semibold text-gray-800">\${new Date(m.date_mission).toLocaleDateString('fr-FR')}</p>
                                            </div>
                                            <div>
                                                <p class="text-xs text-gray-500 mb-1">Photos</p>
                                                <p class="font-semibold text-gray-800">\${m.nb_photos || 0} photos</p>
                                            </div>
                                        </div>
                                        
                                        <div class="mb-4">
                                            <div class="flex justify-between items-center mb-2">
                                                <span class="text-sm font-medium text-gray-700">Progression</span>
                                                <span class="text-sm font-bold text-blue-600">\${progression}%</span>
                                            </div>
                                            <div class="w-full bg-gray-200 rounded-full h-3">
                                                <div class="bg-gradient-to-r from-blue-500 to-purple-500 h-3 rounded-full transition-all" style="width: \${progression}%"></div>
                                            </div>
                                            <p class="text-xs text-gray-500 mt-1">
                                                \${m.nb_points_completes || 0} / \${m.nb_points_total || 0} points complétés
                                            </p>
                                        </div>
                                        
                                        <div class="flex gap-2">
                                            <a href="/audit/\${m.mission_id}" target="_blank" class="flex-1 bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition text-center text-sm font-semibold">
                                                <i class="fas fa-clipboard-check mr-2"></i>Voir Checklist
                                            </a>
                                            <a href="/photos-audit/\${m.mission_id}" target="_blank" class="flex-1 bg-purple-500 text-white px-4 py-2 rounded-lg hover:bg-purple-600 transition text-center text-sm font-semibold">
                                                <i class="fas fa-images mr-2"></i>Photos (\${m.nb_photos || 0})
                                            </a>
                                            <a href="/om/\${m.mission_id}" target="_blank" class="bg-gray-500 text-white px-4 py-2 rounded-lg hover:bg-gray-600 transition text-sm font-semibold">
                                                <i class="fas fa-file-pdf mr-2"></i>OM
                                            </a>
                                        </div>
                                    </div>
                                \`;
                            }).join('');
                            
                        } catch (error) {
                            console.error('Erreur chargement missions:', error);
                            document.getElementById('missions-container').innerHTML = 
                                '<div class="text-center py-12 text-red-500">Erreur chargement missions</div>';
                        }
                    }
                    
                    // Filtres
                    document.getElementById('filter-st-missions')?.addEventListener('change', filterMissions);
                    document.getElementById('filter-statut-missions')?.addEventListener('change', filterMissions);
                    document.getElementById('search-centrale-missions')?.addEventListener('input', filterMissions);
                    
                    function filterMissions() {
                        const st = document.getElementById('filter-st-missions')?.value.toLowerCase() || '';
                        const statut = document.getElementById('filter-statut-missions')?.value || '';
                        const search = document.getElementById('search-centrale-missions')?.value.toLowerCase() || '';
                        
                        document.querySelectorAll('.mission-card').forEach(card => {
                            const cardSt = card.dataset.st.toLowerCase();
                            const cardCentrale = card.dataset.centrale.toLowerCase();
                            const cardProgression = parseInt(card.dataset.progression);
                            
                            const matchSt = !st || cardSt.includes(st);
                            const matchSearch = !search || cardCentrale.includes(search);
                            
                            let matchStatut = true;
                            if (statut === '0') {
                                matchStatut = cardProgression === 0;
                            } else if (statut === 'en-cours') {
                                matchStatut = cardProgression > 0 && cardProgression < 100;
                            } else if (statut === '100') {
                                matchStatut = cardProgression === 100;
                            }
                            
                            card.style.display = matchSt && matchSearch && matchStatut ? 'block' : 'none';
                        });
                    }
                    
                    // Charger au démarrage si onglet actif
                    if (document.getElementById('tab-missions')?.classList.contains('active')) {
                        loadMissions();
                    }
                    
                    // Charger quand onglet devient actif
                    const originalShowTab = window.showTab;
                    window.showTab = function(tabName) {
                        originalShowTab(tabName);
                        if (tabName === 'missions') {
                            loadMissions();
                            // Actualiser toutes les 30 secondes
                            if (!window.missionsInterval) {
                                window.missionsInterval = setInterval(loadMissions, 30000);
                            }
                        }
                    };
                </script>
            </div>

            <!-- Upload Tab -->
            <div id="tab-upload" class="tab-content hidden">
                <div class="bg-white rounded-lg shadow p-8">
                    <h3 class="text-lg font-bold mb-6"><i class="fas fa-upload mr-2"></i>Enregistrer Retour JSON V4</h3>
                    
                    <form id="form-upload" class="space-y-6">
                        <div>
                            <label class="block text-sm font-medium mb-2">Centrale</label>
                            <select id="upload-centrale" required class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
                                <option value="">Sélectionner une centrale...</option>
                            </select>
                        </div>
                        
                        <div>
                            <label class="block text-sm font-medium mb-2">Nom Fichier JSON</label>
                            <input type="text" id="upload-fichier" required placeholder="Ex: SOL_01_2025-01-20_versionV4.json" class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
                        </div>
                        
                        <div class="grid grid-cols-2 gap-4">
                            <div>
                                <label class="block text-sm font-medium mb-2">Taille (MB)</label>
                                <input type="number" step="0.1" id="upload-taille" required placeholder="18.5" class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
                            </div>
                            <div>
                                <label class="block text-sm font-medium mb-2">Nombre Photos</label>
                                <input type="number" id="upload-photos" required placeholder="45" class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
                            </div>
                        </div>
                        
                        <div>
                            <label class="block text-sm font-medium mb-2">Technicien</label>
                            <input type="text" id="upload-technicien" required placeholder="Nom du technicien" class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
                        </div>
                        
                        <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-6 rounded transition">
                            <i class="fas fa-save mr-2"></i>Enregistrer Retour
                        </button>
                    </form>
                    
                    <div id="upload-result" class="mt-6 hidden"></div>
                </div>
            </div>

            <!-- Planning Tab -->
            <div id="tab-planning" class="tab-content hidden">
                <!-- Stats Planning -->
                <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500 text-sm">Centrales Non Attribuées</p>
                                <p id="planning-stat-non-attribuees" class="text-3xl font-bold text-orange-600">-</p>
                            </div>
                            <i class="fas fa-exclamation-triangle text-4xl text-orange-500"></i>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500 text-sm">Missions Planifiées</p>
                                <p id="planning-stat-planifiees" class="text-3xl font-bold text-blue-600">-</p>
                            </div>
                            <i class="fas fa-calendar-check text-4xl text-blue-500"></i>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500 text-sm">Techniciens Disponibles</p>
                                <p id="planning-stat-techniciens" class="text-3xl font-bold text-green-600">-</p>
                            </div>
                            <i class="fas fa-user-check text-4xl text-green-500"></i>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500 text-sm">Sous-Traitants Actifs</p>
                                <p id="planning-stat-sous-traitants" class="text-3xl font-bold text-purple-600">-</p>
                            </div>
                            <i class="fas fa-building text-4xl text-purple-500"></i>
                        </div>
                    </div>
                </div>

                <!-- Actions Rapides -->
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8">
                    <button onclick="showModalSousTraitant()" class="bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-700 hover:to-blue-800 text-white font-bold py-6 px-6 rounded-lg shadow-lg transition transform hover:scale-105">
                        <i class="fas fa-building text-3xl mb-2"></i>
                        <p class="text-lg">Ajouter Sous-Traitant</p>
                    </button>
                    <button onclick="showModalTechnicien()" class="bg-gradient-to-r from-green-600 to-green-700 hover:from-green-700 hover:to-green-800 text-white font-bold py-6 px-6 rounded-lg shadow-lg transition transform hover:scale-105">
                        <i class="fas fa-user-plus text-3xl mb-2"></i>
                        <p class="text-lg">Ajouter Technicien</p>
                    </button>
                    <button onclick="showModalOrdreMission()" class="bg-gradient-to-r from-purple-600 to-purple-700 hover:from-purple-700 hover:to-purple-800 text-white font-bold py-6 px-6 rounded-lg shadow-lg transition transform hover:scale-105">
                        <i class="fas fa-clipboard-list text-3xl mb-2"></i>
                        <p class="text-lg">Créer Ordre de Mission</p>
                    </button>
                </div>

                <!-- Tabs Secondaires -->
                <div class="bg-white rounded-lg shadow mb-6">
                    <div class="border-b">
                        <nav class="flex space-x-4 px-6">
                            <button onclick="showPlanningSubTab('missions')" class="planning-subtab-btn active py-4 px-4 border-b-2 border-blue-600 font-semibold text-blue-600">
                                Ordres de Mission
                            </button>
                            <button onclick="showPlanningSubTab('techniciens')" class="planning-subtab-btn py-4 px-4 border-b-2 border-transparent hover:border-gray-300 text-gray-600">
                                Techniciens
                            </button>
                            <button onclick="showPlanningSubTab('sous-traitants')" class="planning-subtab-btn py-4 px-4 border-b-2 border-transparent hover:border-gray-300 text-gray-600">
                                Sous-Traitants
                            </button>
                            <button onclick="showPlanningSubTab('calendrier')" class="planning-subtab-btn py-4 px-4 border-b-2 border-transparent hover:border-gray-300 text-gray-600">
                                Calendrier
                            </button>
                        </nav>
                    </div>

                    <!-- Ordres de Mission -->
                    <div id="planning-subtab-missions" class="planning-subtab-content p-6">
                        <div class="mb-4">
                            <h3 class="text-lg font-bold">Ordres de Mission</h3>
                            <p class="text-gray-600 text-sm">Gestion des attributions centrales → techniciens</p>
                        </div>
                        <div id="missions-list">
                            <p class="text-center text-gray-500 py-8">Chargement...</p>
                        </div>
                    </div>

                    <!-- Techniciens -->
                    <div id="planning-subtab-techniciens" class="planning-subtab-content p-6 hidden">
                        <div class="mb-4">
                            <h3 class="text-lg font-bold">Techniciens</h3>
                            <p class="text-gray-600 text-sm">Liste des techniciens et leurs missions</p>
                        </div>
                        <div id="techniciens-list">
                            <p class="text-center text-gray-500 py-8">Chargement...</p>
                        </div>
                    </div>

                    <!-- Sous-Traitants -->
                    <div id="planning-subtab-sous-traitants" class="planning-subtab-content p-6 hidden">
                        <div class="mb-4">
                            <h3 class="text-lg font-bold">Sous-Traitants</h3>
                            <p class="text-gray-600 text-sm">Entreprises partenaires et capacités</p>
                        </div>
                        <div id="sous-traitants-list">
                            <p class="text-center text-gray-500 py-8">Chargement...</p>
                        </div>
                    </div>

                    <!-- Calendrier -->
                    <div id="planning-subtab-calendrier" class="planning-subtab-content p-6 hidden">
                        <div class="mb-4 flex items-center justify-between">
                            <div>
                                <h3 class="text-lg font-bold">Vue Calendrier</h3>
                                <p class="text-gray-600 text-sm">Planning des missions GIRASOLE 2025</p>
                            </div>
                            <div class="flex items-center space-x-4">
                                <select id="calendar-filter-subcontractor" class="px-4 py-2 border rounded-lg" onchange="reloadCalendar()">
                                    <option value="">Tous les sous-traitants</option>
                                    <option value="ARTEMIS">ARTEMIS</option>
                                    <option value="CADENET">CADENET</option>
                                    <option value="DIAGPV - Adrien & Fabien">DIAGPV - Adrien & Fabien</option>
                                </select>
                                <button onclick="openAddEventModal()" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg">
                                    <i class="fas fa-plus mr-2"></i>Ajouter intervention
                                </button>
                            </div>
                        </div>
                        <div id="calendrier-view" class="bg-white rounded-lg shadow-lg"></div>
                    </div>
                </div>
            </div>

            <!-- Analytics Tab -->
            <div id="tab-analytics" class="tab-content hidden">
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">
                    <!-- Progression Mission -->
                    <div class="bg-white rounded-lg shadow p-6">
                        <h3 class="text-lg font-bold mb-4 flex items-center">
                            <i class="fas fa-chart-line text-blue-600 mr-2"></i>
                            Progression Mission
                        </h3>
                        <div class="space-y-4">
                            <div>
                                <div class="flex justify-between text-sm mb-1">
                                    <span class="text-gray-600">Centrales Auditées</span>
                                    <span id="analytics-progress-percent" class="font-bold text-blue-600">0%</span>
                                </div>
                                <div class="w-full bg-gray-200 rounded-full h-4">
                                    <div id="analytics-progress-bar" class="bg-gradient-to-r from-blue-500 to-blue-600 h-4 rounded-full transition-all duration-500" style="width: 0%"></div>
                                </div>
                            </div>
                            <div class="grid grid-cols-1 gap-4 mt-6">
                                <div class="bg-gray-50 p-4 rounded-lg">
                                    <p class="text-sm text-gray-600">Restant à auditer</p>
                                    <p id="analytics-remaining" class="text-2xl font-bold text-gray-800">52</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Taux de Complétion -->
                    <div class="bg-white rounded-lg shadow p-6">
                        <h3 class="text-lg font-bold mb-4 flex items-center">
                            <i class="fas fa-tasks text-green-600 mr-2"></i>
                            Taux de Complétion
                        </h3>
                        <canvas id="chartCompletion"></canvas>
                    </div>
                </div>
                
                <!-- Export & Livrables GIRASOLE -->
                <div class="bg-gradient-to-r from-orange-500 to-orange-600 rounded-lg shadow-lg p-6 mb-6">
                    <div class="flex items-center justify-between text-white">
                        <div>
                            <h3 class="text-xl font-bold mb-2 flex items-center">
                                <i class="fas fa-file-excel mr-3 text-2xl"></i>
                                Export ANNEXE 2 GIRASOLE
                            </h3>
                            <p class="text-orange-100 text-sm">Télécharger le fichier Excel requis pour livraison à GIRASOLE</p>
                        </div>
                        <div class="flex flex-col space-y-2">
                            <select id="annexe2-filter-subcontractor" class="px-4 py-2 rounded-lg text-gray-800 font-medium">
                                <option value="">Tous les sous-traitants</option>
                                <option value="ARTEMIS">ARTEMIS uniquement</option>
                                <option value="CADENET">CADENET uniquement</option>
                                <option value="DIAGPV - Adrien & Fabien">DIAGPV uniquement</option>
                            </select>
                            <button onclick="downloadAnnexe2CSV()" class="bg-white hover:bg-gray-100 text-orange-600 font-bold py-3 px-6 rounded-lg shadow-lg transition transform hover:scale-105 flex items-center">
                                <i class="fas fa-download mr-2"></i>
                                Télécharger CSV
                            </button>
                        </div>
                    </div>
                    <div class="mt-4 bg-orange-400 bg-opacity-30 rounded-lg p-3 text-white text-sm">
                        <i class="fas fa-info-circle mr-2"></i>
                        <strong>Instructions :</strong> Le fichier CSV généré contient toutes les missions complétées (statut TERMINE ou VALIDE). 
                        Ouvrir dans Excel → Enregistrer sous .xlsx → Envoyer à GIRASOLE.
                    </div>
                </div>
                
                <!-- KPI Cards -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
                    <div class="bg-gradient-to-br from-blue-500 to-blue-600 rounded-lg shadow-lg p-6 text-white">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-blue-100 text-sm font-medium">Moyenne Photos/Centrale</p>
                                <p id="analytics-avg-photos" class="text-3xl font-bold mt-2">0</p>
                            </div>
                            <i class="fas fa-camera text-5xl text-blue-300 opacity-50"></i>
                        </div>
                    </div>
                    
                    <div class="bg-gradient-to-br from-green-500 to-green-600 rounded-lg shadow-lg p-6 text-white">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-green-100 text-sm font-medium">Volumétrie Totale</p>
                                <p id="analytics-volume-total" class="text-3xl font-bold mt-2">0 GB</p>
                            </div>
                            <i class="fas fa-database text-5xl text-green-300 opacity-50"></i>
                        </div>
                    </div>
                    
                    <div class="bg-gradient-to-br from-purple-500 to-purple-600 rounded-lg shadow-lg p-6 text-white">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-purple-100 text-sm font-medium">Taux Validation</p>
                                <p id="analytics-validation-rate" class="text-3xl font-bold mt-2">0%</p>
                            </div>
                            <i class="fas fa-check-circle text-5xl text-purple-300 opacity-50"></i>
                        </div>
                    </div>
                </div>
                
                <!-- Détails par Type -->
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                    <div class="bg-white rounded-lg shadow p-6">
                        <h3 class="text-lg font-bold mb-4 flex items-center">
                            <i class="fas fa-sun text-yellow-600 mr-2"></i>
                            Centrales SOL (39)
                        </h3>
                        <div class="space-y-3">
                            <div class="flex justify-between items-center p-3 bg-gray-50 rounded">
                                <span class="text-gray-600">À Auditer</span>
                                <span id="sol-a-auditer" class="font-bold text-gray-800">0</span>
                            </div>
                            <div class="flex justify-between items-center p-3 bg-yellow-50 rounded">
                                <span class="text-gray-600">En Cours</span>
                                <span id="sol-en-cours" class="font-bold text-yellow-600">0</span>
                            </div>
                            <div class="flex justify-between items-center p-3 bg-green-50 rounded">
                                <span class="text-gray-600">Terminé</span>
                                <span id="sol-termine" class="font-bold text-green-600">0</span>
                            </div>
                            <div class="flex justify-between items-center p-3 bg-purple-50 rounded">
                                <span class="text-gray-600">Validé</span>
                                <span id="sol-valide" class="font-bold text-purple-600">0</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="bg-white rounded-lg shadow p-6">
                        <h3 class="text-lg font-bold mb-4 flex items-center">
                            <i class="fas fa-building text-green-600 mr-2"></i>
                            Centrales TOITURE (13)
                        </h3>
                        <div class="space-y-3">
                            <div class="flex justify-between items-center p-3 bg-gray-50 rounded">
                                <span class="text-gray-600">À Auditer</span>
                                <span id="toiture-a-auditer" class="font-bold text-gray-800">0</span>
                            </div>
                            <div class="flex justify-between items-center p-3 bg-yellow-50 rounded">
                                <span class="text-gray-600">En Cours</span>
                                <span id="toiture-en-cours" class="font-bold text-yellow-600">0</span>
                            </div>
                            <div class="flex justify-between items-center p-3 bg-green-50 rounded">
                                <span class="text-gray-600">Terminé</span>
                                <span id="toiture-termine" class="font-bold text-green-600">0</span>
                            </div>
                            <div class="flex justify-between items-center p-3 bg-purple-50 rounded">
                                <span class="text-gray-600">Validé</span>
                                <span id="toiture-valide" class="font-bold text-purple-600">0</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Export Data -->
                <div class="mt-6 bg-white rounded-lg shadow p-6">
                    <h3 class="text-lg font-bold mb-4 flex items-center">
                        <i class="fas fa-download text-blue-600 mr-2"></i>
                        Export Données
                    </h3>
                    <div class="flex space-x-4">
                        <button onclick="exportToCSV()" class="flex-1 bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-6 rounded transition">
                            <i class="fas fa-file-csv mr-2"></i>Exporter CSV
                        </button>
                        <button onclick="exportToJSON()" class="flex-1 bg-green-600 hover:bg-green-700 text-white font-bold py-3 px-6 rounded transition">
                            <i class="fas fa-file-code mr-2"></i>Exporter JSON
                        </button>
                        <button onclick="printReport()" class="flex-1 bg-purple-600 hover:bg-purple-700 text-white font-bold py-3 px-6 rounded transition">
                            <i class="fas fa-print mr-2"></i>Imprimer Rapport
                        </button>
                    </div>
                </div>
            </div>

            <!-- Documentation Tab -->
            <div id="tab-docs" class="tab-content hidden">
                <div class="bg-white rounded-lg shadow p-8">
                    <h3 class="text-lg font-bold mb-6"><i class="fas fa-book mr-2"></i>Documentation Mission GIRASOLE 2025</h3>
                    
                    <div class="space-y-6">
                        <div class="border-l-4 border-blue-500 pl-6">
                            <h4 class="font-bold text-lg mb-2">📋 Checklist V4 (54 points CDC)</h4>
                            <p class="text-gray-600 mb-4">Checklist d'audit technique conforme aux normes IEC 62446-1, IEC 61215/61730</p>
                            <ul class="list-disc ml-6 space-y-1 text-gray-600">
                                <li>8 catégories photos : DOC, ELEC, TRANCHEES, MP, TOIT, BP, GEN, TOITURE_DETAIL</li>
                                <li>SOL : 40+ photos minimum | TOITURE : 55+ photos minimum</li>
                                <li>Format retour : JSON V4 avec photos Base64 intégrées (~18 MB)</li>
                            </ul>
                        </div>

                        <div class="border-l-4 border-green-500 pl-6">
                            <h4 class="font-bold text-lg mb-2">🔄 Workflow 5 Phases</h4>
                            <ol class="list-decimal ml-6 space-y-2 text-gray-600">
                                <li><strong>Préparation</strong> : Génération checklist HTML vierge → Envoi technicien</li>
                                <li><strong>Audit Terrain</strong> : Remplissage smartphone + photos (6h30 SOL, 8h10 TOITURE)</li>
                                <li><strong>Retour/Validation</strong> : Export JSON V4 → Envoi Adrien → Vérification</li>
                                <li><strong>Traitement</strong> : Extraction photos JPEG + Analyse données</li>
                                <li><strong>Livraison</strong> : Génération rapport PDF + Envoi client (< 5 jours)</li>
                            </ol>
                        </div>

                        <div class="border-l-4 border-purple-500 pl-6">
                            <h4 class="font-bold text-lg mb-2">📊 Volumétrie Mission 52 Centrales</h4>
                            <table class="min-w-full mt-4 border">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th class="px-4 py-2 border">Type Fichier</th>
                                        <th class="px-4 py-2 border">Unitaire</th>
                                        <th class="px-4 py-2 border">52 Centrales</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="px-4 py-2 border">JSON V4</td>
                                        <td class="px-4 py-2 border">18 MB</td>
                                        <td class="px-4 py-2 border font-bold">~1 GB</td>
                                    </tr>
                                    <tr>
                                        <td class="px-4 py-2 border">Photos JPEG</td>
                                        <td class="px-4 py-2 border">150 MB</td>
                                        <td class="px-4 py-2 border font-bold">7.8 GB</td>
                                    </tr>
                                    <tr>
                                        <td class="px-4 py-2 border">Rapports PDF</td>
                                        <td class="px-4 py-2 border">1.8 MB</td>
                                        <td class="px-4 py-2 border font-bold">94 MB</td>
                                    </tr>
                                    <tr class="bg-blue-50 font-bold">
                                        <td class="px-4 py-2 border">TOTAL</td>
                                        <td class="px-4 py-2 border">-</td>
                                        <td class="px-4 py-2 border">~9.0 GB</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="border-l-4 border-orange-500 pl-6">
                            <h4 class="font-bold text-lg mb-2">🔒 Stratégie Backup 3-2-1</h4>
                            <ul class="list-disc ml-6 space-y-1 text-gray-600">
                                <li><strong>3 copies</strong> : Original + Backup local + Cloud/USB</li>
                                <li><strong>2 médias</strong> : Disque interne + Externe (USB/Cloud)</li>
                                <li><strong>1 offsite</strong> : Google Drive via rclone</li>
                                <li><strong>Rétention</strong> : JSON 5 ans, Photos 2 ans, PDF permanent</li>
                                <li><strong>Automatisation</strong> : Backup quotidien 2h00 avec rotation 7 jours</li>
                            </ul>
                        </div>

                        <div class="border-l-4 border-red-500 pl-6">
                            <h4 class="font-bold text-lg mb-2">📅 Planning</h4>
                            <p class="text-gray-600"><strong>52 centrales</strong> réparties sur 3-4 semaines</p>
                            <p class="text-gray-600"><strong>5 sous-traitants</strong> mobilisés pour la mission</p>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="bg-gray-800 text-white mt-12 py-6">
            <div class="container mx-auto px-6 text-center">
                <p>&copy; 2025 Diagnostic Photovoltaïque - Adrien Pappalardo</p>
                <p class="text-gray-400 text-sm mt-2">Mission GIRASOLE 2025 - Interface Web Professionnelle</p>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/axios@1.6.0/dist/axios.min.js"></script>
        <script src="/static/app.js"></script>
        <script src="/static/planning.js"></script>
    </body>
    </html>
  `)
})

// ========================================
// PAGE - PLANNING GIRASOLE INTERFACE WEB
// ========================================
app.get('/planning-girasole', (c) => {
  return c.html(`
    <!DOCTYPE html>
    <html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Planning GIRASOLE 2025 - Diagnostic Photovoltaïque</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.0/css/all.min.css" rel="stylesheet">
        <style>
            .stat-card {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                transition: transform 0.2s, box-shadow 0.2s;
            }
            .stat-card:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            }
            .table-row:hover {
                background-color: #f3f4f6;
            }
            .badge-toulouse {
                background-color: #DBEAFE;
                color: #1E40AF;
            }
            .badge-lyon {
                background-color: #FEE2E2;
                color: #991B1B;
            }
            .loader-overlay {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0, 0, 0, 0.7);
                display: none;
                align-items: center;
                justify-content: center;
                z-index: 9999;
            }
            .loader-overlay.active {
                display: flex;
            }
            .spinner {
                border: 4px solid #f3f3f3;
                border-top: 4px solid #3b82f6;
                border-radius: 50%;
                width: 50px;
                height: 50px;
                animation: spin 1s linear infinite;
            }
            @keyframes spin {
                0% { transform: rotate(0deg); }
                100% { transform: rotate(360deg); }
            }
        </style>
    </head>
    <body class="bg-gray-50">
        <!-- Loader Overlay -->
        <div id="loader" class="loader-overlay">
            <div class="text-center">
                <div class="spinner mx-auto mb-4"></div>
                <p class="text-white text-lg">Chargement...</p>
            </div>
        </div>

        <!-- Header -->
        <header class="bg-gradient-to-r from-blue-600 to-purple-600 text-white shadow-lg">
            <div class="container mx-auto px-6 py-6">
                <div class="flex items-center justify-between">
                    <div>
                        <h1 class="text-3xl font-bold">
                            <i class="fas fa-solar-panel mr-3"></i>
                            Planning GIRASOLE 2025
                        </h1>
                        <p class="text-blue-100 mt-2">
                            <i class="fas fa-building mr-2"></i>
                            Client GIRASOLE - Sélection des 25 premières centrales
                        </p>
                    </div>
                    <div class="text-right">
                        <a href="/" class="bg-white text-blue-600 px-4 py-2 rounded-lg hover:bg-blue-50 transition">
                            <i class="fas fa-home mr-2"></i>Retour accueil
                        </a>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <main class="container mx-auto px-6 py-8">
            
            <!-- Statistics Cards -->
            <div id="stats-container" class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
                <div class="stat-card rounded-lg shadow-lg p-6 text-white">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-blue-100 text-sm uppercase tracking-wide">Centrales</p>
                            <p id="stat-total" class="text-3xl font-bold mt-1">-</p>
                        </div>
                        <i class="fas fa-solar-panel text-4xl opacity-80"></i>
                    </div>
                </div>
                
                <div class="stat-card rounded-lg shadow-lg p-6 text-white">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-blue-100 text-sm uppercase tracking-wide">Puissance totale</p>
                            <p id="stat-power" class="text-3xl font-bold mt-1">-</p>
                        </div>
                        <i class="fas fa-bolt text-4xl opacity-80"></i>
                    </div>
                </div>
                
                <div class="stat-card rounded-lg shadow-lg p-6 text-white">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-blue-100 text-sm uppercase tracking-wide">Base Toulouse</p>
                            <p id="stat-toulouse" class="text-3xl font-bold mt-1">-</p>
                        </div>
                        <i class="fas fa-map-marker-alt text-4xl opacity-80"></i>
                    </div>
                </div>
                
                <div class="stat-card rounded-lg shadow-lg p-6 text-white">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-blue-100 text-sm uppercase tracking-wide">Base Lyon</p>
                            <p id="stat-lyon" class="text-3xl font-bold mt-1">-</p>
                        </div>
                        <i class="fas fa-map-marker-alt text-4xl opacity-80"></i>
                    </div>
                </div>
            </div>

            <!-- Filters & Search -->
            <div class="bg-white rounded-lg shadow-md p-6 mb-6">
                <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-search mr-2"></i>Recherche
                        </label>
                        <input 
                            type="text" 
                            id="search-input" 
                            placeholder="Nom ou localisation..."
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                            oninput="filterCentrales()"
                        >
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-filter mr-2"></i>Base
                        </label>
                        <select 
                            id="base-filter" 
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                            onchange="filterCentrales()"
                        >
                            <option value="all">Toutes les bases</option>
                            <option value="Toulouse">Toulouse</option>
                            <option value="Lyon">Lyon</option>
                        </select>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-info-circle mr-2"></i>Statut
                        </label>
                        <select 
                            id="statut-filter" 
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                            onchange="filterCentrales()"
                        >
                            <option value="all">Tous les statuts</option>
                            <option value="A_AUDITER">À auditer</option>
                            <option value="EN_COURS">En cours</option>
                            <option value="TERMINE">Terminé</option>
                            <option value="VALIDE">Validé</option>
                        </select>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-sort mr-2"></i>Trier par
                        </label>
                        <select 
                            id="sort-select" 
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                            onchange="sortCentrales()"
                        >
                            <option value="distance">Distance (croissant)</option>
                            <option value="distance-desc">Distance (décroissant)</option>
                            <option value="power">Puissance (décroissant)</option>
                            <option value="name">Nom (A-Z)</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Batch Export Form -->
            <div class="bg-gradient-to-r from-green-50 to-blue-50 rounded-lg shadow-md p-6 mb-6 border-2 border-green-200">
                <div class="flex items-center justify-between mb-4">
                    <h3 class="text-xl font-bold text-gray-800">
                        <i class="fas fa-calendar-plus mr-2 text-green-600"></i>
                        Création batch des ordres de mission
                    </h3>
                    <div id="selection-counter" class="bg-green-600 text-white px-4 py-2 rounded-full font-bold">
                        0 sélectionné(s)
                    </div>
                </div>
                
                <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-user-tie mr-2"></i>Technicien
                        </label>
                        <select 
                            id="technicien-select" 
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
                        >
                            <option value="">Sélectionner un technicien...</option>
                        </select>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-building mr-2"></i>Sous-traitant
                        </label>
                        <select 
                            id="sous-traitant-select" 
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
                        >
                            <option value="">Sélectionner un sous-traitant...</option>
                        </select>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-calendar mr-2"></i>Date de début
                        </label>
                        <input 
                            type="date" 
                            id="date-debut" 
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
                        >
                    </div>
                    
                    <div class="flex items-end">
                        <button 
                            onclick="exportBatchMissions()" 
                            class="w-full bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-lg transition shadow-md"
                        >
                            <i class="fas fa-rocket mr-2"></i>Créer les missions
                        </button>
                    </div>
                </div>
                
                <div class="text-sm text-gray-600">
                    <i class="fas fa-info-circle mr-2 text-blue-500"></i>
                    <strong>Note :</strong> Les missions seront créées séquentiellement avec 1 jour par centrale (7h d'intervention).
                    Le statut des centrales passera automatiquement à "EN_COURS".
                </div>
            </div>

            <!-- Table Container -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden">
                <div class="p-6 border-b border-gray-200">
                    <div class="flex items-center justify-between">
                        <h3 class="text-xl font-bold text-gray-800">
                            <i class="fas fa-list mr-2"></i>
                            Liste des centrales GIRASOLE
                        </h3>
                        <label class="flex items-center cursor-pointer">
                            <input 
                                type="checkbox" 
                                id="select-all" 
                                onchange="toggleSelectAll(this.checked)"
                                class="w-5 h-5 text-blue-600 border-gray-300 rounded focus:ring-blue-500 mr-2"
                            >
                            <span class="text-sm font-medium text-gray-700">Tout sélectionner</span>
                        </label>
                    </div>
                </div>
                
                <div id="centrales-table" class="overflow-x-auto">
                    <!-- Table will be populated by JavaScript -->
                    <div class="p-12 text-center text-gray-500">
                        <i class="fas fa-spinner fa-spin text-4xl mb-4"></i>
                        <p>Chargement des données...</p>
                    </div>
                </div>
            </div>

            <!-- Export Buttons -->
            <div class="mt-6 flex gap-4 justify-end">
                <a 
                    href="/api/planning/export-excel" 
                    target="_blank"
                    class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-6 rounded-lg transition shadow-md"
                >
                    <i class="fas fa-file-excel mr-2"></i>Télécharger Excel
                </a>
                <a 
                    href="/api/planning/export-json" 
                    target="_blank"
                    class="bg-gray-600 hover:bg-gray-700 text-white font-bold py-3 px-6 rounded-lg transition shadow-md"
                >
                    <i class="fas fa-file-code mr-2"></i>Télécharger JSON
                </a>
            </div>

        </main>

        <!-- Footer -->
        <footer class="bg-gray-800 text-white mt-12 py-6">
            <div class="container mx-auto px-6 text-center">
                <p>&copy; 2025 Diagnostic Photovoltaïque - Adrien Pappalardo</p>
                <p class="text-gray-400 text-sm mt-2">Planning GIRASOLE 2025 - Interface Web Professionnelle</p>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/axios@1.6.0/dist/axios.min.js"></script>
        <script src="/static/planning-girasole.js"></script>
    </body>
    </html>
  `)
})

// ========================================
// PAGE - GESTION PLANNING COMPLET 52 CENTRALES
// ========================================
app.get('/planning-manager', (c) => {
  return c.html(`
    <!DOCTYPE html>
    <html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestion Planning GIRASOLE - 52 Centrales</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.0/css/all.min.css" rel="stylesheet">
        <style>
            .stat-card {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                transition: transform 0.2s, box-shadow 0.2s;
            }
            .stat-card:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            }
            .table-row:hover {
                background-color: #f9fafb;
            }
            .loader-overlay {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0, 0, 0, 0.7);
                display: none;
                align-items: center;
                justify-content: center;
                z-index: 9999;
            }
            .loader-overlay.active {
                display: flex;
            }
            .spinner {
                border: 4px solid #f3f3f3;
                border-top: 4px solid #3b82f6;
                border-radius: 50%;
                width: 50px;
                height: 50px;
                animation: spin 1s linear infinite;
            }
            @keyframes spin {
                0% { transform: rotate(0deg); }
                100% { transform: rotate(360deg); }
            }
        </style>
    </head>
    <body class="bg-gray-50">
        <!-- Loader -->
        <div id="loader" class="loader-overlay">
            <div class="text-center">
                <div class="spinner mx-auto mb-4"></div>
                <p class="text-white text-lg">Chargement...</p>
            </div>
        </div>

        <!-- Header -->
        <header class="bg-gradient-to-r from-blue-600 to-purple-600 text-white shadow-lg">
            <div class="container mx-auto px-6 py-6">
                <div class="flex items-center justify-between">
                    <div>
                        <h1 class="text-3xl font-bold">
                            <i class="fas fa-tasks mr-3"></i>
                            Gestion Planning GIRASOLE 2025
                        </h1>
                        <p class="text-blue-100 mt-2">
                            <i class="fas fa-building mr-2"></i>
                            Attribution sous-traitants et planning complet 52 centrales
                        </p>
                    </div>
                    <div class="text-right">
                        <a href="/" class="bg-white text-blue-600 px-4 py-2 rounded-lg hover:bg-blue-50 transition mr-2">
                            <i class="fas fa-home mr-2"></i>Accueil
                        </a>
                        <a href="/documents" class="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-400 transition mr-2">
                            <i class="fas fa-folder-open mr-2"></i>Documents
                        </a>
                        <a href="/planning-girasole" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-400 transition">
                            <i class="fas fa-eye mr-2"></i>Vue simple
                        </a>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <main class="container mx-auto px-6 py-8">
            
            <!-- Statistics Cards -->
            <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
                <div class="stat-card rounded-lg shadow-lg p-6 text-white">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-blue-100 text-sm uppercase tracking-wide">Total Centrales</p>
                            <p id="stat-total" class="text-3xl font-bold mt-1">-</p>
                        </div>
                        <i class="fas fa-solar-panel text-4xl opacity-80"></i>
                    </div>
                </div>
                
                <div class="stat-card rounded-lg shadow-lg p-6 text-white">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-blue-100 text-sm uppercase tracking-wide">Assignées</p>
                            <p id="stat-assigned" class="text-3xl font-bold mt-1">-</p>
                        </div>
                        <i class="fas fa-check-circle text-4xl opacity-80"></i>
                    </div>
                </div>
                
                <div class="stat-card rounded-lg shadow-lg p-6 text-white">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-blue-100 text-sm uppercase tracking-wide">Non assignées</p>
                            <p id="stat-unassigned" class="text-3xl font-bold mt-1">-</p>
                        </div>
                        <i class="fas fa-hourglass-half text-4xl opacity-80"></i>
                    </div>
                </div>
                
                <div class="stat-card rounded-lg shadow-lg p-6 text-white">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-blue-100 text-sm uppercase tracking-wide">Planifiées</p>
                            <p id="stat-planned" class="text-3xl font-bold mt-1">-</p>
                        </div>
                        <i class="fas fa-calendar-check text-4xl opacity-80"></i>
                    </div>
                </div>
            </div>

            <!-- Synchronisation CSV SharePoint (SANS OAUTH2) -->
            <div class="bg-gradient-to-r from-yellow-50 to-orange-50 rounded-lg shadow-md p-6 mb-6 border-2 border-yellow-200">
                <h3 class="text-xl font-bold text-gray-800 mb-4">
                    <i class="fas fa-cloud-upload-alt mr-2 text-orange-600"></i>
                    Synchronisation SharePoint (Upload CSV Manuel)
                </h3>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div class="col-span-2">
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-file-csv mr-2"></i>
                            Fichier CSV ANNEXE 1 (depuis SharePoint)
                        </label>
                        <input type="file" id="csv-file-input" accept=".csv" 
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-orange-500">
                        <p class="text-xs text-gray-500 mt-1">
                            <i class="fas fa-info-circle mr-1"></i>
                            Téléchargez ANNEXE 1 depuis SharePoint, puis uploadez-le ici pour synchroniser les données
                        </p>
                    </div>
                    <div class="flex items-end">
                        <button onclick="uploadCSV()" 
                                class="w-full bg-gradient-to-r from-orange-500 to-yellow-500 text-white px-6 py-3 rounded-lg hover:from-orange-600 hover:to-yellow-600 transition font-semibold shadow-lg">
                            <i class="fas fa-sync mr-2"></i>
                            Synchroniser D1
                        </button>
                    </div>
                </div>
                <div id="csv-sync-result" class="mt-4 hidden"></div>
            </div>

            <!-- Attribution automatique batch -->
            <div class="bg-gradient-to-r from-green-50 to-blue-50 rounded-lg shadow-md p-6 mb-6 border-2 border-green-200">
                <h3 class="text-xl font-bold text-gray-800 mb-4">
                    <i class="fas fa-magic mr-2 text-green-600"></i>
                    Attribution Automatique Intelligente
                </h3>
                
                <div class="grid grid-cols-1 md:grid-cols-5 gap-4 mb-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-hashtag mr-1"></i>Nb centrales
                        </label>
                        <input 
                            type="number" 
                            id="max-centrales" 
                            value="25"
                            min="1"
                            max="52"
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
                        >
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-calendar mr-1"></i>Date début
                        </label>
                        <input 
                            type="date" 
                            id="date-debut-batch" 
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
                        >
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-building mr-1"></i>ST Toulouse
                        </label>
                        <select 
                            id="st-toulouse-batch" 
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
                        >
                            <option value="">Sélectionner...</option>
                        </select>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-building mr-1"></i>ST Lyon
                        </label>
                        <select 
                            id="st-lyon-batch" 
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
                        >
                            <option value="">Sélectionner...</option>
                        </select>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-user-tie mr-1"></i>Technicien
                        </label>
                        <select 
                            id="tech-batch" 
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500"
                        >
                            <option value="">Sélectionner...</option>
                        </select>
                    </div>
                </div>
                
                <div class="flex items-center justify-between">
                    <div class="text-sm text-gray-600">
                        <i class="fas fa-info-circle mr-2 text-blue-500"></i>
                        <strong>Assignation intelligente :</strong> Les centrales proches de Toulouse seront assignées au ST Toulouse, celles proches de Lyon au ST Lyon. Dates séquentielles (1 jour/centrale).
                    </div>
                    <button 
                        onclick="autoAssignBatch()" 
                        class="bg-green-600 hover:bg-green-700 text-white font-bold py-3 px-6 rounded-lg transition shadow-md"
                    >
                        <i class="fas fa-bolt mr-2"></i>Assigner automatiquement
                    </button>
                </div>
            </div>

            <!-- Filters -->
            <div class="bg-white rounded-lg shadow-md p-6 mb-6">
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-search mr-2"></i>Recherche
                        </label>
                        <input 
                            type="text" 
                            id="search-input" 
                            placeholder="Nom, localisation, sous-traitant..."
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                            oninput="filterPlanning()"
                        >
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-map-marker-alt mr-2"></i>Base
                        </label>
                        <select 
                            id="base-filter" 
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                            onchange="filterPlanning()"
                        >
                            <option value="all">Toutes les bases</option>
                            <option value="Toulouse">Toulouse</option>
                            <option value="Lyon">Lyon</option>
                        </select>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-filter mr-2"></i>Statut
                        </label>
                        <select 
                            id="statut-filter" 
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                            onchange="filterPlanning()"
                        >
                            <option value="all">Tous les statuts</option>
                            <option value="assigned">Assignées</option>
                            <option value="unassigned">Non assignées</option>
                            <option value="planned">Planifiées</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Table Planning -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden">
                <div class="p-6 border-b border-gray-200">
                    <div class="flex items-center justify-between">
                        <h3 class="text-xl font-bold text-gray-800">
                            <i class="fas fa-table mr-2"></i>
                            Planning Complet 52 Centrales
                        </h3>
                        <div class="flex items-center space-x-4">
                            <div id="selection-counter" class="bg-blue-600 text-white px-4 py-2 rounded-full font-bold">
                                0 sélectionnée(s)
                            </div>
                            <button onclick="generateAllMissions()" class="bg-orange-600 hover:bg-orange-700 text-white px-4 py-2 rounded-lg transition shadow-lg">
                                <i class="fas fa-check-circle mr-2"></i>Générer ordres de mission
                            </button>
                            <button onclick="exportPlanningExcel()" class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded-lg transition">
                                <i class="fas fa-file-excel mr-2"></i>Export Excel
                            </button>
                            <button onclick="exportAnnexe1Enrichie()" class="bg-purple-600 hover:bg-purple-700 text-white px-4 py-2 rounded-lg transition shadow-lg font-semibold">
                                <i class="fas fa-file-download mr-2"></i>Exporter ANNEXE 1 Enrichie
                            </button>
                        </div>
                    </div>
                </div>
                
                <div id="planning-table" class="overflow-x-auto">
                    <div class="p-12 text-center text-gray-500">
                        <i class="fas fa-spinner fa-spin text-4xl mb-4"></i>
                        <p>Chargement du planning...</p>
                    </div>
                </div>
            </div>

        </main>

        <!-- Footer -->
        <footer class="bg-gray-800 text-white mt-12 py-6">
            <div class="container mx-auto px-6 text-center">
                <p>&copy; 2025 Diagnostic Photovoltaïque - Adrien Pappalardo</p>
                <p class="text-gray-400 text-sm mt-2">Gestion Planning GIRASOLE 2025 - 52 Centrales</p>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/axios@1.6.0/dist/axios.min.js"></script>
        <script>
        // ═══════════════════════════════════════════════════════════════════════════════
        // FONCTION UPLOAD CSV SHAREPOINT (SANS OAUTH2)
        // ═══════════════════════════════════════════════════════════════════════════════
        
        async function uploadCSV() {
            const fileInput = document.getElementById('csv-file-input');
            const resultDiv = document.getElementById('csv-sync-result');
            
            if (!fileInput.files || !fileInput.files[0]) {
                resultDiv.className = 'mt-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded';
                resultDiv.innerHTML = '<i class="fas fa-exclamation-circle mr-2"></i>Veuillez sélectionner un fichier CSV';
                resultDiv.classList.remove('hidden');
                return;
            }
            
            const file = fileInput.files[0];
            
            // Vérifier extension
            if (!file.name.endsWith('.csv')) {
                resultDiv.className = 'mt-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded';
                resultDiv.innerHTML = '<i class="fas fa-exclamation-circle mr-2"></i>Le fichier doit être au format CSV';
                resultDiv.classList.remove('hidden');
                return;
            }
            
            // Afficher loader
            resultDiv.className = 'mt-4 bg-blue-100 border border-blue-400 text-blue-700 px-4 py-3 rounded';
            resultDiv.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Synchronisation en cours...';
            resultDiv.classList.remove('hidden');
            
            try {
                // Lire le contenu du fichier
                const csvContent = await file.text();
                
                // Envoyer au serveur
                const response = await axios.post('/api/sharepoint/upload-csv', {
                    csv_content: csvContent
                });
                
                if (response.data.success) {
                    resultDiv.className = 'mt-4 bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded';
                    resultDiv.innerHTML = \`
                        <div class="flex items-center">
                            <i class="fas fa-check-circle text-2xl mr-3"></i>
                            <div>
                                <p class="font-bold">Synchronisation réussie !</p>
                                <p class="text-sm mt-1">
                                    <i class="fas fa-database mr-1"></i>
                                    \${response.data.centrales_synchronisees} centrales synchronisées dans D1
                                </p>
                                \${response.data.erreurs ? \`<p class="text-sm text-orange-600 mt-1"><i class="fas fa-exclamation-triangle mr-1"></i>Quelques erreurs mineures détectées</p>\` : ''}
                            </div>
                        </div>
                    \`;
                    
                    // Recharger les statistiques après 2 secondes
                    setTimeout(() => {
                        window.location.reload();
                    }, 2000);
                } else {
                    throw new Error(response.data.error || 'Erreur inconnue');
                }
            } catch (error) {
                resultDiv.className = 'mt-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded';
                resultDiv.innerHTML = \`
                    <i class="fas fa-times-circle mr-2"></i>
                    <strong>Erreur:</strong> \${error.response?.data?.error || error.message}
                \`;
            }
        }

        // ========================================
        // FULLCALENDAR - VUE CALENDRIER
        // ========================================
        let calendar = null;
        
        // Initialiser FullCalendar
        function initCalendar() {
            const calendarEl = document.getElementById('calendrier-view');
            if (!calendarEl || calendar) return; // Déjà initialisé
            
            calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                locale: 'fr',
                height: 'auto',
                firstDay: 1, // Lundi
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,listWeek'
                },
                buttonText: {
                    today: "Aujourd'hui",
                    month: 'Mois',
                    week: 'Semaine',
                    list: 'Liste'
                },
                events: function(info, successCallback, failureCallback) {
                    // Charger les événements depuis l'API /api/planning
                    const filter = document.getElementById('calendar-filter-subcontractor')?.value || '';
                    
                    fetch('/api/planning')
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                const events = data.data
                                    .filter(event => !filter || event.nom_entreprise === filter)
                                    .map(event => {
                                        // Déterminer la couleur selon le sous-traitant
                                        let color = '#3b82f6'; // Bleu par défaut
                                        if (event.nom_entreprise === 'ARTEMIS') color = '#8b5cf6'; // Violet
                                        if (event.nom_entreprise === 'CADENET') color = '#10b981'; // Vert
                                        if (event.nom_entreprise?.includes('DIAGPV')) color = '#f59e0b'; // Orange
                                        
                                        return {
                                            id: event.id,
                                            title: event.centrale_nom || event.titre,
                                            start: event.date_debut,
                                            end: event.date_fin,
                                            backgroundColor: color,
                                            borderColor: color,
                                            extendedProps: {
                                                centrale_nom: event.centrale_nom,
                                                centrale_type: event.centrale_type,
                                                puissance_kwc: event.puissance_kwc,
                                                technicien: event.technicien_prenom + ' ' + event.technicien_nom,
                                                sous_traitant: event.nom_entreprise,
                                                statut: event.statut,
                                                ordre_mission_id: event.ordre_mission_id
                                            }
                                        };
                                    });
                                successCallback(events);
                            } else {
                                failureCallback(new Error(data.error));
                            }
                        })
                        .catch(error => {
                            console.error('Erreur chargement planning:', error);
                            failureCallback(error);
                        });
                },
                eventClick: function(info) {
                    // Afficher les détails de l'événement
                    const event = info.event;
                    const props = event.extendedProps;
                    
                    const modal = \`
                        <div class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50" id="event-detail-modal" onclick="closeEventModal(event)">
                            <div class="bg-white rounded-lg shadow-xl max-w-2xl w-full mx-4 p-6" onclick="event.stopPropagation()">
                                <div class="flex items-start justify-between mb-4">
                                    <div>
                                        <h3 class="text-2xl font-bold text-gray-800">\${props.centrale_nom}</h3>
                                        <p class="text-sm text-gray-500 mt-1">\${props.centrale_type}</p>
                                    </div>
                                    <button onclick="closeEventModal(event)" class="text-gray-400 hover:text-gray-600">
                                        <i class="fas fa-times text-2xl"></i>
                                    </button>
                                </div>
                                
                                <div class="space-y-4">
                                    <div class="grid grid-cols-2 gap-4">
                                        <div class="bg-blue-50 p-4 rounded-lg">
                                            <p class="text-sm text-gray-600 mb-1">Puissance</p>
                                            <p class="text-lg font-bold text-blue-600">\${props.puissance_kwc} kWc</p>
                                        </div>
                                        <div class="bg-purple-50 p-4 rounded-lg">
                                            <p class="text-sm text-gray-600 mb-1">Statut</p>
                                            <p class="text-lg font-bold text-purple-600">\${props.statut}</p>
                                        </div>
                                    </div>
                                    
                                    <div class="border-t pt-4">
                                        <p class="text-sm text-gray-600 mb-2"><i class="fas fa-calendar mr-2"></i><strong>Date:</strong> \${new Date(event.start).toLocaleDateString('fr-FR', { day: '2-digit', month: 'long', year: 'numeric' })}</p>
                                        <p class="text-sm text-gray-600 mb-2"><i class="fas fa-user mr-2"></i><strong>Technicien:</strong> \${props.technicien}</p>
                                        <p class="text-sm text-gray-600 mb-2"><i class="fas fa-building mr-2"></i><strong>Sous-traitant:</strong> \${props.sous_traitant}</p>
                                    </div>
                                    
                                    <div class="flex space-x-3 pt-4 border-t">
                                        <a href="/audit/\${props.ordre_mission_id}" target="_blank" class="flex-1 bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-lg text-center">
                                            <i class="fas fa-clipboard-check mr-2"></i>Voir Checklist
                                        </a>
                                        <a href="/om/\${props.ordre_mission_id}" target="_blank" class="flex-1 bg-green-600 hover:bg-green-700 text-white py-2 px-4 rounded-lg text-center">
                                            <i class="fas fa-file-pdf mr-2"></i>Voir OM PDF
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    \`;
                    
                    document.body.insertAdjacentHTML('beforeend', modal);
                },
                eventDidMount: function(info) {
                    // Ajouter un tooltip
                    info.el.title = info.event.title + ' - ' + info.event.extendedProps.sous_traitant;
                }
            });
            
            calendar.render();
        }
        
        // Recharger le calendrier (après changement de filtre)
        function reloadCalendar() {
            if (calendar) {
                calendar.refetchEvents();
            }
        }
        
        // Fermer la modal détail événement
        function closeEventModal(event) {
            const modal = document.getElementById('event-detail-modal');
            if (modal) {
                modal.remove();
            }
        }
        
        // Ouvrir modal ajout événement (à développer si besoin)
        function openAddEventModal() {
            alert('Fonctionnalité "Ajouter intervention" - À développer si besoin\\n\\nPour l\'instant, utilisez l\'onglet "Ordres de Mission" pour créer des missions.');
        }
        
        // ========================================
        // EXPORT ANNEXE 2 CSV
        // ========================================
        function downloadAnnexe2CSV() {
            const sousTraitant = document.getElementById('annexe2-filter-subcontractor')?.value || '';
            
            // Construire URL avec paramètres
            let url = '/api/annexe2/export-csv';
            const params = [];
            
            if (sousTraitant) {
                params.push('sous_traitant=' + encodeURIComponent(sousTraitant));
            }
            
            if (params.length > 0) {
                url += '?' + params.join('&');
            }
            
            // Afficher message de chargement
            const btn = event.target;
            const originalText = btn.innerHTML;
            btn.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Génération en cours...';
            btn.disabled = true;
            
            // Télécharger le fichier
            fetch(url)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Erreur lors de la génération du CSV');
                    }
                    return response.blob();
                })
                .then(blob => {
                    // Créer un lien de téléchargement temporaire
                    const url = window.URL.createObjectURL(blob);
                    const a = document.createElement('a');
                    a.href = url;
                    const date = new Date().toISOString().split('T')[0];
                    a.download = 'ANNEXE2_GIRASOLE_' + date + '.csv';
                    document.body.appendChild(a);
                    a.click();
                    document.body.removeChild(a);
                    window.URL.revokeObjectURL(url);
                    
                    // Restaurer bouton
                    btn.innerHTML = originalText;
                    btn.disabled = false;
                    
                    // Message succès
                    alert('✅ ANNEXE 2 téléchargé !\\n\\nOuvrez le fichier CSV dans Excel et enregistrez-le au format .xlsx avant envoi à GIRASOLE.');
                })
                .catch(error => {
                    console.error('Erreur export ANNEXE 2:', error);
                    btn.innerHTML = originalText;
                    btn.disabled = false;
                    alert('❌ Erreur lors de l\\'export ANNEXE 2.\\n\\nVérifiez qu\\'il existe des missions complétées (statut TERMINE ou VALIDE).');
                });
        }
        
        // Initialiser le calendrier quand l'onglet planning est affiché
        const originalShowTab = window.showTab;
        window.showTab = function(tabName) {
            originalShowTab(tabName);
            if (tabName === 'planning') {
                setTimeout(() => {
                    if (!calendar) {
                        initCalendar();
                    }
                }, 100);
            }
        };
        
        const originalShowPlanningSubTab = window.showPlanningSubTab;
        window.showPlanningSubTab = function(subTabName) {
            originalShowPlanningSubTab(subTabName);
            if (subTabName === 'calendrier') {
                setTimeout(() => {
                    if (!calendar) {
                        initCalendar();
                    } else {
                        calendar.render(); // Re-render si déjà initialisé
                    }
                }, 100);
            }
        };
        </script>
        <script src="/static/planning-manager.js"></script>
    </body>
    </html>
  `)
})

// ========================================
// API ROUTES - GESTION PLANNING COMPLET
// ========================================

// PUT /api/centrales/:id/assign - Assigner sous-traitant + technicien à une centrale
app.put('/api/centrales/:id/assign', async (c) => {
  const { DB } = c.env
  const centraleId = c.req.param('id')
  
  try {
    const body = await c.req.json()
    const { sous_traitant_id, technicien_id, date_mission_prevue, priorite } = body
    
    // Mettre à jour la centrale avec attribution
    await DB.prepare(`
      UPDATE centrales 
      SET statut = 'EN_COURS'
      WHERE id = ?
    `).bind(centraleId).run()
    
    // Créer ou mettre à jour ordre de mission
    const existingMission = await DB.prepare(`
      SELECT id FROM ordres_mission WHERE centrale_id = ? AND statut != 'ANNULE'
    `).bind(centraleId).first()
    
    if (existingMission) {
      // Update existing mission
      await DB.prepare(`
        UPDATE ordres_mission
        SET sous_traitant_id = ?, technicien_id = ?, date_mission = ?, statut = 'PLANIFIE'
        WHERE id = ?
      `).bind(sous_traitant_id, technicien_id, date_mission_prevue, existingMission.id).run()
      
      return c.json({ success: true, mission_id: existingMission.id, action: 'updated' })
    } else {
      // Create new mission
      const result = await DB.prepare(`
        INSERT INTO ordres_mission (centrale_id, sous_traitant_id, technicien_id, date_mission, heure_debut, duree_estimee_heures, statut)
        VALUES (?, ?, ?, ?, '08:00', 7.0, 'PLANIFIE')
      `).bind(centraleId, sous_traitant_id, technicien_id, date_mission_prevue).run()
      
      return c.json({ success: true, mission_id: result.meta.last_row_id, action: 'created' })
    }
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// DELETE /api/centrales/:id/unassign - Retirer attribution d'une centrale
app.delete('/api/centrales/:id/unassign', async (c) => {
  const { DB } = c.env
  const centraleId = c.req.param('id')
  
  try {
    // Annuler mission existante
    await DB.prepare(`
      UPDATE ordres_mission SET statut = 'ANNULE' WHERE centrale_id = ? AND statut != 'TERMINE'
    `).bind(centraleId).run()
    
    // Remettre centrale à auditer
    await DB.prepare(`
      UPDATE centrales SET statut = 'A_AUDITER' WHERE id = ?
    `).bind(centraleId).run()
    
    return c.json({ success: true, message: 'Attribution retirée' })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// =======================
// API ROUTES - GÉNÉRATION 52 MISSIONS + CHECKLISTS
// =======================

// POST /api/missions/create-52 - Créer 52 missions + checklists adaptées
app.post('/api/missions/create-52', async (c) => {
  const { DB } = c.env
  
  try {
    // 1. Récupérer les 52 centrales (la colonne statut contient 'A_AUDITER')
    const centrales = await DB.prepare(`
      SELECT id, nom, type_centrale, puissance_kwc, adresse, audit_toiture
      FROM centrales
      WHERE statut = 'A_AUDITER'
      ORDER BY id
      LIMIT 52
    `).all()
    
    if (!centrales.results || centrales.results.length === 0) {
      return c.json({ success: false, error: 'Aucune centrale à auditer' }, 400)
    }
    
    // 2. Créer techniciens et sous-traitants par défaut (ARTEMIS + CADENET)
    await DB.prepare(`
      INSERT OR IGNORE INTO sous_traitants (id, nom_entreprise, email_contact, statut) VALUES 
      (1, 'ARTEMIS', 'contact@artemis.fr', 'ACTIF'),
      (2, 'CADENET', 'contact@cadenet.fr', 'ACTIF')
    `).run()
    
    await DB.prepare(`
      INSERT OR IGNORE INTO techniciens (id, sous_traitant_id, prenom, nom, statut) VALUES 
      (1, 1, 'Tech', 'ARTEMIS', 'DISPONIBLE'),
      (2, 2, 'Tech', 'CADENET', 'DISPONIBLE')
    `).run()
    
    // 3. Définition checklist COMMUNE (48 points) + TOITURE (12 points)
    const checklistCommune = [
      // Section 1: PRESCRIPTIONS DOCUMENTAIRES GIRASOLE (4 points)
      { categorie: 'DOC', numero: 1, texte: 'Présence autocontrôle correctement renseigné par installateur' },
      { categorie: 'DOC', numero: 2, texte: 'Présence PV réception lot PV signé GIRASOLE + installateur' },
      { categorie: 'DOC', numero: 3, texte: 'Présence ≥1 CR visite chantier lot PV rédigé GIRASOLE' },
      { categorie: 'DOC', numero: 4, texte: 'Respect cahier des charges tranchées fourni au bailleur' },
      
      // Section 2: CHEMINS DE CÂBLES & FIXATIONS (5 points)
      { categorie: 'CABLAGE', numero: 5, texte: 'Méthode et qualité fixations du chemin de câbles' },
      { categorie: 'CABLAGE', numero: 6, texte: 'Type de cheminement câbles utilisé (galvanisé chaud, froid, etc.)' },
      { categorie: 'CABLAGE', numero: 7, texte: 'Protections mécaniques câbles (protection contact bord saillant, etc.)' },
      { categorie: 'CABLAGE', numero: 8, texte: 'Contrôle rayons courbure câbles AC et DC' },
      { categorie: 'CABLAGE', numero: 9, texte: 'Qualité brassage des câbles' },
      
      // Section 2: REPÉRAGE & IDENTIFICATION (4 points)
      { categorie: 'ELEC', numero: 10, texte: 'Type repérage câble ou filerie (sérigraphié, manuscrit, etc.)' },
      { categorie: 'ELEC', numero: 11, texte: 'Type repérage câbles (tenant-aboutissant, etc.)' },
      { categorie: 'ELEC', numero: 12, texte: 'Repérage équipements (présence, inscrit sur équipement lui-même)' },
      { categorie: 'ELEC', numero: 13, texte: 'Repérage serrage connexions câbles AC' },
      
      // Section 2: CÂBLAGE DC & AC (2 points)
      { categorie: 'ELEC', numero: 14, texte: 'Couleurs câbles DC -/+ différents' },
      { categorie: 'ELEC', numero: 15, texte: 'Présence cosses bimétal jonction cuivre/alu (raccordement + accroche terre nu)' },
      
      // Section 2: MISE À LA TERRE (1 point)
      { categorie: 'ELEC', numero: 16, texte: 'Cheminement terre le long chemins câbles (crapaud, bornier laiton, etc.)' },
      
      // Section 2: PROTECTION & DISJONCTION (1 point)
      { categorie: 'TABLEAUX', numero: 17, texte: 'Réglages AGCP conforme aux plans' },
      
      // Section 2: TRANCHÉES AC (2 points)
      { categorie: 'CABLAGE', numero: 18, texte: 'Respect préconisations tranchée AC (Shelter vers PDL)' },
      { categorie: 'CABLAGE', numero: 19, texte: 'Rebouchage entrée/sortie fourreaux (TPC, etc.) et matériaux utilisés' },
      
      // Section 2: DOCUMENTATION SUR SITE (1 point)
      { categorie: 'DOC', numero: 20, texte: 'Plans TQC (Tel Que Construits) présents sur place' },
      
      // Section 2: MODULES PHOTOVOLTAÏQUES (1 point)
      { categorie: 'MODULES', numero: 21, texte: 'Constat visuel alignement modules PV' },
      
      // Section 4: BONNES PRATIQUES (3 points)
      { categorie: 'STRUCTURES', numero: 22, texte: 'Bonne pratique identifiée n°1' },
      { categorie: 'STRUCTURES', numero: 23, texte: 'Bonne pratique identifiée n°2' },
      { categorie: 'STRUCTURES', numero: 24, texte: 'Bonne pratique identifiée n°3' },
      
      // Section 5: MAUVAISES PRATIQUES (3 points)
      { categorie: 'STRUCTURES', numero: 25, texte: 'Mauvaise pratique identifiée n°1' },
      { categorie: 'STRUCTURES', numero: 26, texte: 'Mauvaise pratique identifiée n°2' },
      { categorie: 'STRUCTURES', numero: 27, texte: 'Mauvaise pratique identifiée n°3' },
      
      // Section 6: AUTRES CONSTATS PERTINENTS (3 points)
      { categorie: 'STRUCTURES', numero: 28, texte: 'Constat complémentaire n°1' },
      { categorie: 'STRUCTURES', numero: 29, texte: 'Constat complémentaire n°2' },
      { categorie: 'STRUCTURES', numero: 30, texte: 'Constat complémentaire n°3' }
    ]
    
    const checklistToiture = [
      // Section 3: STRUCTURES & FIXATIONS (2 points)
      { categorie: 'TOITURE', numero: 31, texte: 'Qualité et conformité montage/serrage SI sur son support' },
      { categorie: 'TOITURE', numero: 32, texte: 'Qualité et conformité montage/serrage panneau sur SI' },
      
      // Section 3: CÂBLAGE & RACCORDEMENTS TOITURE (9 points)
      { categorie: 'TOITURE', numero: 33, texte: 'Contrôle fixation cheminement câbles (pertinence supports, maintien étanchéité)' },
      { categorie: 'TOITURE', numero: 34, texte: 'Contrôle raccordements : compatibilité connecteurs mâle/femelle (type PVZH202B)' },
      { categorie: 'TOITURE', numero: 35, texte: 'Serrages connecteurs' },
      { categorie: 'TOITURE', numero: 36, texte: 'Étanchéités connecteurs' },
      { categorie: 'TOITURE', numero: 37, texte: 'Exposition ruissellement connecteurs' },
      { categorie: 'TOITURE', numero: 38, texte: 'Qualité cheminement câbles DC dans chemin de câbles' },
      { categorie: 'TOITURE', numero: 39, texte: 'Qualité cheminement câbles (pas de cheminement directement sur couverture)' },
      { categorie: 'TOITURE', numero: 40, texte: 'Qualité raccordement terres' },
      { categorie: 'TOITURE', numero: 41, texte: 'Type repérage câbles (tenant-aboutissant, sérigraphié, manuscrit, etc.)' },
      
      // Section 3: SIGNALISATION SÉCURITÉ (1 point)
      { categorie: 'TOITURE', numero: 42, texte: 'Présence étiquettes réglementaires indiquant présence tension DC' }
    ]
    
    // 4. Créer missions + checklists (utiliser batches pour éviter rate limit)
    let missionsCreated = 0
    let checklistsCreated = 0
    
    // Paramètre offset pour pagination
    const { offset = 0 } = c.req.query()
    const batchSize = 10
    const startIndex = parseInt(offset as string) || 0
    const endIndex = Math.min(startIndex + batchSize, centrales.results.length)
    const centralesSlice = centrales.results.slice(startIndex, endIndex)
    
    for (const centrale of centralesSlice) {
      // Assigner technicien par défaut (alternance ARTEMIS/CADENET)
      const sousTraitantId = missionsCreated % 2 === 0 ? 1 : 2
      const technicienId = missionsCreated % 2 === 0 ? 1 : 2
      
      // Créer mission
      const missionResult = await DB.prepare(`
        INSERT INTO ordres_mission 
        (centrale_id, technicien_id, sous_traitant_id, date_mission, statut, checklist_generee)
        VALUES (?, ?, ?, DATE('2025-02-01', '+' || ? || ' days'), 'PLANIFIE', 1)
      `).bind(centrale.id, technicienId, sousTraitantId, missionsCreated).run()
      
      const missionId = missionResult.meta.last_row_id
      missionsCreated++
      
      // Créer checklist adaptée (batch insert pour performance)
      const checklistComplete = centrale.audit_toiture === 'X' 
        ? [...checklistCommune, ...checklistToiture]
        : checklistCommune
      
      // Batch insert de 10 items à la fois
      for (let i = 0; i < checklistComplete.length; i += 10) {
        const batch = checklistComplete.slice(i, i + 10)
        const placeholders = batch.map(() => '(?, ?, ?, ?, ?)').join(',')
        const values = batch.flatMap(item => [missionId, item.categorie, item.numero, item.texte, 'NON_VERIFIE'])
        
        await DB.prepare(`
          INSERT INTO checklist_items 
          (ordre_mission_id, categorie, item_numero, item_texte, statut)
          VALUES ${placeholders}
        `).bind(...values).run()
        
        checklistsCreated += batch.length
      }
    }
    
    const hasMore = endIndex < centrales.results.length
    const nextOffset = hasMore ? endIndex : null
    
    return c.json({
      success: true,
      missions_created: missionsCreated,
      checklists_created: checklistsCreated,
      total_centrales: centrales.results.length,
      processed: endIndex,
      remaining: centrales.results.length - endIndex,
      has_more: hasMore,
      next_offset: nextOffset,
      message: `✅ ${endIndex}/${centrales.results.length} missions créées avec checklists adaptées (SOL: 30 pts, TOITURE: 42 pts)`
    })
    
  } catch (error) {
    console.error('Erreur création missions:', error)
    return c.json({
      success: false,
      error: String(error)
    }, 500)
  }
})

// =======================
// API ROUTES - SHAREPOINT
// =======================

// GET /api/sharepoint/sync - Synchronisation manuelle SharePoint → D1
app.get('/api/sharepoint/sync', async (c) => {
  const { DB } = c.env
  
  try {
    // Import du connecteur SharePoint
    const { createSharePointConnector } = await import('./sharepoint-connector')
    
    // Configuration du connecteur (URL publique du fichier)
    const connector = createSharePointConnector({
      siteUrl: 'https://lenergiededemain.sharepoint.com/sites/DiagnosticPhotovoltaique',
      fileUrl: 'https://www.genspark.ai/api/files/s/sIz00RkB' // URL temporaire du fichier ANNEXE 1
    })
    
    // Synchronisation SharePoint → D1
    const updated = await connector.syncSharePointToD1(DB)
    
    return c.json({
      success: true,
      message: `Synchronisation réussie: ${updated} centrales mises à jour`,
      updated_count: updated
    })
  } catch (error) {
    console.error('Erreur synchronisation SharePoint:', error)
    return c.json({
      success: false,
      error: String(error)
    }, 500)
  }
})

// GET /api/sharepoint/status - Statut de la dernière synchronisation
app.get('/api/sharepoint/status', async (c) => {
  const { DB } = c.env
  
  try {
    // Vérifier le nombre de centrales avec données SharePoint enrichies
    const result = await DB.prepare(`
      SELECT 
        COUNT(*) as total,
        COUNT(CASE WHEN contact_exploitation IS NOT NULL AND contact_exploitation != '' THEN 1 END) as avec_contact,
        COUNT(CASE WHEN panneaux IS NOT NULL AND panneaux != '' THEN 1 END) as avec_panneaux,
        COUNT(CASE WHEN date_mes IS NOT NULL AND date_mes != '' THEN 1 END) as avec_date_mes,
        MAX(date_creation) as derniere_sync
      FROM centrales
    `).first()
    
    return c.json({
      success: true,
      status: {
        total_centrales: result?.total || 0,
        avec_contact_exploitation: result?.avec_contact || 0,
        avec_panneaux: result?.avec_panneaux || 0,
        avec_date_mes: result?.avec_date_mes || 0,
        derniere_synchronisation: result?.derniere_sync || null,
        pourcentage_enrichi: result ? Math.round((result.avec_contact / result.total) * 100) : 0
      }
    })
  } catch (error) {
    return c.json({
      success: false,
      error: String(error)
    }, 500)
  }
})

// ═══════════════════════════════════════════════════════════════════════════════
// ROUTES API - GESTION AUDITS
// ═══════════════════════════════════════════════════════════════════════════════

// POST /api/audit/upload-checklist - Upload checklist remplie
app.post('/api/audit/upload-checklist', async (c) => {
  const { DB } = c.env
  
  try {
    const body = await c.req.json()
    const { centrale_id, checklist } = body
    
    if (!centrale_id || !checklist) {
      return c.json({ success: false, error: 'Missing centrale_id or checklist' }, 400)
    }
    
    // Import dynamique audit-manager
    const { createAuditManager } = await import('./audit-manager')
    const { createSharePointConnector } = await import('./sharepoint-connector')
    
    const sharepoint = createSharePointConnector(c.env)
    const auditManager = createAuditManager(DB, sharepoint)
    
    // Upload checklist
    const sharepoint_url = await auditManager.uploadChecklist(centrale_id, checklist)
    
    return c.json({
      success: true,
      sharepoint_url,
      message: 'Checklist uploaded successfully'
    })
  } catch (error) {
    return c.json({
      success: false,
      error: String(error)
    }, 500)
  }
})

// POST /api/audit/upload-photos - Upload photos géolocalisées (batch)
app.post('/api/audit/upload-photos', async (c) => {
  const { DB } = c.env
  
  try {
    const body = await c.req.json()
    const { centrale_id, photos } = body
    
    if (!centrale_id || !photos || !Array.isArray(photos)) {
      return c.json({ success: false, error: 'Missing centrale_id or photos array' }, 400)
    }
    
    // Import dynamique audit-manager
    const { createAuditManager } = await import('./audit-manager')
    const { createSharePointConnector } = await import('./sharepoint-connector')
    
    const sharepoint = createSharePointConnector(c.env)
    const auditManager = createAuditManager(DB, sharepoint)
    
    // Upload photos
    const sharepoint_urls = await auditManager.uploadPhotos(centrale_id, photos)
    
    return c.json({
      success: true,
      sharepoint_urls,
      nb_photos: sharepoint_urls.length,
      message: `${sharepoint_urls.length} photos uploaded successfully`
    })
  } catch (error) {
    return c.json({
      success: false,
      error: String(error)
    }, 500)
  }
})

// POST /api/audit/generate-annexe2 - Génération automatique ANNEXE 2
app.post('/api/audit/generate-annexe2', async (c) => {
  const { DB } = c.env
  
  try {
    const body = await c.req.json()
    const { centrale_id } = body
    
    if (!centrale_id) {
      return c.json({ success: false, error: 'Missing centrale_id' }, 400)
    }
    
    // Import dynamique audit-manager
    const { createAuditManager } = await import('./audit-manager')
    const { createSharePointConnector } = await import('./sharepoint-connector')
    
    const sharepoint = createSharePointConnector(c.env)
    const auditManager = createAuditManager(DB, sharepoint)
    
    // Générer ANNEXE 2
    const sharepoint_url = await auditManager.generateAnnexe2(centrale_id)
    
    return c.json({
      success: true,
      sharepoint_url,
      message: 'ANNEXE 2 generated successfully'
    })
  } catch (error) {
    return c.json({
      success: false,
      error: String(error)
    }, 500)
  }
})

// POST /api/audit/generate-rapport-final - Génération rapport PDF final
app.post('/api/audit/generate-rapport-final', async (c) => {
  const { DB } = c.env
  
  try {
    const body = await c.req.json()
    const { centrale_id } = body
    
    if (!centrale_id) {
      return c.json({ success: false, error: 'Missing centrale_id' }, 400)
    }
    
    // Import dynamique audit-manager
    const { createAuditManager } = await import('./audit-manager')
    const { createSharePointConnector } = await import('./sharepoint-connector')
    
    const sharepoint = createSharePointConnector(c.env)
    const auditManager = createAuditManager(DB, sharepoint)
    
    // Générer rapport final PDF
    const sharepoint_url = await auditManager.generateRapportFinal(centrale_id)
    
    return c.json({
      success: true,
      sharepoint_url,
      message: 'Rapport final PDF generated successfully'
    })
  } catch (error) {
    return c.json({
      success: false,
      error: String(error)
    }, 500)
  }
})

// ═══════════════════════════════════════════════════════════════════════════════
// ROUTE API - SYNCHRONISATION MANUELLE CSV (SANS OAUTH2)
// ═══════════════════════════════════════════════════════════════════════════════

// POST /api/sharepoint/upload-csv - Upload fichier CSV ANNEXE 1 depuis SharePoint
app.post('/api/sharepoint/upload-csv', async (c) => {
  const { DB } = c.env
  
  try {
    const body = await c.req.json()
    const { csv_content } = body
    
    if (!csv_content) {
      return c.json({ success: false, error: 'Missing csv_content' }, 400)
    }
    
    // Parser le CSV
    const lines = csv_content.split('\n').filter((line: string) => line.trim())
    if (lines.length < 2) {
      return c.json({ success: false, error: 'CSV vide ou invalide' }, 400)
    }
    
    // Ignorer la première ligne (header)
    const dataLines = lines.slice(1)
    let centralesSynchronisees = 0
    let erreurs: string[] = []
    
    for (const line of dataLines) {
      try {
        // Split par point-virgule (CSV français)
        const cols = line.split(';').map((col: string) => col.trim().replace(/^"|"$/g, ''))
        
        if (cols.length < 10) continue // Ignorer lignes incomplètes
        
        // Extraction des colonnes (basé sur ANNEXE 1 structure)
        const [
          spv,
          nom,
          puissance_kwc_str,
          latitude_str,
          longitude_str,
          adresse,
          cp_ville,
          dept,
          type_centrale,
          installateur,
          // ... autres colonnes
        ] = cols
        
        const puissance_kwc = parseFloat(puissance_kwc_str?.replace(',', '.') || '0')
        const latitude = parseFloat(latitude_str?.replace(',', '.') || '0')
        const longitude = parseFloat(longitude_str?.replace(',', '.') || '0')
        
        if (!nom || puissance_kwc === 0) continue
        
        // Vérifier si la centrale existe déjà
        const existing = await DB.prepare(`
          SELECT id FROM centrales WHERE nom = ? OR (latitude = ? AND longitude = ?)
        `).bind(nom, latitude, longitude).first()
        
        if (existing) {
          // Mise à jour centrale existante
          await DB.prepare(`
            UPDATE centrales SET
              spv = ?,
              latitude = ?,
              longitude = ?,
              adresse = ?,
              dept = ?,
              type_centrale = ?,
              installateur = ?,
              puissance_kwc = ?
            WHERE id = ?
          `).bind(
            spv || null,
            latitude || null,
            longitude || null,
            adresse || null,
            dept || null,
            type_centrale || null,
            installateur || null,
            puissance_kwc || null,
            existing.id
          ).run()
          
          centralesSynchronisees++
        } else {
          // Insertion nouvelle centrale
          await DB.prepare(`
            INSERT INTO centrales (
              nom, type, puissance_kwc, localisation, statut,
              spv, latitude, longitude, adresse, dept, type_centrale, installateur
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
          `).bind(
            nom,
            'PV',
            puissance_kwc,
            cp_ville || adresse || null,
            'A_AUDITER',
            spv || null,
            latitude || null,
            longitude || null,
            adresse || null,
            dept || null,
            type_centrale || null,
            installateur || null
          ).run()
          
          centralesSynchronisees++
        }
      } catch (err) {
        erreurs.push(`Erreur ligne: ${String(err)}`)
      }
    }
    
    // Log de synchronisation
    await DB.prepare(`
      INSERT INTO sharepoint_sync_logs (direction, statut, nb_elements, data_summary)
      VALUES (?, ?, ?, ?)
    `).bind(
      'CSV->D1',
      'SUCCESS',
      centralesSynchronisees,
      JSON.stringify({ erreurs: erreurs.length })
    ).run()
    
    return c.json({
      success: true,
      message: 'Synchronisation CSV terminée',
      centrales_synchronisees: centralesSynchronisees,
      erreurs: erreurs.length > 0 ? erreurs : undefined
    })
  } catch (error) {
    return c.json({
      success: false,
      error: String(error)
    }, 500)
  }
})

// GET /documents - Page de téléchargement des documents
// GET /api/planning/full - Planning complet des 52 centrales avec attributions
app.get('/api/planning/full', async (c) => {
  const { DB } = c.env
  
  try {
    const planning = await DB.prepare(`
      SELECT 
        c.id,
        c.id_ref,
        c.nom as centrale_nom,
        c.type,
        c.puissance_kwc,
        c.localisation,
        c.statut as centrale_statut,
        c.latitude,
        c.longitude,
        c.distance_toulouse_km,
        c.distance_lyon_km,
        c.base_proche,
        c.dept,
        om.id as mission_id,
        om.date_mission,
        om.heure_debut,
        om.duree_estimee_heures,
        om.statut as mission_statut,
        st.id as sous_traitant_id,
        st.nom_entreprise as sous_traitant_nom,
        t.id as technicien_id,
        t.prenom || ' ' || t.nom as technicien_nom,
        (SELECT COUNT(*) FROM checklist_items WHERE ordre_mission_id = om.id) as checklist_count
      FROM centrales c
      LEFT JOIN ordres_mission om ON c.id = om.centrale_id AND om.statut != 'ANNULE'
      LEFT JOIN sous_traitants st ON om.sous_traitant_id = st.id
      LEFT JOIN techniciens t ON om.technicien_id = t.id
      ORDER BY 
        CASE 
          WHEN c.distance_toulouse_km IS NULL THEN 999999
          WHEN c.distance_lyon_km IS NULL THEN c.distance_toulouse_km
          WHEN c.distance_toulouse_km < c.distance_lyon_km THEN c.distance_toulouse_km
          ELSE c.distance_lyon_km
        END ASC
    `).all()
    
    // Ajouter distance_km calculée et statut checklist
    const planningComplet = planning.results.map((p: any) => {
      const distToulouse = p.distance_toulouse_km || 999999
      const distLyon = p.distance_lyon_km || 999999
      return {
        ...p,
        distance_km: Math.min(distToulouse, distLyon),
        is_assigned: p.mission_id !== null,
        is_planned: p.date_mission !== null,
        has_checklist: p.checklist_count > 0,
        checklist_status: p.checklist_count === 54 ? 'PRET' : (p.checklist_count > 0 ? 'PARTIEL' : 'NON_INIT')
      }
    })
    
    return c.json({ 
      success: true, 
      data: planningComplet,
      stats: {
        total: planningComplet.length,
        assigned: planningComplet.filter((p: any) => p.is_assigned).length,
        planned: planningComplet.filter((p: any) => p.is_planned).length,
        unassigned: planningComplet.filter((p: any) => !p.is_assigned).length,
        with_checklist: planningComplet.filter((p: any) => p.has_checklist).length
      }
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// GET /api/planning/by-sous-traitant - Planning groupé par sous-traitant
app.get('/api/planning/by-sous-traitant', async (c) => {
  const { DB } = c.env
  
  try {
    const sousTraitants = await DB.prepare(`
      SELECT * FROM sous_traitants ORDER BY nom_entreprise
    `).all()
    
    const planning = []
    
    for (const st of sousTraitants.results) {
      const missions = await DB.prepare(`
        SELECT 
          om.*,
          c.nom as centrale_nom,
          c.puissance_kwc,
          c.distance_toulouse_km,
          c.distance_lyon_km,
          c.base_proche,
          t.prenom || ' ' || t.nom as technicien_nom
        FROM ordres_mission om
        JOIN centrales c ON om.centrale_id = c.id
        LEFT JOIN techniciens t ON om.technicien_id = t.id
        WHERE om.sous_traitant_id = ? AND om.statut != 'ANNULE'
        ORDER BY om.date_mission
      `).bind(st.id).all()
      
      planning.push({
        sous_traitant: st,
        missions: missions.results,
        stats: {
          total_missions: missions.results.length,
          total_kwc: missions.results.reduce((sum: number, m: any) => sum + (m.puissance_kwc || 0), 0),
          missions_planifiees: missions.results.filter((m: any) => m.date_mission).length
        }
      })
    }
    
    return c.json({ success: true, data: planning })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// POST /api/planning/auto-assign - Attribution automatique basée sur distance
app.post('/api/planning/auto-assign', async (c) => {
  const { DB } = c.env
  
  try {
    const body = await c.req.json()
    const { max_centrales, date_debut, sous_traitant_toulouse_id, sous_traitant_lyon_id, technicien_id } = body
    
    if (!date_debut || !sous_traitant_toulouse_id || !sous_traitant_lyon_id) {
      return c.json({ success: false, error: 'date_debut, sous_traitant_toulouse_id et sous_traitant_lyon_id requis' }, 400)
    }
    
    // Récupérer centrales non assignées triées par distance
    const centrales = await DB.prepare(`
      SELECT c.* 
      FROM centrales c
      LEFT JOIN ordres_mission om ON c.id = om.centrale_id AND om.statut != 'ANNULE'
      WHERE om.id IS NULL
      AND (c.distance_toulouse_km IS NOT NULL OR c.distance_lyon_km IS NOT NULL)
      ORDER BY 
        CASE 
          WHEN c.distance_toulouse_km IS NULL THEN c.distance_lyon_km
          WHEN c.distance_lyon_km IS NULL THEN c.distance_toulouse_km
          WHEN c.distance_toulouse_km < c.distance_lyon_km THEN c.distance_toulouse_km
          ELSE c.distance_lyon_km
        END ASC
      LIMIT ?
    `).bind(max_centrales || 25).all()
    
    let currentDate = new Date(date_debut)
    const assigned = []
    
    for (const centrale of centrales.results) {
      // Choisir sous-traitant selon base proche
      const sousTraitantId = centrale.base_proche === 'Toulouse' ? sous_traitant_toulouse_id : sous_traitant_lyon_id
      
      const result = await DB.prepare(`
        INSERT INTO ordres_mission (centrale_id, sous_traitant_id, technicien_id, date_mission, heure_debut, duree_estimee_heures, statut)
        VALUES (?, ?, ?, ?, '08:00', 7.0, 'PLANIFIE')
      `).bind(centrale.id, sousTraitantId, technicien_id, currentDate.toISOString().split('T')[0]).run()
      
      await DB.prepare(`UPDATE centrales SET statut = 'EN_COURS' WHERE id = ?`).bind(centrale.id).run()
      
      assigned.push({
        centrale_id: centrale.id,
        centrale_nom: centrale.nom,
        mission_id: result.meta.last_row_id,
        date: currentDate.toISOString().split('T')[0],
        sous_traitant: centrale.base_proche === 'Toulouse' ? 'Toulouse' : 'Lyon'
      })
      
      // Incrémenter date (1 jour par centrale)
      currentDate.setDate(currentDate.getDate() + 1)
    }
    
    return c.json({ 
      success: true, 
      data: { assigned: assigned.length, details: assigned }
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// POST /api/planning/save-attribution - Sauvegarder attribution modifiée (inline edit)
app.post('/api/planning/save-attribution', async (c) => {
  const { DB } = c.env
  
  try {
    const body = await c.req.json()
    const { centrale_id, sous_traitant_id, technicien_id, date_mission } = body
    
    if (!centrale_id) {
      return c.json({ success: false, error: 'centrale_id requis' }, 400)
    }
    
    // Si ST, technicien et date fournis → créer/mettre à jour mission
    if (sous_traitant_id && technicien_id && date_mission) {
      // Check si mission existe
      const existing = await DB.prepare(`
        SELECT id FROM ordres_mission WHERE centrale_id = ? AND statut != 'ANNULE'
      `).bind(centrale_id).first()
      
      let missionId: number
      
      if (existing) {
        // Update
        await DB.prepare(`
          UPDATE ordres_mission
          SET sous_traitant_id = ?, technicien_id = ?, date_mission = ?, statut = 'PLANIFIE'
          WHERE id = ?
        `).bind(sous_traitant_id, technicien_id, date_mission, existing.id).run()
        missionId = existing.id as number
      } else {
        // Insert
        const result = await DB.prepare(`
          INSERT INTO ordres_mission (centrale_id, sous_traitant_id, technicien_id, date_mission, heure_debut, duree_estimee_heures, statut)
          VALUES (?, ?, ?, ?, '08:00', 7.0, 'PLANIFIE')
        `).bind(centrale_id, sous_traitant_id, technicien_id, date_mission).run()
        missionId = result.meta.last_row_id as number
      }
      
      // ✅ INITIALISER CHECKLIST AUTOMATIQUEMENT (54 points)
      const checklistStructure = [
        { cat: 'DOC', items: ['Plaques signalétiques modules', 'Plan installation (as-built)', 'Schémas électriques (DC/AC)', 'Attestation Consuel', 'Certificats conformité onduleurs', 'Rapport mise en service', 'Contrat maintenance O&M', 'Notice technique modules'] },
        { cat: 'ELEC', items: ['Mesure tension Voc strings (à vide)', 'Mesure courant Isc strings (court-circuit)', 'Test isolement DC (> 1 MΩ)', 'Mesure continuité terres', 'Polarité strings (+ et -)', 'Protection différentielle 30mA', 'Disjoncteurs calibrage correct', 'Parafoudres DC/AC état', 'Test fonctionnel onduleurs', 'Monitoring production réel vs théorique', 'Équilibrage phases AC', 'Cos φ (facteur puissance)'] },
        { cat: 'TABLEAUX', items: ['État général coffrets DC', 'Étanchéité IP65 boîtiers', 'Serrage bornes électriques', 'Signalétique circuits', 'Ventilation coffrets', 'Absence corrosion/oxydation', 'Échauffement anormal (thermographie)', 'Accessibilité maintenance'] },
        { cat: 'CABLAGE', items: ['Connecteurs MC4 serrés/étanches', 'Gaines ICTA/IRL état', 'Chemins câbles fixations', 'Protection UV câbles DC', 'Rayon courbure respecté', 'Absence points chauds (thermographie)', 'Marquage câbles positif/négatif'] },
        { cat: 'MODULES', items: ['État visuel face avant (fissures/casse)', 'État cadres (corrosion/déformation)', 'Boîtiers jonction étanches', 'Diodes by-pass fonctionnelles', 'Hotspots thermographie (ΔT > 10°C)', 'Délamination/bulles', 'Snail trails (traces escargot)', 'Salissures importantes', 'Ombres portées permanentes', 'PID (Potential Induced Degradation)'] },
        { cat: 'STRUCTURES', items: ['Fixations modules (boulons/clips)', 'État rails (corrosion/déformation)', 'Fondations/lestage stable', 'Mise à la terre structures', 'Espacement inter-rangées ventilation'] },
        { cat: 'TOITURE', items: ['Étanchéité traversées toiture', 'État couverture (tuiles/bac acier)', 'Écrans sous-toiture intacts', 'Zinguerie/gouttières fonctionnelles'] }
      ]
      
      for (const category of checklistStructure) {
        for (let i = 0; i < category.items.length; i++) {
          await DB.prepare(`
            INSERT OR IGNORE INTO checklist_items (ordre_mission_id, categorie, item_numero, item_texte)
            VALUES (?, ?, ?, ?)
          `).bind(missionId, category.cat, i + 1, category.items[i]).run()
        }
      }
      
      await DB.prepare(`UPDATE centrales SET statut = 'EN_COURS' WHERE id = ?`).bind(centrale_id).run()
      
      return c.json({ 
        success: true, 
        action: existing ? 'updated' : 'created',
        mission_id: missionId,
        checklist_initialized: true
      })
    } else {
      return c.json({ success: false, error: 'sous_traitant_id, technicien_id et date_mission requis' }, 400)
    }
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// POST /api/planning/generate-all-missions - Générer ordres de mission depuis attributions
app.post('/api/planning/generate-all-missions', async (c) => {
  const { DB } = c.env
  
  try {
    // Récupérer toutes les centrales avec attributions complètes (ST + technicien + date)
    const centrales = await DB.prepare(`
      SELECT 
        c.id as centrale_id,
        c.nom as centrale_nom,
        om.id as mission_id,
        om.sous_traitant_id,
        om.technicien_id,
        om.date_mission,
        om.statut as mission_statut
      FROM centrales c
      LEFT JOIN ordres_mission om ON c.id = om.centrale_id AND om.statut != 'ANNULE'
      WHERE om.sous_traitant_id IS NOT NULL 
        AND om.technicien_id IS NOT NULL 
        AND om.date_mission IS NOT NULL
    `).all()
    
    let created = 0
    let updated = 0
    let errors = []
    
    for (const centrale of centrales.results) {
      try {
        // Vérifier si mission déjà validée
        if (centrale.mission_statut === 'PLANIFIE') {
          // Déjà générée, on compte comme updated
          updated++
        } else {
          // Mettre à jour statut à PLANIFIE (confirmé)
          await DB.prepare(`
            UPDATE ordres_mission SET statut = 'PLANIFIE' WHERE id = ?
          `).bind(centrale.mission_id).run()
          
          created++
        }
      } catch (error) {
        errors.push({
          centrale_id: centrale.centrale_id,
          centrale_nom: centrale.centrale_nom,
          error: String(error)
        })
      }
    }
    
    return c.json({
      success: true,
      data: {
        total_traites: centrales.results.length,
        created,
        updated,
        errors: errors.length,
        error_details: errors
      }
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// GET /api/planning/export-data - Exporter données planning pour Excel
app.get('/api/planning/export-data', async (c) => {
  const { DB } = c.env
  
  try {
    const planning = await DB.prepare(`
      SELECT 
        c.id,
        c.id_ref,
        c.nom as centrale_nom,
        c.type,
        c.puissance_kwc,
        c.localisation,
        c.dept,
        c.distance_toulouse_km,
        c.distance_lyon_km,
        c.base_proche,
        c.statut as centrale_statut,
        om.id as mission_id,
        om.date_mission,
        om.heure_debut,
        om.duree_estimee_heures,
        om.statut as mission_statut,
        st.nom_entreprise as sous_traitant_nom,
        st.contact_principal as sous_traitant_contact,
        t.prenom || ' ' || t.nom as technicien_nom,
        t.telephone as technicien_tel
      FROM centrales c
      LEFT JOIN ordres_mission om ON c.id = om.centrale_id AND om.statut != 'ANNULE'
      LEFT JOIN sous_traitants st ON om.sous_traitant_id = st.id
      LEFT JOIN techniciens t ON om.technicien_id = t.id
      ORDER BY 
        CASE 
          WHEN c.distance_toulouse_km IS NULL THEN 999999
          WHEN c.distance_lyon_km IS NULL THEN c.distance_toulouse_km
          WHEN c.distance_toulouse_km < c.distance_lyon_km THEN c.distance_toulouse_km
          ELSE c.distance_lyon_km
        END ASC
    `).all()
    
    if (!planning || !planning.results) {
      return c.json({ success: false, error: 'Aucune donnée disponible' }, 500)
    }
    
    // Ajouter distance_km calculée
    const planningAvecDistance = planning.results.map((p: any) => {
      const distToulouse = p.distance_toulouse_km || 999999
      const distLyon = p.distance_lyon_km || 999999
      return {
        ...p,
        distance_km: Math.min(distToulouse, distLyon)
      }
    })
    
    return c.json({
      success: true,
      data: planningAvecDistance,
      stats: {
        total: planningAvecDistance.length,
        avec_mission: planningAvecDistance.filter((p: any) => p.mission_id !== null).length,
        sans_mission: planningAvecDistance.filter((p: any) => p.mission_id === null).length
      }
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// GET /api/planning/export-annexe1 - Export ANNEXE 1 enrichie avec planning
app.get('/api/planning/export-annexe1', async (c) => {
  const { DB } = c.env
  
  try {
    const planning = await DB.prepare(`
      SELECT 
        c.id,
        c.id_ref,
        c.nom as centrale_nom,
        c.type,
        c.puissance_kwc,
        c.localisation,
        c.dept,
        c.latitude,
        c.longitude,
        c.distance_toulouse_km,
        c.distance_lyon_km,
        c.base_proche,
        c.statut as centrale_statut,
        om.id as mission_id,
        om.date_mission,
        om.heure_debut,
        om.duree_estimee_heures,
        om.statut as mission_statut,
        st.nom_entreprise as sous_traitant_nom,
        st.contact_principal as sous_traitant_contact,
        st.telephone as sous_traitant_tel,
        t.prenom || ' ' || t.nom as technicien_nom,
        t.telephone as technicien_tel,
        t.email as technicien_email,
        (SELECT COUNT(*) FROM checklist_items WHERE ordre_mission_id = om.id) as checklist_count
      FROM centrales c
      LEFT JOIN ordres_mission om ON c.id = om.centrale_id AND om.statut != 'ANNULE'
      LEFT JOIN sous_traitants st ON om.sous_traitant_id = st.id
      LEFT JOIN techniciens t ON om.technicien_id = t.id
      ORDER BY c.id_ref
    `).all()
    
    // Formater données pour export Excel
    const dataExport = planning.results.map((row: any) => {
      const distToulouse = row.distance_toulouse_km || 999999
      const distLyon = row.distance_lyon_km || 999999
      const distanceKm = Math.min(distToulouse, distLyon)
      
      // Statut checklist
      let checklistStatus = 'NON ATTRIBUÉ'
      if (row.checklist_count === 54) {
        checklistStatus = 'PRÊT (54/54)'
      } else if (row.checklist_count > 0) {
        checklistStatus = `EN COURS (${row.checklist_count}/54)`
      } else if (row.mission_id) {
        checklistStatus = 'À INITIALISER'
      }
      
      return {
        // Colonnes ANNEXE 1 originales
        id_ref: row.id_ref || '',
        centrale: row.centrale_nom || '',
        type: row.type || '',
        puissance_kwc: row.puissance_kwc || 0,
        localisation: row.localisation || '',
        departement: row.dept || '',
        latitude: row.latitude || '',
        longitude: row.longitude || '',
        distance_toulouse_km: row.distance_toulouse_km ? row.distance_toulouse_km.toFixed(1) : 'N/A',
        distance_lyon_km: row.distance_lyon_km ? row.distance_lyon_km.toFixed(1) : 'N/A',
        distance_km: distanceKm < 999999 ? distanceKm.toFixed(1) : 'N/A',
        base_proche: row.base_proche || 'N/A',
        
        // Colonnes PLANNING ajoutées
        date_audit: row.date_mission || 'NON PLANIFIÉ',
        heure_debut: row.heure_debut || '',
        duree_heures: row.duree_estimee_heures || '',
        sous_traitant: row.sous_traitant_nom || 'NON ATTRIBUÉ',
        contact_st: row.sous_traitant_contact || '',
        tel_st: row.sous_traitant_tel || '',
        technicien: row.technicien_nom || 'NON ATTRIBUÉ',
        tel_technicien: row.technicien_tel || '',
        email_technicien: row.technicien_email || '',
        statut_mission: row.mission_statut || 'NON CRÉÉ',
        checklist: checklistStatus,
        statut_centrale: row.centrale_statut || 'A_AUDITER'
      }
    })
    
    return c.json({
      success: true,
      data: dataExport,
      stats: {
        total: dataExport.length,
        planifiees: dataExport.filter((d: any) => d.date_audit !== 'NON PLANIFIÉ').length,
        avec_checklist: dataExport.filter((d: any) => d.checklist.includes('PRÊT')).length
      }
    })
  } catch (error) {
    return c.json({ success: false, error: String(error) }, 500)
  }
})

// ==============================
// API ROUTES - DOCUMENTS
// ==============================

// GET /api/documents - Liste tous les documents disponibles
app.get('/api/documents', async (c) => {
  const documents = {
    ordres_mission: {
      titre: "Ordres de Mission (27 centrales)",
      description: "Ordres de Mission individuels ARTEMIS (OM_001 à OM_017) et CADENET (OM_018 à OM_027)",
      fichiers: [
        {
          nom: "ORDRES_MISSION_GIRASOLE_27_CENTRALES.zip",
          url: "/documents/ordres_mission/ORDRES_MISSION_GIRASOLE_27_CENTRALES.zip",
          taille: "60 Ko",
          type: "ZIP",
          description: "Archive complète des 27 Ordres de Mission"
        },
        // Ordres ARTEMIS
        ...Array.from({ length: 17 }, (_, i) => {
          const num = String(i + 1).padStart(3, '0')
          const noms = [
            "SCI_KILJOR", "Mathieu_Montet", "HANGAR_Benoit_BERTELOOT", "HANGAR_Angelina_SIMMONET",
            "Hangar_LAMIOT", "Didier_-_PRIEUR", "Hangar_Patrick_BLANCHET", "GAYET_42",
            "DUMONT_GUY", "Serge_Maltaverne", "Maymat", "Hangar_Julien_Vaudin",
            "EARL_CADOT", "HARAS_DE_LA_MAJORIE_MANOHA", "Serge_Maltaverne", 
            "Hangar_Eric_LOGNON", "Hangar_Benjamin_CHASSON"
          ]
          return {
            nom: `OM_${num}_ARTEMIS_${noms[i]}.txt`,
            url: `/documents/ordres_mission/OM_${num}_ARTEMIS_${noms[i]}.txt`,
            taille: "~4 Ko",
            type: "TXT",
            description: `Ordre de Mission ${num} - ARTEMIS`
          }
        }),
        // Ordres CADENET
        ...Array.from({ length: 10 }, (_, i) => {
          const num = String(i + 18).padStart(3, '0')
          const noms = [
            "Hangar_Laurent_ROUX", "Hangar_Laurent_ROUX", "Hangar_Bernard_MAGE",
            "Hangar_Frederic_Sinaud", "Hangar_Frederic_Sinaud", "MARTEL_184_Construction",
            "BOUCHARDY_203_LOC", "BOULOIR_206_LOC", "MARTEL_183_LOC", "Hangar_Fabrice_COMBY"
          ]
          return {
            nom: `OM_${num}_CADENET_${noms[i]}.txt`,
            url: `/documents/ordres_mission/OM_${num}_CADENET_${noms[i]}.txt`,
            taille: "~4 Ko",
            type: "TXT",
            description: `Ordre de Mission ${num} - CADENET`
          }
        })
      ]
    },
    dossiers_chiffrage: {
      titre: "Dossiers Chiffrage Sous-Traitants",
      description: "Dossiers complets pour demandes de chiffrage ARTEMIS et CADENET",
      fichiers: [
        {
          nom: "ARTEMIS_Chiffrage_DEFINITIF.txt",
          url: "/documents/dossiers_chiffrage/ARTEMIS_Chiffrage_DEFINITIF.txt",
          taille: "34 Ko",
          type: "TXT",
          description: "Dossier complet ARTEMIS - 17 centrales (5056.65 kWc)"
        },
        {
          nom: "CADENET_Chiffrage_DEFINITIF.txt",
          url: "/documents/dossiers_chiffrage/CADENET_Chiffrage_DEFINITIF.txt",
          taille: "30 Ko",
          type: "TXT",
          description: "Dossier complet CADENET - 10 centrales (3910.35 kWc)"
        }
      ]
    },
    checklists: {
      titre: "Checklist Audit GIRASOLE",
      description: "Checklist 70 points conforme CDC PERF-CDC-001",
      fichiers: [
        {
          nom: "CHECKLIST_GIRASOLE_COMPLETE_FINALE.txt",
          url: "/documents/checklists/CHECKLIST_GIRASOLE_COMPLETE_FINALE.txt",
          taille: "16 Ko",
          type: "TXT",
          description: "Checklist qualité 70 points - Conforme GIRASOLE"
        }
      ]
    },
    donnees: {
      titre: "Données Brutes CSV",
      description: "Fichiers CSV pour import/export des centrales",
      fichiers: [
        {
          nom: "centrales_artemis.csv",
          url: "/documents/csv/centrales_artemis.csv",
          taille: "6.9 Ko",
          type: "CSV",
          description: "Données brutes 17 centrales ARTEMIS"
        },
        {
          nom: "centrales_cadenet.csv",
          url: "/documents/csv/centrales_cadenet.csv",
          taille: "4.4 Ko",
          type: "CSV",
          description: "Données brutes 10 centrales CADENET"
        }
      ]
    },
    guides: {
      titre: "Guides & Documentation",
      description: "Documentation complète pour Adrien et Fabien",
      fichiers: [
        {
          nom: "RECAP_FINAL_ADRIEN_SOUS_TRAITANTS.txt",
          url: "/documents/RECAP_FINAL_ADRIEN_SOUS_TRAITANTS.txt",
          taille: "8.7 Ko",
          type: "TXT",
          description: "Guide complet - Envoi emails + Planning Manager"
        }
      ]
    }
  }
  
  return c.json({ success: true, data: documents })
})

// =======================
// ORDRE DE MISSION HTML/PDF
// =======================

// GET /om/:mission_id - Générer Ordre de Mission HTML (à imprimer en PDF)
app.get('/om/:mission_id', async (c) => {
  const { DB } = c.env
  const missionId = c.req.param('mission_id')
  
  try {
    // Récupérer données complètes mission
    const mission = await DB.prepare(`
      SELECT 
        om.*,
        c.nom as centrale_nom,
        c.id_ref,
        c.type_centrale,
        c.puissance_kwc,
        c.adresse,
        c.dept,
        c.audit_toiture,
        c.contact_exploitation,
        c.tel_exploitation,
        c.installateur,
        c.panneaux,
        c.date_mes,
        st.nom_entreprise as sous_traitant,
        st.email_contact as st_email,
        st.telephone as st_tel,
        t.prenom as tech_prenom,
        t.nom as tech_nom,
        t.email as tech_email,
        t.telephone as tech_tel,
        COUNT(DISTINCT ci.id) as nb_checklist
      FROM ordres_mission om
      JOIN centrales c ON om.centrale_id = c.id
      JOIN sous_traitants st ON om.sous_traitant_id = st.id
      JOIN techniciens t ON om.technicien_id = t.id
      LEFT JOIN checklist_items ci ON om.id = ci.ordre_mission_id
      WHERE om.id = ?
      GROUP BY om.id
    `).bind(missionId).first()
    
    if (!mission) {
      return c.html('<h1>Mission non trouvée</h1>', 404)
    }
    
    const dateAudit = mission.date_mission || new Date().toISOString().split('T')[0]
    const auditToiture = mission.audit_toiture === 'X'
    
    return c.html(`
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ordre de Mission ${mission.id_ref || mission.centrale_nom}</title>
    <style>
        @media print {
            @page { margin: 1.5cm; size: A4; }
            body { margin: 0; }
            .no-print { display: none; }
        }
        
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background: #f5f5f5;
            padding: 20px;
        }
        
        .container {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .header {
            border-bottom: 4px solid #2563eb;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }
        
        .header h1 {
            color: #2563eb;
            font-size: 28px;
            margin-bottom: 10px;
        }
        
        .header .ref {
            color: #666;
            font-size: 14px;
        }
        
        .section {
            margin-bottom: 25px;
            padding: 20px;
            background: #f9fafb;
            border-left: 4px solid #2563eb;
        }
        
        .section h2 {
            color: #1e40af;
            font-size: 18px;
            margin-bottom: 15px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }
        
        .info-item {
            padding: 10px;
            background: white;
            border-radius: 4px;
        }
        
        .info-label {
            font-weight: 600;
            color: #4b5563;
            font-size: 12px;
            text-transform: uppercase;
            margin-bottom: 5px;
        }
        
        .info-value {
            font-size: 15px;
            color: #111827;
        }
        
        .badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            margin-top: 5px;
        }
        
        .badge-warning {
            background: #fef3c7;
            color: #92400e;
        }
        
        .badge-success {
            background: #d1fae5;
            color: #065f46;
        }
        
        .checklist-summary {
            background: #eff6ff;
            padding: 15px;
            border-radius: 8px;
            margin-top: 15px;
        }
        
        .checklist-count {
            font-size: 32px;
            font-weight: bold;
            color: #2563eb;
        }
        
        .important-box {
            background: #fef2f2;
            border: 2px solid #ef4444;
            padding: 15px;
            border-radius: 8px;
            margin: 20px 0;
        }
        
        .important-box h3 {
            color: #dc2626;
            margin-bottom: 10px;
        }
        
        ul {
            margin-left: 20px;
            margin-top: 10px;
        }
        
        li {
            margin-bottom: 8px;
        }
        
        .footer {
            margin-top: 40px;
            padding-top: 20px;
            border-top: 2px solid #e5e7eb;
            text-align: center;
            color: #6b7280;
            font-size: 12px;
        }
        
        .print-button {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #2563eb;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        
        .print-button:hover {
            background: #1d4ed8;
        }
    </style>
</head>
<body>
    <button class="print-button no-print" onclick="window.print()">
        🖨️ Imprimer / Enregistrer en PDF
    </button>
    
    <div class="container">
        <div class="header">
            <h1>📋 ORDRE DE MISSION</h1>
            <div class="ref">
                Mission #${mission.id} | ${mission.id_ref || 'N/A'} | 
                Date : ${new Date(dateAudit).toLocaleDateString('fr-FR')}
            </div>
        </div>
        
        <!-- CENTRALE -->
        <div class="section">
            <h2>🏭 Centrale Photovoltaïque</h2>
            <div class="info-grid">
                <div class="info-item">
                    <div class="info-label">Nom Centrale</div>
                    <div class="info-value">${mission.centrale_nom}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Référence SPV</div>
                    <div class="info-value">${mission.id_ref || 'N/A'}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Type Installation</div>
                    <div class="info-value">${mission.type_centrale || 'N/A'}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Puissance</div>
                    <div class="info-value">${mission.puissance_kwc || 0} kWc</div>
                </div>
                <div class="info-item" style="grid-column: span 2;">
                    <div class="info-label">Adresse</div>
                    <div class="info-value">${mission.adresse || 'N/A'}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Département</div>
                    <div class="info-value">${mission.dept || 'N/A'}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Installateur</div>
                    <div class="info-value">${mission.installateur || 'N/A'}</div>
                </div>
            </div>
            
            ${auditToiture ? `
            <div class="badge badge-warning" style="margin-top: 15px;">
                ⚠️ AUDIT TOITURE - Démontage ≥25 panneaux requis
            </div>
            ` : `
            <div class="badge badge-success" style="margin-top: 15px;">
                ✅ AUDIT STANDARD (Sol / Ombrière)
            </div>
            `}
        </div>
        
        <!-- SOUS-TRAITANT -->
        <div class="section">
            <h2>👷 Sous-Traitant & Technicien</h2>
            <div class="info-grid">
                <div class="info-item">
                    <div class="info-label">Sous-Traitant</div>
                    <div class="info-value">${mission.sous_traitant}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Email</div>
                    <div class="info-value">${mission.st_email || 'N/A'}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Technicien</div>
                    <div class="info-value">${mission.tech_prenom} ${mission.tech_nom}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Contact</div>
                    <div class="info-value">${mission.tech_tel || mission.tech_email || 'N/A'}</div>
                </div>
            </div>
        </div>
        
        <!-- CONTACT EXPLOITATION -->
        <div class="section">
            <h2>📞 Contact Exploitation Site</h2>
            <div class="info-grid">
                <div class="info-item">
                    <div class="info-label">Contact</div>
                    <div class="info-value">${mission.contact_exploitation || 'Non renseigné'}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Téléphone</div>
                    <div class="info-value">${mission.tel_exploitation || 'Non renseigné'}</div>
                </div>
            </div>
        </div>
        
        <!-- MISSION -->
        <div class="section">
            <h2>📋 Détails Mission</h2>
            <div class="info-grid">
                <div class="info-item">
                    <div class="info-label">Date Audit</div>
                    <div class="info-value">${new Date(dateAudit).toLocaleDateString('fr-FR')}</div>
                </div>
            </div>
            
            <div class="checklist-summary">
                <div class="info-label">Checklist Qualité</div>
                <div class="checklist-count">${mission.nb_checklist} points</div>
                <div style="color: #4b5563; font-size: 14px; margin-top: 5px;">
                    Conforme NF C 15-100 + UTE C 15-712${auditToiture ? ' + DTU 40.35' : ''}
                </div>
                <div style="margin-top: 10px; font-weight: 600; color: #2563eb;">
                    🔗 Checklist mobile : 
                    <span style="font-family: monospace; background: white; padding: 4px 8px; border-radius: 4px;">
                        https://63d55586.girasole-diagpv.pages.dev/audit/${mission.id}
                    </span>
                </div>
            </div>
        </div>
        
        ${auditToiture ? `
        <!-- CONSIGNES TOITURE -->
        <div class="important-box">
            <h3>⚠️ CONSIGNES SPÉCIFIQUES AUDIT TOITURE</h3>
            <ul>
                <li><strong>Démontage MINIMUM 25 PANNEAUX</strong> (choix pertinent : 1er et dernier de chaîne)</li>
                <li>Remontage sans atteindre intégrité modules/supports</li>
                <li>Respecter notices montage (si impossible, indiquer à GIRASOLE avant intervention)</li>
                <li><strong>INTERDIT :</strong> Marcher sur panneaux</li>
                <li>Moyens accès : nacelle, harnais, ligne de vie (selon site)</li>
            </ul>
        </div>
        ` : ''}
        
        <!-- SÉCURITÉ -->
        <div class="section">
            <h2>🛡️ Sécurité & Prérequis</h2>
            <ul>
                <li>Plan de prévention GIRASOLE signé par sous-traitant</li>
                <li>Analyse des risques fournie</li>
                <li>Habilitations électriques valides</li>
                ${auditToiture ? '<li>Habilitations travail en hauteur + permis nacelle si applicable</li>' : ''}
                <li>EPI complets (casque, chaussures sécurité, gants isolants, etc.)</li>
            </ul>
        </div>
        
        <!-- LIVRABLES -->
        <div class="section">
            <h2>📦 Livrables Attendus</h2>
            <ul>
                <li>Checklist ${mission.nb_checklist} points complétée (via interface mobile)</li>
                <li>Reportage photo géolocalisé pour chaque point de contrôle</li>
                <li>Photos haute définition des non-conformités identifiées</li>
                <li>Commentaires techniques détaillés</li>
            </ul>
            <div style="margin-top: 15px; padding: 10px; background: #fef3c7; border-radius: 4px;">
                <strong>⏰ Délai :</strong> Remise J+5 maximum après intervention
            </div>
        </div>
        
        <div class="footer">
            <p><strong>DiagPV - Diagnostic Photovoltaïque</strong></p>
            <p>Document généré le ${new Date().toLocaleString('fr-FR')}</p>
            <p>Mission #${mission.id} | ${mission.centrale_nom}</p>
        </div>
    </div>
</body>
</html>
    `)
    
  } catch (error) {
    console.error('Erreur génération OM:', error)
    return c.html(`<h1>Erreur génération OM</h1><p>${String(error)}</p>`, 500)
  }
})

// =======================
// SUIVI AUDITS SOUS-TRAITANTS
// =======================

// GET /suivi-audits - Dashboard suivi temps réel
app.get('/suivi-audits', async (c) => {
  const { DB } = c.env
  
  try {
    // Récupérer stats globales
    const stats = await DB.prepare(`
      SELECT 
        COUNT(DISTINCT om.id) as total_missions,
        COUNT(DISTINCT CASE WHEN ci.statut != 'NON_VERIFIE' THEN om.id END) as missions_commencees,
        COUNT(DISTINCT CASE WHEN ci.statut = 'CONFORME' OR ci.statut = 'NON_CONFORME' THEN om.id END) as missions_progress,
        SUM(CASE WHEN ci.statut = 'CONFORME' OR ci.statut = 'NON_CONFORME' THEN 1 ELSE 0 END) as points_completes,
        COUNT(ci.id) as points_total,
        COUNT(DISTINCT ap.id) as photos_total
      FROM ordres_mission om
      LEFT JOIN checklist_items ci ON om.id = ci.ordre_mission_id
      LEFT JOIN audit_photos ap ON om.id = ap.ordre_mission_id
    `).first()
    
    return c.html(`
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Suivi Audits - GIRASOLE</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        .mission-card { transition: all 0.3s; }
        .mission-card:hover { transform: translateY(-4px); box-shadow: 0 10px 20px rgba(0,0,0,0.1); }
        .progress-ring { transform: rotate(-90deg); }
    </style>
</head>
<body class="bg-gray-100">
    <div class="min-h-screen">
        <!-- Header -->
        <header class="bg-gradient-to-r from-blue-600 to-purple-600 text-white shadow-lg">
            <div class="container mx-auto px-6 py-6">
                <div class="flex items-center justify-between">
                    <div>
                        <h1 class="text-3xl font-bold">
                            <i class="fas fa-chart-line mr-3"></i>
                            Suivi Audits GIRASOLE
                        </h1>
                        <p class="text-blue-100 mt-2">
                            <i class="fas fa-users mr-2"></i>
                            Dashboard temps réel - Sous-traitants ARTEMIS & CADENET
                        </p>
                    </div>
                    <div class="text-right">
                        <a href="/" class="bg-white text-blue-600 px-4 py-2 rounded-lg hover:bg-blue-50 transition mr-2">
                            <i class="fas fa-home mr-2"></i>Accueil
                        </a>
                        <a href="/planning-manager" class="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-400 transition">
                            <i class="fas fa-calendar mr-2"></i>Planning
                        </a>
                    </div>
                </div>
            </div>
        </header>
        
        <!-- Stats Cards -->
        <div class="container mx-auto px-6 py-8">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
                <div class="bg-white rounded-lg shadow-lg p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-500 text-sm uppercase">Total Missions</p>
                            <p class="text-3xl font-bold text-gray-800 mt-1">${stats.total_missions || 0}</p>
                        </div>
                        <i class="fas fa-clipboard-list text-4xl text-blue-500"></i>
                    </div>
                </div>
                
                <div class="bg-white rounded-lg shadow-lg p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-500 text-sm uppercase">Commencées</p>
                            <p class="text-3xl font-bold text-yellow-600 mt-1">${stats.missions_commencees || 0}</p>
                        </div>
                        <i class="fas fa-play-circle text-4xl text-yellow-500"></i>
                    </div>
                </div>
                
                <div class="bg-white rounded-lg shadow-lg p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-500 text-sm uppercase">Points Complétés</p>
                            <p class="text-3xl font-bold text-green-600 mt-1">${stats.points_completes || 0} / ${stats.points_total || 0}</p>
                        </div>
                        <i class="fas fa-check-circle text-4xl text-green-500"></i>
                    </div>
                </div>
                
                <div class="bg-white rounded-lg shadow-lg p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-500 text-sm uppercase">Photos</p>
                            <p class="text-3xl font-bold text-purple-600 mt-1">${stats.photos_total || 0}</p>
                        </div>
                        <i class="fas fa-camera text-4xl text-purple-500"></i>
                    </div>
                </div>
            </div>
            
            <!-- Filtres -->
            <div class="bg-white rounded-lg shadow-md p-6 mb-6">
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-building mr-2"></i>Sous-Traitant
                        </label>
                        <select id="filter-st" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                            <option value="">Tous</option>
                            <option value="ARTEMIS">ARTEMIS</option>
                            <option value="CADENET">CADENET</option>
                            <option value="DIAGPV">DIAGPV - Adrien & Fabien</option>
                        </select>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-filter mr-2"></i>Statut
                        </label>
                        <select id="filter-statut" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                            <option value="">Tous</option>
                            <option value="NON_COMMENCEE">Non commencée</option>
                            <option value="EN_COURS">En cours</option>
                            <option value="TERMINEE">Terminée</option>
                        </select>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-search mr-2"></i>Recherche
                        </label>
                        <input 
                            type="text" 
                            id="search-centrale" 
                            placeholder="Nom centrale..."
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                        >
                    </div>
                </div>
            </div>
            
            <!-- Liste Missions -->
            <div id="missions-container" class="space-y-4">
                <div class="text-center py-8">
                    <i class="fas fa-spinner fa-spin text-4xl text-blue-500"></i>
                    <p class="text-gray-600 mt-4">Chargement des missions...</p>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/axios@1.6.0/dist/axios.min.js"></script>
    <script>
        // Charger missions
        async function loadMissions() {
            try {
                const response = await axios.get('/api/suivi-missions');
                const missions = response.data.data;
                
                const container = document.getElementById('missions-container');
                
                if (!missions || missions.length === 0) {
                    container.innerHTML = '<div class="text-center py-12 text-gray-500">Aucune mission trouvée</div>';
                    return;
                }
                
                container.innerHTML = missions.map(m => {
                    const progression = m.nb_points_total > 0 
                        ? Math.round((m.nb_points_completes / m.nb_points_total) * 100) 
                        : 0;
                    
                    let statutBadge = '';
                    if (progression === 0) {
                        statutBadge = '<span class="px-3 py-1 rounded-full text-xs font-semibold bg-gray-200 text-gray-800">Non commencée</span>';
                    } else if (progression === 100) {
                        statutBadge = '<span class="px-3 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-800">✅ Terminée</span>';
                    } else {
                        statutBadge = '<span class="px-3 py-1 rounded-full text-xs font-semibold bg-yellow-100 text-yellow-800">🔄 En cours</span>';
                    }
                    
                    return \`
                        <div class="mission-card bg-white rounded-lg shadow-md p-6" data-st="\${m.sous_traitant}" data-centrale="\${m.centrale_nom}">
                            <div class="flex items-start justify-between mb-4">
                                <div class="flex-1">
                                    <h3 class="text-xl font-bold text-gray-800 mb-1">\${m.centrale_nom}</h3>
                                    <p class="text-sm text-gray-600">ID Ref: \${m.id_ref || 'N/A'} | \${m.puissance_kwc || 0} kWc</p>
                                </div>
                                \${statutBadge}
                            </div>
                            
                            <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-4">
                                <div>
                                    <p class="text-xs text-gray-500 mb-1">Sous-Traitant</p>
                                    <p class="font-semibold text-gray-800">\${m.sous_traitant}</p>
                                </div>
                                <div>
                                    <p class="text-xs text-gray-500 mb-1">Technicien</p>
                                    <p class="font-semibold text-gray-800">\${m.technicien_nom}</p>
                                </div>
                                <div>
                                    <p class="text-xs text-gray-500 mb-1">Date Mission</p>
                                    <p class="font-semibold text-gray-800">\${new Date(m.date_mission).toLocaleDateString('fr-FR')}</p>
                                </div>
                                <div>
                                    <p class="text-xs text-gray-500 mb-1">Photos</p>
                                    <p class="font-semibold text-gray-800">\${m.nb_photos || 0} photos</p>
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <div class="flex justify-between items-center mb-2">
                                    <span class="text-sm font-medium text-gray-700">Progression</span>
                                    <span class="text-sm font-bold text-blue-600">\${progression}%</span>
                                </div>
                                <div class="w-full bg-gray-200 rounded-full h-3">
                                    <div class="bg-gradient-to-r from-blue-500 to-purple-500 h-3 rounded-full transition-all" style="width: \${progression}%"></div>
                                </div>
                                <p class="text-xs text-gray-500 mt-1">
                                    \${m.nb_points_completes || 0} / \${m.nb_points_total || 0} points complétés
                                </p>
                            </div>
                            
                            <div class="flex gap-2">
                                <a href="/audit/\${m.mission_id}" target="_blank" class="flex-1 bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition text-center text-sm">
                                    <i class="fas fa-clipboard-check mr-2"></i>Voir Checklist
                                </a>
                                <a href="/photos-audit/\${m.mission_id}" target="_blank" class="flex-1 bg-purple-500 text-white px-4 py-2 rounded-lg hover:bg-purple-600 transition text-center text-sm">
                                    <i class="fas fa-images mr-2"></i>Photos (\${m.nb_photos || 0})
                                </a>
                                <a href="/om/\${m.mission_id}" target="_blank" class="bg-gray-500 text-white px-4 py-2 rounded-lg hover:bg-gray-600 transition text-sm">
                                    <i class="fas fa-file-pdf mr-2"></i>OM
                                </a>
                            </div>
                        </div>
                    \`;
                }).join('');
                
            } catch (error) {
                console.error('Erreur chargement missions:', error);
                document.getElementById('missions-container').innerHTML = 
                    '<div class="text-center py-12 text-red-500">Erreur chargement missions</div>';
            }
        }
        
        // Filtres
        document.getElementById('filter-st').addEventListener('change', filterMissions);
        document.getElementById('filter-statut').addEventListener('change', filterMissions);
        document.getElementById('search-centrale').addEventListener('input', filterMissions);
        
        function filterMissions() {
            const st = document.getElementById('filter-st').value.toLowerCase();
            const search = document.getElementById('search-centrale').value.toLowerCase();
            
            document.querySelectorAll('.mission-card').forEach(card => {
                const cardSt = card.dataset.st.toLowerCase();
                const cardCentrale = card.dataset.centrale.toLowerCase();
                
                const matchSt = !st || cardSt.includes(st);
                const matchSearch = !search || cardCentrale.includes(search);
                
                card.style.display = matchSt && matchSearch ? 'block' : 'none';
            });
        }
        
        // Charger au démarrage
        loadMissions();
        
        // Actualiser toutes les 30 secondes
        setInterval(loadMissions, 30000);
    </script>
</body>
</html>
    `)
  } catch (error) {
    console.error('Erreur suivi audits:', error)
    return c.html(`<h1>Erreur</h1><p>${String(error)}</p>`, 500)
  }
})

// GET /api/suivi-missions - API données missions pour dashboard
app.get('/api/suivi-missions', async (c) => {
  const { DB } = c.env
  
  try {
    const missions = await DB.prepare(`
      SELECT 
        om.id as mission_id,
        om.date_mission,
        c.id as centrale_id,
        c.nom as centrale_nom,
        c.id_ref,
        c.puissance_kwc,
        st.nom_entreprise as sous_traitant,
        t.nom || ' ' || t.prenom as technicien_nom,
        COUNT(DISTINCT ci.id) as nb_points_total,
        COUNT(DISTINCT CASE WHEN ci.statut IN ('CONFORME', 'NON_CONFORME') THEN ci.id END) as nb_points_completes,
        COUNT(DISTINCT CASE WHEN ci.photo_base64 IS NOT NULL THEN ci.id END) as nb_photos
      FROM ordres_mission om
      JOIN centrales c ON om.centrale_id = c.id
      JOIN sous_traitants st ON om.sous_traitant_id = st.id
      JOIN techniciens t ON om.technicien_id = t.id
      LEFT JOIN checklist_items ci ON om.id = ci.ordre_mission_id
      GROUP BY om.id
      ORDER BY om.date_mission, c.nom
    `).all()
    
    return c.json({ success: true, data: missions.results })
  } catch (error) {
    console.error('Erreur API suivi:', error)
    return c.json({ success: false, error: String(error) }, 500)
  }
})

export default app
