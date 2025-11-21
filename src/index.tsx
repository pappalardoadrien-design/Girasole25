import { Hono } from 'hono'
import { cors } from 'hono/cors'
import { serveStatic } from 'hono/cloudflare-workers'

type Bindings = {
  DB: D1Database;
}

const app = new Hono<{ Bindings: Bindings }>()

// Enable CORS for API routes
app.use('/api/*', cors())

// Serve static files
app.use('/static/*', serveStatic({ root: './public' }))

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
        COUNT(r.id) as nb_retours,
        SUM(r.nb_photos) as total_photos
      FROM centrales c
      LEFT JOIN retours_json r ON c.id = r.centrale_id
      GROUP BY c.id
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
    
    // Total photos et volumétrie
    const statsVolume = await DB.prepare(`
      SELECT 
        COUNT(*) as total_retours,
        SUM(nb_photos) as total_photos,
        SUM(taille_mo) as total_json_mb
      FROM retours_json
    `).first()
    
    return c.json({ 
      success: true, 
      data: {
        global: statsGlobal,
        par_statut: statsStatut.results,
        par_type: statsType.results,
        volumetrie: statsVolume
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
        st.nom_entreprise
      FROM ordres_mission om
      JOIN centrales c ON om.centrale_id = c.id
      JOIN techniciens t ON om.technicien_id = t.id
      JOIN sous_traitants st ON om.sous_traitant_id = st.id
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
              <div class="info-label">Heure Début</div>
              <div class="info-value">${mission.heure_debut || '08:00'}</div>
            </div>
            <div class="info-item">
              <div class="info-label">Durée Estimée</div>
              <div class="info-value">${mission.duree_estimee_heures}h</div>
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
    // Récupérer toutes les centrales
    const centrales = await DB.prepare(`
      SELECT * FROM centrales ORDER BY id
    `).all()
    
    // Ajouter informations de distance (simplifiées pour démo)
    const centralesAvecDistance = centrales.results.map((centrale: any) => {
      // Extraction du département depuis localisation
      const deptMatch = centrale.localisation?.match(/\b(\d{1,2})\d{3}\b/)
      const dept = deptMatch ? deptMatch[1] : '00'
      
      return {
        ...centrale,
        dept: dept,
        distance_km: Math.floor(Math.random() * 150), // Simplification pour démo
        base_proche: Math.random() > 0.5 ? 'Toulouse' : 'Lyon'
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
    // Structure checklist V4 (54 points)
    const checklistStructure = [
      // DOC (8 points)
      { cat: 'DOC', items: [
        'Plaques signalétiques modules',
        'Plan installation (as-built)',
        'Schémas électriques (DC/AC)',
        'Attestation Consuel',
        'Certificats conformité onduleurs',
        'Rapport mise en service',
        'Contrat maintenance O&M',
        'Notice technique modules'
      ]},
      // ELEC (12 points)
      { cat: 'ELEC', items: [
        'Mesure tension Voc strings (à vide)',
        'Mesure courant Isc strings (court-circuit)',
        'Test isolement DC (> 1 MΩ)',
        'Mesure continuité terres',
        'Polarité strings (+ et -)',
        'Protection différentielle 30mA',
        'Disjoncteurs calibrage correct',
        'Parafoudres DC/AC état',
        'Test fonctionnel onduleurs',
        'Monitoring production réel vs théorique',
        'Équilibrage phases AC',
        'Cos φ (facteur puissance)'
      ]},
      // TABLEAUX (8 points)
      { cat: 'TABLEAUX', items: [
        'État général coffrets DC',
        'Étanchéité IP65 boîtiers',
        'Serrage bornes électriques',
        'Signalétique circuits',
        'Ventilation coffrets',
        'Absence corrosion/oxydation',
        'Échauffement anormal (thermographie)',
        'Accessibilité maintenance'
      ]},
      // CABLAGE (7 points)
      { cat: 'CABLAGE', items: [
        'Connecteurs MC4 serrés/étanches',
        'Gaines ICTA/IRL état',
        'Chemins câbles fixations',
        'Protection UV câbles DC',
        'Rayon courbure respecté',
        'Absence points chauds (thermographie)',
        'Marquage câbles positif/négatif'
      ]},
      // MODULES (10 points)
      { cat: 'MODULES', items: [
        'État visuel face avant (fissures/casse)',
        'État cadres (corrosion/déformation)',
        'Boîtiers jonction étanches',
        'Diodes by-pass fonctionnelles',
        'Hotspots thermographie (ΔT > 10°C)',
        'Délamination/bulles',
        'Snail trails (traces escargot)',
        'Salissures importantes',
        'Ombres portées permanentes',
        'PID (Potential Induced Degradation)'
      ]},
      // STRUCTURES (5 points)
      { cat: 'STRUCTURES', items: [
        'Fixations modules (boulons/clips)',
        'État rails (corrosion/déformation)',
        'Fondations/lestage stable',
        'Mise à la terre structures',
        'Espacement inter-rangées ventilation'
      ]},
      // TOITURE (4 points)
      { cat: 'TOITURE', items: [
        'Étanchéité traversées toiture',
        'État couverture (tuiles/bac acier)',
        'Écrans sous-toiture intacts',
        'Zinguerie/gouttières fonctionnelles'
      ]}
    ]
    
    // Insérer tous les items
    for (const category of checklistStructure) {
      for (let i = 0; i < category.items.length; i++) {
        await DB.prepare(`
          INSERT OR IGNORE INTO checklist_items (ordre_mission_id, categorie, item_numero, item_texte)
          VALUES (?, ?, ?, ?)
        `).bind(missionId, category.cat, i + 1, category.items[i]).run()
      }
    }
    
    return c.json({ success: true, message: 'Checklist initialisée (54 points)' })
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
            <div class="info-item">
              <div class="info-label">Durée Audit</div>
              <div class="info-value">${mission.duree_estimee_heures || 7}h</div>
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
                                <p class="text-gray-500 text-sm">Photos Total</p>
                                <p id="stat-photos" class="text-3xl font-bold text-orange-600">-</p>
                            </div>
                            <i class="fas fa-camera text-4xl text-orange-500"></i>
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
                            <p class="text-gray-500 text-sm">JSON V4 Total</p>
                            <p id="vol-json" class="text-2xl font-bold text-blue-600">- MB</p>
                        </div>
                        <div class="border-l-4 border-green-500 pl-4">
                            <p class="text-gray-500 text-sm">Photos Estimées</p>
                            <p id="vol-photos" class="text-2xl font-bold text-green-600">- GB</p>
                        </div>
                        <div class="border-l-4 border-purple-500 pl-4">
                            <p class="text-gray-500 text-sm">Heures Terrain</p>
                            <p id="vol-heures" class="text-2xl font-bold text-purple-600">360h</p>
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
                        <div class="mb-4">
                            <h3 class="text-lg font-bold">Vue Calendrier</h3>
                            <p class="text-gray-600 text-sm">Planning des missions par date</p>
                        </div>
                        <div id="calendrier-view">
                            <div class="bg-gray-50 border-2 border-dashed border-gray-300 rounded-lg p-12 text-center">
                                <i class="fas fa-calendar-alt text-6xl text-gray-400 mb-4"></i>
                                <p class="text-gray-600">Vue calendrier en cours de développement</p>
                                <p class="text-gray-500 text-sm mt-2">Utilisez pour l'instant l'onglet "Ordres de Mission"</p>
                            </div>
                        </div>
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
                            <div class="grid grid-cols-2 gap-4 mt-6">
                                <div class="bg-gray-50 p-4 rounded-lg">
                                    <p class="text-sm text-gray-600">Restant à auditer</p>
                                    <p id="analytics-remaining" class="text-2xl font-bold text-gray-800">52</p>
                                </div>
                                <div class="bg-gray-50 p-4 rounded-lg">
                                    <p class="text-sm text-gray-600">Temps estimé restant</p>
                                    <p id="analytics-time-remaining" class="text-2xl font-bold text-gray-800">360h</p>
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
                            <h4 class="font-bold text-lg mb-2">⏱️ Timeline Estimée</h4>
                            <p class="text-gray-600"><strong>360 heures</strong> de terrain total pour 52 centrales</p>
                            <p class="text-gray-600"><strong>3-4 semaines intensives</strong> avec équipe de 2-3 techniciens</p>
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

export default app
