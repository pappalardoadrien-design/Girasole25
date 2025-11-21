// planning-manager.js - Gestion complète du planning 52 centrales GIRASOLE

let allCentrales = [];
let sousTraitants = [];
let techniciens = [];
let selectedCentraleIds = new Set();

// Charger données au démarrage
async function loadPlanningData() {
  try {
    showLoader();
    
    // Charger planning complet
    const planningResp = await axios.get('/api/planning/full');
    if (planningResp.data.success) {
      allCentrales = planningResp.data.data;
      updateStats(planningResp.data.stats);
      renderPlanningTable(allCentrales);
    }
    
    // Charger sous-traitants
    const stResp = await axios.get('/api/sous-traitants');
    if (stResp.data.success) {
      sousTraitants = stResp.data.data;
      populateSousTraitantSelects();
    }
    
    // Charger techniciens
    const techResp = await axios.get('/api/techniciens');
    if (techResp.data.success) {
      techniciens = techResp.data.data;
      populateTechnicienSelect();
    }
    
    hideLoader();
  } catch (error) {
    hideLoader();
    showError('Erreur chargement données: ' + error.message);
  }
}

// Mettre à jour statistiques
function updateStats(stats) {
  document.getElementById('stat-total').textContent = stats.total || 0;
  document.getElementById('stat-assigned').textContent = stats.assigned || 0;
  document.getElementById('stat-unassigned').textContent = stats.unassigned || 0;
  document.getElementById('stat-planned').textContent = stats.planned || 0;
}

// Rendre tableau planning
function renderPlanningTable(centrales) {
  const container = document.getElementById('planning-table');
  
  if (!centrales || centrales.length === 0) {
    container.innerHTML = '<div class="text-center text-gray-500 py-8">Aucune centrale trouvée</div>';
    return;
  }
  
  const html = `
    <table class="min-w-full bg-white border border-gray-200">
      <thead class="bg-blue-600 text-white">
        <tr>
          <th class="px-3 py-2 text-left">
            <input type="checkbox" onchange="toggleSelectAll(this.checked)" class="rounded">
          </th>
          <th class="px-3 py-2 text-left">#</th>
          <th class="px-3 py-2 text-left">Centrale</th>
          <th class="px-3 py-2 text-center">kWc</th>
          <th class="px-3 py-2 text-center">Dist</th>
          <th class="px-3 py-2 text-center">Base</th>
          <th class="px-3 py-2 text-left">Sous-traitant</th>
          <th class="px-3 py-2 text-left">Technicien</th>
          <th class="px-3 py-2 text-center">Date mission</th>
          <th class="px-3 py-2 text-center">Statut</th>
          <th class="px-3 py-2 text-center">Actions</th>
        </tr>
      </thead>
      <tbody>
        ${centrales.map((c, idx) => `
          <tr class="table-row hover:bg-gray-50 ${c.is_assigned ? 'bg-green-50' : ''}">
            <td class="px-3 py-2">
              <input 
                type="checkbox" 
                class="centrale-checkbox rounded" 
                ${c.is_assigned ? 'disabled' : ''}
                data-centrale-id="${c.id}"
                onchange="toggleSelectCentrale(${c.id}, this.checked)"
              >
            </td>
            <td class="px-3 py-2 text-sm">${idx + 1}</td>
            <td class="px-3 py-2">
              <div class="font-medium text-gray-900">${c.centrale_nom}</div>
              <div class="text-xs text-gray-500">${c.dept || ''} - ${c.localisation?.substring(0, 40) || ''}...</div>
            </td>
            <td class="px-3 py-2 text-center text-sm">${c.puissance_kwc?.toFixed(1) || 0}</td>
            <td class="px-3 py-2 text-center text-sm font-mono">${c.distance_km?.toFixed(1) || 0} km</td>
            <td class="px-3 py-2 text-center">
              <span class="px-2 py-1 text-xs rounded ${c.base_proche === 'Toulouse' ? 'bg-blue-100 text-blue-800' : 'bg-red-100 text-red-800'}">
                ${c.base_proche || 'N/A'}
              </span>
            </td>
            <td class="px-3 py-2 text-sm">
              ${c.is_assigned ? 
                `<div class="font-medium text-green-700">${c.sous_traitant_nom || 'N/A'}</div>` :
                `<select class="text-xs border rounded px-1 py-1" id="st-${c.id}" onchange="quickAssignST(${c.id})">
                  <option value="">Choisir...</option>
                </select>`
              }
            </td>
            <td class="px-3 py-2 text-sm">
              ${c.is_assigned ?
                `<div class="text-gray-600">${c.technicien_nom || 'N/A'}</div>` :
                `<select class="text-xs border rounded px-1 py-1" id="tech-${c.id}">
                  <option value="">Choisir...</option>
                </select>`
              }
            </td>
            <td class="px-3 py-2 text-center text-sm">
              ${c.is_planned ?
                `<span class="font-mono text-green-700">${c.date_mission}</span>` :
                `<input type="date" id="date-${c.id}" class="text-xs border rounded px-1 py-1" />`
              }
            </td>
            <td class="px-3 py-2 text-center">
              ${getStatutBadge(c.centrale_statut, c.mission_statut)}
            </td>
            <td class="px-3 py-2 text-center">
              ${c.is_assigned ?
                `<button onclick="unassignCentrale(${c.id})" class="text-red-600 hover:text-red-800 text-xs">
                  <i class="fas fa-times-circle"></i> Retirer
                </button>` :
                `<button onclick="assignCentrale(${c.id})" class="text-green-600 hover:text-green-800 text-xs">
                  <i class="fas fa-check-circle"></i> Assigner
                </button>`
              }
            </td>
          </tr>
        `).join('')}
      </tbody>
    </table>
  `;
  
  container.innerHTML = html;
  
  // Populate selects for unassigned centrales
  setTimeout(() => {
    centrales.forEach(c => {
      if (!c.is_assigned) {
        populateRowSelects(c.id);
      }
    });
  }, 100);
}

function getStatutBadge(centraleStatut, missionStatut) {
  if (missionStatut === 'PLANIFIE') {
    return '<span class="px-2 py-1 text-xs rounded bg-green-100 text-green-800">Planifié</span>';
  } else if (missionStatut === 'EN_COURS') {
    return '<span class="px-2 py-1 text-xs rounded bg-yellow-100 text-yellow-800">En cours</span>';
  } else if (centraleStatut === 'EN_COURS') {
    return '<span class="px-2 py-1 text-xs rounded bg-blue-100 text-blue-800">En cours</span>';
  } else {
    return '<span class="px-2 py-1 text-xs rounded bg-gray-100 text-gray-800">À auditer</span>';
  }
}

function populateRowSelects(centraleId) {
  const stSelect = document.getElementById(`st-${centraleId}`);
  const techSelect = document.getElementById(`tech-${centraleId}`);
  
  if (stSelect && sousTraitants.length > 0) {
    sousTraitants.forEach(st => {
      const option = document.createElement('option');
      option.value = st.id;
      option.textContent = st.nom_entreprise;
      stSelect.appendChild(option);
    });
  }
  
  if (techSelect && techniciens.length > 0) {
    techniciens.forEach(t => {
      const option = document.createElement('option');
      option.value = t.id;
      option.textContent = `${t.prenom} ${t.nom}`;
      techSelect.appendChild(option);
    });
  }
}

function populateSousTraitantSelects() {
  const selects = ['st-toulouse-batch', 'st-lyon-batch'];
  selects.forEach(selectId => {
    const select = document.getElementById(selectId);
    if (select) {
      select.innerHTML = '<option value="">Sélectionner...</option>';
      sousTraitants.forEach(st => {
        const option = document.createElement('option');
        option.value = st.id;
        option.textContent = st.nom_entreprise;
        select.appendChild(option);
      });
    }
  });
}

function populateTechnicienSelect() {
  const select = document.getElementById('tech-batch');
  if (select) {
    select.innerHTML = '<option value="">Sélectionner...</option>';
    techniciens.forEach(t => {
      const option = document.createElement('option');
      option.value = t.id;
      option.textContent = `${t.prenom} ${t.nom}`;
      select.appendChild(option);
    });
  }
}

// Assigner une centrale individuellement
async function assignCentrale(centraleId) {
  const stId = document.getElementById(`st-${centraleId}`)?.value;
  const techId = document.getElementById(`tech-${centraleId}`)?.value;
  const date = document.getElementById(`date-${centraleId}`)?.value;
  
  if (!stId || !techId || !date) {
    alert('⚠️ Veuillez remplir sous-traitant, technicien et date');
    return;
  }
  
  try {
    showLoader();
    const response = await axios.put(`/api/centrales/${centraleId}/assign`, {
      sous_traitant_id: parseInt(stId),
      technicien_id: parseInt(techId),
      date_mission_prevue: date
    });
    
    if (response.data.success) {
      showSuccess('✅ Centrale assignée avec succès');
      await loadPlanningData(); // Reload data
    } else {
      showError(response.data.error);
    }
    hideLoader();
  } catch (error) {
    hideLoader();
    showError('Erreur assignation: ' + error.message);
  }
}

// Retirer assignation
async function unassignCentrale(centraleId) {
  if (!confirm('Confirmer le retrait de cette attribution ?')) return;
  
  try {
    showLoader();
    const response = await axios.delete(`/api/centrales/${centraleId}/unassign`);
    
    if (response.data.success) {
      showSuccess('✅ Attribution retirée');
      await loadPlanningData();
    } else {
      showError(response.data.error);
    }
    hideLoader();
  } catch (error) {
    hideLoader();
    showError('Erreur: ' + error.message);
  }
}

// Attribution automatique batch
async function autoAssignBatch() {
  const maxCentrales = parseInt(document.getElementById('max-centrales')?.value) || 25;
  const dateDebut = document.getElementById('date-debut-batch')?.value;
  const stToulouseId = document.getElementById('st-toulouse-batch')?.value;
  const stLyonId = document.getElementById('st-lyon-batch')?.value;
  const techId = document.getElementById('tech-batch')?.value;
  
  if (!dateDebut || !stToulouseId || !stLyonId || !techId) {
    alert('⚠️ Veuillez remplir tous les champs');
    return;
  }
  
  if (!confirm(`Assigner automatiquement ${maxCentrales} centrales à partir du ${dateDebut} ?`)) return;
  
  try {
    showLoader();
    const response = await axios.post('/api/planning/auto-assign', {
      max_centrales: maxCentrales,
      date_debut: dateDebut,
      sous_traitant_toulouse_id: parseInt(stToulouseId),
      sous_traitant_lyon_id: parseInt(stLyonId),
      technicien_id: parseInt(techId)
    });
    
    if (response.data.success) {
      showSuccess(`✅ ${response.data.data.assigned} centrales assignées automatiquement`);
      await loadPlanningData();
    } else {
      showError(response.data.error);
    }
    hideLoader();
  } catch (error) {
    hideLoader();
    showError('Erreur: ' + error.message);
  }
}

// Selection multiple
function toggleSelectAll(checked) {
  document.querySelectorAll('.centrale-checkbox:not([disabled])').forEach(cb => {
    cb.checked = checked;
    const centraleId = parseInt(cb.dataset.centraleId);
    if (checked) {
      selectedCentraleIds.add(centraleId);
    } else {
      selectedCentraleIds.delete(centraleId);
    }
  });
  updateSelectionCounter();
}

function toggleSelectCentrale(centraleId, checked) {
  if (checked) {
    selectedCentraleIds.add(centraleId);
  } else {
    selectedCentraleIds.delete(centraleId);
  }
  updateSelectionCounter();
}

function updateSelectionCounter() {
  const counter = document.getElementById('selection-counter');
  if (counter) {
    counter.textContent = `${selectedCentraleIds.size} sélectionnée(s)`;
  }
}

// Filtres
function filterPlanning() {
  const searchTerm = document.getElementById('search-input')?.value.toLowerCase() || '';
  const baseFilter = document.getElementById('base-filter')?.value || 'all';
  const statutFilter = document.getElementById('statut-filter')?.value || 'all';
  
  const filtered = allCentrales.filter(c => {
    const matchSearch = !searchTerm || 
      c.centrale_nom.toLowerCase().includes(searchTerm) ||
      c.localisation?.toLowerCase().includes(searchTerm) ||
      c.sous_traitant_nom?.toLowerCase().includes(searchTerm);
    
    const matchBase = baseFilter === 'all' || c.base_proche === baseFilter;
    
    const matchStatut = statutFilter === 'all' ||
      (statutFilter === 'assigned' && c.is_assigned) ||
      (statutFilter === 'unassigned' && !c.is_assigned) ||
      (statutFilter === 'planned' && c.is_planned);
    
    return matchSearch && matchBase && matchStatut;
  });
  
  renderPlanningTable(filtered);
}

// Utilitaires
function showLoader() {
  document.getElementById('loader')?.classList.add('active');
}

function hideLoader() {
  document.getElementById('loader')?.classList.remove('active');
}

function showError(message) {
  alert('❌ ' + message);
}

function showSuccess(message) {
  alert('✅ ' + message);
}

// Init au chargement
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', loadPlanningData);
} else {
  loadPlanningData();
}
