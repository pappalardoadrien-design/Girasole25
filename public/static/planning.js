// ====================================
// MODULE PLANNING - GIRASOLE 2025
// ====================================

// Variables globales
let sousTraitantsData = [];
let techniciensData = [];
let missionsData = [];
let centralesDisponibles = [];

// ====================================
// CHARGEMENT INITIAL
// ====================================

function loadPlanningData() {
  loadPlanningStats();
  loadSousTraitants();
  loadTechniciens();
  loadMissions();
  loadCentralesDisponibles();
}

// Stats Planning
async function loadPlanningStats() {
  try {
    const response = await axios.get('/api/stats/planning');
    if (response.data.success) {
      const stats = response.data.data;
      document.getElementById('planning-stat-non-attribuees').textContent = stats.centrales_non_attribuees || 0;
      document.getElementById('planning-stat-techniciens').textContent = stats.techniciens_disponibles || 0;
      
      // Missions planifiées
      const planifiees = stats.missions_par_statut?.find(m => m.statut === 'PLANIFIE')?.count || 0;
      document.getElementById('planning-stat-planifiees').textContent = planifiees;
      
      // Sous-traitants actifs
      document.getElementById('planning-stat-sous-traitants').textContent = stats.missions_par_sous_traitant?.length || 0;
    }
  } catch (error) {
    console.error('Erreur chargement stats planning:', error);
  }
}

// ====================================
// SOUS-TRAITANTS
// ====================================

async function loadSousTraitants() {
  try {
    const response = await axios.get('/api/sous-traitants');
    if (response.data.success) {
      sousTraitantsData = response.data.data;
      displaySousTraitants(sousTraitantsData);
    }
  } catch (error) {
    console.error('Erreur chargement sous-traitants:', error);
    document.getElementById('sous-traitants-list').innerHTML = '<p class="text-red-500 text-center">Erreur de chargement</p>';
  }
}

function displaySousTraitants(data) {
  const container = document.getElementById('sous-traitants-list');
  
  if (data.length === 0) {
    container.innerHTML = '<p class="text-gray-500 text-center py-8">Aucun sous-traitant enregistré</p>';
    return;
  }
  
  const html = `
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      ${data.map(st => `
        <div class="border rounded-lg p-6 hover:shadow-lg transition">
          <div class="flex items-start justify-between mb-4">
            <div class="flex-1">
              <h4 class="text-lg font-bold text-gray-800">${st.nom_entreprise}</h4>
              <p class="text-sm text-gray-600">${st.contact_principal || 'Contact non renseigné'}</p>
            </div>
            <span class="px-3 py-1 text-xs font-semibold rounded-full ${st.statut === 'ACTIF' ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-800'}">
              ${st.statut}
            </span>
          </div>
          
          <div class="space-y-2 mb-4">
            <p class="text-sm text-gray-600">
              <i class="fas fa-envelope mr-2"></i>${st.email_contact || 'N/A'}
            </p>
            <p class="text-sm text-gray-600">
              <i class="fas fa-phone mr-2"></i>${st.telephone || 'N/A'}
            </p>
          </div>
          
          <div class="flex items-center justify-between pt-4 border-t">
            <div class="flex space-x-4">
              <span class="text-sm">
                <i class="fas fa-users text-blue-600 mr-1"></i>
                <strong>${st.nb_techniciens || 0}</strong> techniciens
              </span>
              <span class="text-sm">
                <i class="fas fa-clipboard-list text-green-600 mr-1"></i>
                <strong>${st.nb_missions || 0}</strong> missions
              </span>
            </div>
            <button onclick="editSousTraitant(${st.id})" class="text-blue-600 hover:text-blue-800">
              <i class="fas fa-edit"></i>
            </button>
          </div>
        </div>
      `).join('')}
    </div>
  `;
  
  container.innerHTML = html;
}

async function createSousTraitant(formData) {
  try {
    const response = await axios.post('/api/sous-traitants', formData);
    if (response.data.success) {
      showNotification('Sous-traitant créé avec succès', 'success');
      loadSousTraitants();
      loadPlanningStats();
      return true;
    }
  } catch (error) {
    showNotification('Erreur création sous-traitant: ' + error.message, 'error');
    return false;
  }
}

// ====================================
// TECHNICIENS
// ====================================

async function loadTechniciens() {
  try {
    const response = await axios.get('/api/techniciens');
    if (response.data.success) {
      techniciensData = response.data.data;
      displayTechniciens(techniciensData);
    }
  } catch (error) {
    console.error('Erreur chargement techniciens:', error);
    document.getElementById('techniciens-list').innerHTML = '<p class="text-red-500 text-center">Erreur de chargement</p>';
  }
}

function displayTechniciens(data) {
  const container = document.getElementById('techniciens-list');
  
  if (data.length === 0) {
    container.innerHTML = '<p class="text-gray-500 text-center py-8">Aucun technicien enregistré</p>';
    return;
  }
  
  const html = `
    <div class="overflow-x-auto">
      <table class="min-w-full">
        <thead class="bg-gray-50">
          <tr>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Technicien</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Entreprise</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Contact</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Statut</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Missions</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          ${data.map(tech => `
            <tr class="hover:bg-gray-50">
              <td class="px-6 py-4 whitespace-nowrap">
                <div class="flex items-center">
                  <div class="flex-shrink-0 h-10 w-10">
                    <div class="h-10 w-10 rounded-full bg-blue-100 flex items-center justify-center">
                      <span class="text-blue-600 font-bold text-sm">${tech.prenom.charAt(0)}${tech.nom.charAt(0)}</span>
                    </div>
                  </div>
                  <div class="ml-4">
                    <div class="text-sm font-medium text-gray-900">${tech.prenom} ${tech.nom}</div>
                  </div>
                </div>
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                ${tech.nom_entreprise || 'N/A'}
              </td>
              <td class="px-6 py-4 whitespace-nowrap">
                <div class="text-sm text-gray-600">${tech.email || 'N/A'}</div>
                <div class="text-sm text-gray-500">${tech.telephone || 'N/A'}</div>
              </td>
              <td class="px-6 py-4 whitespace-nowrap">
                <span class="px-2 py-1 inline-flex text-xs leading-5 font-semibold rounded-full 
                  ${tech.statut === 'DISPONIBLE' ? 'bg-green-100 text-green-800' : 
                    tech.statut === 'OCCUPE' ? 'bg-yellow-100 text-yellow-800' : 
                    'bg-gray-100 text-gray-800'}">
                  ${tech.statut}
                </span>
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                <span class="font-bold">${tech.nb_missions_actives || 0}</span> actives
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                <button onclick="editTechnicien(${tech.id})" class="text-blue-600 hover:text-blue-900 mr-3">
                  <i class="fas fa-edit"></i>
                </button>
                <button onclick="assignMission(${tech.id})" class="text-green-600 hover:text-green-900">
                  <i class="fas fa-plus-circle"></i>
                </button>
              </td>
            </tr>
          `).join('')}
        </tbody>
      </table>
    </div>
  `;
  
  container.innerHTML = html;
}

async function createTechnicien(formData) {
  try {
    const response = await axios.post('/api/techniciens', formData);
    if (response.data.success) {
      showNotification('Technicien créé avec succès', 'success');
      loadTechniciens();
      loadPlanningStats();
      return true;
    }
  } catch (error) {
    showNotification('Erreur création technicien: ' + error.message, 'error');
    return false;
  }
}

// ====================================
// ORDRES DE MISSION
// ====================================

async function loadMissions() {
  try {
    const response = await axios.get('/api/ordres-mission');
    if (response.data.success) {
      missionsData = response.data.data;
      displayMissions(missionsData);
    }
  } catch (error) {
    console.error('Erreur chargement missions:', error);
    document.getElementById('missions-list').innerHTML = '<p class="text-red-500 text-center">Erreur de chargement</p>';
  }
}

function displayMissions(data) {
  const container = document.getElementById('missions-list');
  
  if (data.length === 0) {
    container.innerHTML = `
      <div class="text-center py-12">
        <i class="fas fa-clipboard-list text-6xl text-gray-300 mb-4"></i>
        <p class="text-gray-500 mb-4">Aucun ordre de mission créé</p>
        <button onclick="showModalOrdreMission()" class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-6 rounded">
          <i class="fas fa-plus mr-2"></i>Créer Premier Ordre
        </button>
      </div>
    `;
    return;
  }
  
  // Grouper par statut
  const grouped = {
    'PLANIFIE': data.filter(m => m.statut === 'PLANIFIE'),
    'CONFIRME': data.filter(m => m.statut === 'CONFIRME'),
    'EN_COURS': data.filter(m => m.statut === 'EN_COURS'),
    'TERMINE': data.filter(m => m.statut === 'TERMINE'),
    'VALIDE': data.filter(m => m.statut === 'VALIDE')
  };
  
  const html = `
    <div class="space-y-6">
      ${Object.entries(grouped).map(([statut, missions]) => {
        if (missions.length === 0) return '';
        
        const colors = {
          'PLANIFIE': { bg: 'bg-blue-50', text: 'text-blue-800', badge: 'bg-blue-100' },
          'CONFIRME': { bg: 'bg-green-50', text: 'text-green-800', badge: 'bg-green-100' },
          'EN_COURS': { bg: 'bg-yellow-50', text: 'text-yellow-800', badge: 'bg-yellow-100' },
          'TERMINE': { bg: 'bg-purple-50', text: 'text-purple-800', badge: 'bg-purple-100' },
          'VALIDE': { bg: 'bg-gray-50', text: 'text-gray-800', badge: 'bg-gray-100' }
        };
        
        const color = colors[statut];
        
        return `
          <div class="${color.bg} rounded-lg p-4">
            <h4 class="font-bold ${color.text} mb-4 flex items-center">
              <span class="mr-2">${getStatutIcon(statut)}</span>
              ${formatStatut(statut)} (${missions.length})
            </h4>
            <div class="space-y-3">
              ${missions.map(m => `
                <div class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition">
                  <div class="flex items-start justify-between">
                    <div class="flex-1">
                      <h5 class="font-bold text-gray-800 mb-1">${m.centrale_nom}</h5>
                      <p class="text-sm text-gray-600 mb-2">
                        <i class="fas fa-map-marker-alt mr-1"></i>${m.localisation || 'Localisation non renseignée'}
                      </p>
                      <div class="flex items-center space-x-4 text-sm">
                        <span class="text-gray-600">
                          <i class="fas fa-user text-blue-600 mr-1"></i>
                          <strong>${m.technicien_prenom} ${m.technicien_nom}</strong>
                        </span>
                        <span class="text-gray-600">
                          <i class="fas fa-building text-green-600 mr-1"></i>
                          ${m.nom_entreprise}
                        </span>
                        <span class="text-gray-600">
                          <i class="fas fa-calendar text-purple-600 mr-1"></i>
                          ${formatDate(m.date_mission)}
                        </span>
                        <span class="text-gray-600">
                          <i class="fas fa-clock text-orange-600 mr-1"></i>
                          ${m.duree_estimee_heures}h
                        </span>
                      </div>
                    </div>
                    <div class="flex items-center space-x-2 ml-4">
                      <button onclick="viewMission(${m.id})" class="text-blue-600 hover:text-blue-800 p-2" title="Voir détails">
                        <i class="fas fa-eye"></i>
                      </button>
                      <button onclick="editMission(${m.id})" class="text-green-600 hover:text-green-800 p-2" title="Modifier">
                        <i class="fas fa-edit"></i>
                      </button>
                      ${m.statut === 'PLANIFIE' ? `
                        <button onclick="cancelMission(${m.id})" class="text-red-600 hover:text-red-800 p-2" title="Annuler">
                          <i class="fas fa-times-circle"></i>
                        </button>
                      ` : ''}
                    </div>
                  </div>
                </div>
              `).join('')}
            </div>
          </div>
        `;
      }).join('')}
    </div>
  `;
  
  container.innerHTML = html;
}

async function createOrdreMission(formData) {
  try {
    const response = await axios.post('/api/ordres-mission', formData);
    if (response.data.success) {
      showNotification('Ordre de mission créé avec succès', 'success');
      loadMissions();
      loadPlanningStats();
      loadStats(); // Recharger stats globales
      return true;
    }
  } catch (error) {
    showNotification('Erreur création ordre: ' + (error.response?.data?.error || error.message), 'error');
    return false;
  }
}

async function changeMissionStatut(missionId, newStatut) {
  try {
    const response = await axios.put(`/api/ordres-mission/${missionId}/statut`, { statut: newStatut });
    if (response.data.success) {
      showNotification('Statut mis à jour', 'success');
      loadMissions();
      loadPlanningStats();
      return true;
    }
  } catch (error) {
    showNotification('Erreur mise à jour statut: ' + error.message, 'error');
    return false;
  }
}

// ====================================
// CENTRALES DISPONIBLES
// ====================================

async function loadCentralesDisponibles() {
  try {
    const response = await axios.get('/api/centrales');
    if (response.data.success) {
      // Filtrer centrales sans ordre de mission
      const missionsActives = missionsData.filter(m => m.statut !== 'ANNULE').map(m => m.centrale_id);
      centralesDisponibles = response.data.data.filter(c => !missionsActives.includes(c.id));
    }
  } catch (error) {
    console.error('Erreur chargement centrales disponibles:', error);
  }
}

// ====================================
// MODALS
// ====================================

function showModalSousTraitant() {
  const html = `
    <div id="modal-overlay" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50" onclick="closeModal(event)">
      <div class="bg-white rounded-lg p-8 max-w-2xl w-full mx-4" onclick="event.stopPropagation()">
        <div class="flex items-center justify-between mb-6">
          <h3 class="text-xl font-bold">Ajouter Sous-Traitant</h3>
          <button onclick="closeModal()" class="text-gray-500 hover:text-gray-700">
            <i class="fas fa-times text-xl"></i>
          </button>
        </div>
        
        <form id="form-sous-traitant" class="space-y-4">
          <div>
            <label class="block text-sm font-medium mb-2">Nom Entreprise *</label>
            <input type="text" name="nom_entreprise" required class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
          </div>
          
          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-medium mb-2">Contact Principal</label>
              <input type="text" name="contact_principal" class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
            </div>
            <div>
              <label class="block text-sm font-medium mb-2">Téléphone</label>
              <input type="tel" name="telephone" class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
            </div>
          </div>
          
          <div>
            <label class="block text-sm font-medium mb-2">Email</label>
            <input type="email" name="email_contact" class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
          </div>
          
          <div>
            <label class="block text-sm font-medium mb-2">Adresse</label>
            <textarea name="adresse" rows="2" class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500"></textarea>
          </div>
          
          <div>
            <label class="block text-sm font-medium mb-2">SIRET</label>
            <input type="text" name="siret" class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
          </div>
          
          <div class="flex justify-end space-x-3 pt-4">
            <button type="button" onclick="closeModal()" class="px-6 py-2 border rounded hover:bg-gray-50">
              Annuler
            </button>
            <button type="submit" class="px-6 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded">
              <i class="fas fa-save mr-2"></i>Enregistrer
            </button>
          </div>
        </form>
      </div>
    </div>
  `;
  
  document.body.insertAdjacentHTML('beforeend', html);
  
  document.getElementById('form-sous-traitant').addEventListener('submit', async (e) => {
    e.preventDefault();
    const formData = Object.fromEntries(new FormData(e.target));
    const success = await createSousTraitant(formData);
    if (success) closeModal();
  });
}

function showModalTechnicien() {
  if (sousTraitantsData.length === 0) {
    showNotification('Veuillez d\'abord créer un sous-traitant', 'warning');
    return;
  }
  
  const html = `
    <div id="modal-overlay" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50" onclick="closeModal(event)">
      <div class="bg-white rounded-lg p-8 max-w-2xl w-full mx-4" onclick="event.stopPropagation()">
        <div class="flex items-center justify-between mb-6">
          <h3 class="text-xl font-bold">Ajouter Technicien</h3>
          <button onclick="closeModal()" class="text-gray-500 hover:text-gray-700">
            <i class="fas fa-times text-xl"></i>
          </button>
        </div>
        
        <form id="form-technicien" class="space-y-4">
          <div>
            <label class="block text-sm font-medium mb-2">Sous-Traitant *</label>
            <select name="sous_traitant_id" required class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
              <option value="">Sélectionner...</option>
              ${sousTraitantsData.map(st => `
                <option value="${st.id}">${st.nom_entreprise}</option>
              `).join('')}
            </select>
          </div>
          
          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-medium mb-2">Prénom *</label>
              <input type="text" name="prenom" required class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
            </div>
            <div>
              <label class="block text-sm font-medium mb-2">Nom *</label>
              <input type="text" name="nom" required class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
            </div>
          </div>
          
          <div>
            <label class="block text-sm font-medium mb-2">Email</label>
            <input type="email" name="email" class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
          </div>
          
          <div>
            <label class="block text-sm font-medium mb-2">Téléphone</label>
            <input type="tel" name="telephone" class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
          </div>
          
          <div class="flex justify-end space-x-3 pt-4">
            <button type="button" onclick="closeModal()" class="px-6 py-2 border rounded hover:bg-gray-50">
              Annuler
            </button>
            <button type="submit" class="px-6 py-2 bg-green-600 hover:bg-green-700 text-white rounded">
              <i class="fas fa-save mr-2"></i>Enregistrer
            </button>
          </div>
        </form>
      </div>
    </div>
  `;
  
  document.body.insertAdjacentHTML('beforeend', html);
  
  document.getElementById('form-technicien').addEventListener('submit', async (e) => {
    e.preventDefault();
    const formData = Object.fromEntries(new FormData(e.target));
    formData.sous_traitant_id = parseInt(formData.sous_traitant_id);
    const success = await createTechnicien(formData);
    if (success) closeModal();
  });
}

function showModalOrdreMission() {
  if (techniciensData.length === 0) {
    showNotification('Veuillez d\'abord créer des techniciens', 'warning');
    return;
  }
  
  if (centralesDisponibles.length === 0) {
    showNotification('Toutes les centrales sont déjà attribuées', 'warning');
    return;
  }
  
  const html = `
    <div id="modal-overlay" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50" onclick="closeModal(event)">
      <div class="bg-white rounded-lg p-8 max-w-3xl w-full mx-4 max-h-[90vh] overflow-y-auto" onclick="event.stopPropagation()">
        <div class="flex items-center justify-between mb-6">
          <h3 class="text-xl font-bold">Créer Ordre de Mission</h3>
          <button onclick="closeModal()" class="text-gray-500 hover:text-gray-700">
            <i class="fas fa-times text-xl"></i>
          </button>
        </div>
        
        <form id="form-ordre-mission" class="space-y-4">
          <div>
            <label class="block text-sm font-medium mb-2">Centrale *</label>
            <select name="centrale_id" required onchange="updateTechniciensBySousTraitant()" class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
              <option value="">Sélectionner une centrale...</option>
              ${centralesDisponibles.map(c => `
                <option value="${c.id}">
                  ${c.nom} - ${c.puissance_kwc} kWc - ${c.localisation?.substring(0, 50) || 'N/A'}
                </option>
              `).join('')}
            </select>
          </div>
          
          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-medium mb-2">Sous-Traitant *</label>
              <select name="sous_traitant_id" required onchange="filterTechniciensBySousTraitant()" class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
                <option value="">Sélectionner...</option>
                ${sousTraitantsData.map(st => `
                  <option value="${st.id}">${st.nom_entreprise}</option>
                `).join('')}
              </select>
            </div>
            <div>
              <label class="block text-sm font-medium mb-2">Technicien *</label>
              <select name="technicien_id" id="select-technicien" required class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
                <option value="">Choisir sous-traitant d'abord...</option>
              </select>
            </div>
          </div>
          
          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-medium mb-2">Date Mission *</label>
              <input type="date" name="date_mission" required class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
            </div>
            <div>
              <label class="block text-sm font-medium mb-2">Heure Début</label>
              <input type="time" name="heure_debut" value="08:00" class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
            </div>
          </div>
          
          <div>
            <label class="block text-sm font-medium mb-2">Durée Estimée (heures)</label>
            <input type="number" step="0.5" name="duree_estimee_heures" value="7.0" class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500">
          </div>
          
          <div>
            <label class="block text-sm font-medium mb-2">Commentaires</label>
            <textarea name="commentaires" rows="3" class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-blue-500"></textarea>
          </div>
          
          <div class="flex justify-end space-x-3 pt-4">
            <button type="button" onclick="closeModal()" class="px-6 py-2 border rounded hover:bg-gray-50">
              Annuler
            </button>
            <button type="submit" class="px-6 py-2 bg-purple-600 hover:bg-purple-700 text-white rounded">
              <i class="fas fa-clipboard-list mr-2"></i>Créer Ordre de Mission
            </button>
          </div>
        </form>
      </div>
    </div>
  `;
  
  document.body.insertAdjacentHTML('beforeend', html);
  
  document.getElementById('form-ordre-mission').addEventListener('submit', async (e) => {
    e.preventDefault();
    const formData = Object.fromEntries(new FormData(e.target));
    formData.centrale_id = parseInt(formData.centrale_id);
    formData.technicien_id = parseInt(formData.technicien_id);
    formData.sous_traitant_id = parseInt(formData.sous_traitant_id);
    formData.duree_estimee_heures = parseFloat(formData.duree_estimee_heures);
    const success = await createOrdreMission(formData);
    if (success) closeModal();
  });
}

function filterTechniciensBySousTraitant() {
  const sousTraitantId = parseInt(document.querySelector('select[name="sous_traitant_id"]').value);
  const selectTechnicien = document.getElementById('select-technicien');
  
  if (!sousTraitantId) {
    selectTechnicien.innerHTML = '<option value="">Choisir sous-traitant d\'abord...</option>';
    return;
  }
  
  const techniciensFiltres = techniciensData.filter(t => t.sous_traitant_id === sousTraitantId && t.statut === 'DISPONIBLE');
  
  if (techniciensFiltres.length === 0) {
    selectTechnicien.innerHTML = '<option value="">Aucun technicien disponible</option>';
    return;
  }
  
  selectTechnicien.innerHTML = `
    <option value="">Sélectionner...</option>
    ${techniciensFiltres.map(t => `
      <option value="${t.id}">${t.prenom} ${t.nom} (${t.nb_missions_actives || 0} missions)</option>
    `).join('')}
  `;
}

function closeModal(event) {
  if (event && event.target.id !== 'modal-overlay') return;
  const modal = document.getElementById('modal-overlay');
  if (modal) modal.remove();
}

// ====================================
// NAVIGATION SOUS-TABS
// ====================================

function showPlanningSubTab(tabName) {
  // Hide all subtabs
  document.querySelectorAll('.planning-subtab-content').forEach(tab => tab.classList.add('hidden'));
  document.querySelectorAll('.planning-subtab-btn').forEach(btn => {
    btn.classList.remove('active', 'border-blue-600', 'text-blue-600');
    btn.classList.add('border-transparent', 'text-gray-600');
  });
  
  // Show selected subtab
  document.getElementById(`planning-subtab-${tabName}`).classList.remove('hidden');
  event.target.classList.add('active', 'border-blue-600', 'text-blue-600');
  event.target.classList.remove('border-transparent', 'text-gray-600');
  
  // Load data if needed
  if (tabName === 'techniciens' && techniciensData.length === 0) loadTechniciens();
  if (tabName === 'sous-traitants' && sousTraitantsData.length === 0) loadSousTraitants();
}

// ====================================
// HELPERS
// ====================================

function getStatutIcon(statut) {
  const icons = {
    'PLANIFIE': '📅',
    'CONFIRME': '✅',
    'EN_COURS': '⚡',
    'TERMINE': '🏁',
    'VALIDE': '⭐',
    'ANNULE': '❌'
  };
  return icons[statut] || '📋';
}

function formatStatut(statut) {
  const labels = {
    'PLANIFIE': 'Planifié',
    'CONFIRME': 'Confirmé',
    'EN_COURS': 'En Cours',
    'TERMINE': 'Terminé',
    'VALIDE': 'Validé',
    'ANNULE': 'Annulé'
  };
  return labels[statut] || statut;
}

function formatDate(dateStr) {
  if (!dateStr) return 'N/A';
  const date = new Date(dateStr);
  return date.toLocaleDateString('fr-FR', { day: '2-digit', month: 'short', year: 'numeric' });
}

function viewMission(id) {
  const mission = missionsData.find(m => m.id === id);
  if (!mission) return;
  
  alert(`Détails mission:\n\nCentrale: ${mission.centrale_nom}\nTechnicien: ${mission.technicien_prenom} ${mission.technicien_nom}\nDate: ${formatDate(mission.date_mission)}\nStatut: ${formatStatut(mission.statut)}`);
}

function editMission(id) {
  showNotification('Fonction en développement', 'info');
}

function cancelMission(id) {
  if (confirm('Êtes-vous sûr de vouloir annuler cette mission ?')) {
    changeMissionStatut(id, 'ANNULE');
  }
}

function assignMission(technicienId) {
  showModalOrdreMission();
  setTimeout(() => {
    const technicien = techniciensData.find(t => t.id === technicienId);
    if (technicien) {
      document.querySelector('select[name="sous_traitant_id"]').value = technicien.sous_traitant_id;
      filterTechniciensBySousTraitant();
      setTimeout(() => {
        document.querySelector('select[name="technicien_id"]').value = technicienId;
      }, 100);
    }
  }, 100);
}

function editSousTraitant(id) {
  showNotification('Fonction en développement', 'info');
}

function editTechnicien(id) {
  showNotification('Fonction en développement', 'info');
}

// ====================================
// EXPORT
// ====================================

window.loadPlanningData = loadPlanningData;
window.showPlanningSubTab = showPlanningSubTab;
window.showModalSousTraitant = showModalSousTraitant;
window.showModalTechnicien = showModalTechnicien;
window.showModalOrdreMission = showModalOrdreMission;
window.closeModal = closeModal;
window.filterTechniciensBySousTraitant = filterTechniciensBySousTraitant;
window.viewMission = viewMission;
window.editMission = editMission;
window.cancelMission = cancelMission;
window.assignMission = assignMission;
window.editSousTraitant = editSousTraitant;
window.editTechnicien = editTechnicien;
