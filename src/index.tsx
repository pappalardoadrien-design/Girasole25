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
        SUM(r.nombre_photos) as total_photos
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
    const { centrale_id, nom_fichier, taille_mo, nombre_photos, technicien } = body
    
    if (!centrale_id || !nom_fichier) {
      return c.json({ success: false, error: 'centrale_id et nom_fichier requis' }, 400)
    }
    
    const result = await DB.prepare(`
      INSERT INTO retours_json (centrale_id, nom_fichier, taille_mo, nombre_photos, technicien)
      VALUES (?, ?, ?, ?, ?)
    `).bind(centrale_id, nom_fichier, taille_mo || 0, nombre_photos || 0, technicien || 'Inconnu').run()
    
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
        SUM(nombre_photos) as total_photos,
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
        SUM(nombre_photos) as photos
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
    </body>
    </html>
  `)
})

export default app
