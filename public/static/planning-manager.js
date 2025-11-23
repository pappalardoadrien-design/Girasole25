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
  document.getElementById('stat-planned').textContent = `${stats.planned || 0} (${stats.with_checklist || 0} ✓)`;
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
          <th class="px-3 py-2 text-center">Checklist</th>
          <th class="px-3 py-2 text-center">Statut</th>
          <th class="px-3 py-2 text-center">Actions</th>
        </tr>
      </thead>
      <tbody>
        ${centrales.map((c, idx) => `
          <tr class="table-row hover:bg-gray-50 ${c.is_assigned ? 'bg-green-50' : ''}" data-centrale-id="${c.id}">
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
              <div class="text-xs text-gray-500">${c.dept || 'N/A'} - ${c.localisation?.substring(0, 40) || 'Pas d\'adresse'}...</div>
            </td>
            <td class="px-3 py-2 text-center text-sm">${c.puissance_kwc?.toFixed(1) || 0}</td>
            <td class="px-3 py-2 text-center text-sm font-mono">${c.distance_km < 999999 ? c.distance_km.toFixed(1) : '-'} km</td>
            <td class="px-3 py-2 text-center">
              <span class="px-2 py-1 text-xs rounded ${c.base_proche === 'Toulouse' ? 'bg-blue-100 text-blue-800' : c.base_proche === 'Lyon' ? 'bg-red-100 text-red-800' : 'bg-gray-100 text-gray-800'}">
                ${c.base_proche || 'N/A'}
              </span>
            </td>
            <td class="px-3 py-2 text-sm">
              ${c.is_assigned ? 
                `<div class="font-medium text-green-700">${c.sous_traitant_nom || 'N/A'}</div>` :
                `<select class="text-xs border rounded px-1 py-1 w-full" id="st-${c.id}" onchange="saveInlineChange(${c.id})">
                  <option value="">Choisir...</option>
                </select>`
              }
            </td>
            <td class="px-3 py-2 text-sm">
              ${c.is_assigned ?
                `<div class="text-gray-600">${c.technicien_nom || 'N/A'}</div>` :
                `<select class="text-xs border rounded px-1 py-1 w-full" id="tech-${c.id}" onchange="saveInlineChange(${c.id})">
                  <option value="">Choisir...</option>
                </select>`
              }
            </td>
            <td class="px-3 py-2 text-center text-sm">
              ${c.is_planned ?
                `<span class="font-mono text-green-700">${c.date_mission}</span>` :
                `<input type="date" id="date-${c.id}" class="text-xs border rounded px-1 py-1" onchange="saveInlineChange(${c.id})" />`
              }
            </td>
            <td class="px-3 py-2 text-center">
              ${getChecklistBadge(c.checklist_status, c.checklist_count)}
            </td>
            <td class="px-3 py-2 text-center">
              ${getStatutBadge(c.centrale_statut, c.mission_statut)}
            </td>
            <td class="px-3 py-2 text-center">
              ${c.is_assigned ?
                `<button onclick="unassignCentrale(${c.id})" class="text-red-600 hover:text-red-800 text-xs px-2 py-1">
                  <i class="fas fa-times-circle"></i> Retirer
                </button>` :
                `<button onclick="assignCentrale(${c.id})" class="text-green-600 hover:text-green-800 text-xs px-2 py-1">
                  <i class="fas fa-check-circle"></i> Sauvegarder
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

function getChecklistBadge(checklistStatus, count) {
  if (checklistStatus === 'PRET') {
    return `<span class="px-2 py-1 text-xs rounded bg-green-100 text-green-800 font-semibold">
      <i class="fas fa-check-circle"></i> 54/54
    </span>`;
  } else if (checklistStatus === 'PARTIEL') {
    return `<span class="px-2 py-1 text-xs rounded bg-yellow-100 text-yellow-800">
      <i class="fas fa-clock"></i> ${count}/54
    </span>`;
  } else {
    return `<span class="px-2 py-1 text-xs rounded bg-gray-100 text-gray-600">
      <i class="fas fa-minus-circle"></i> Non init
    </span>`;
  }
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

// Assigner une centrale individuellement (ou sauvegarder modification inline)
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
    const response = await axios.post('/api/planning/save-attribution', {
      centrale_id: centraleId,
      sous_traitant_id: parseInt(stId),
      technicien_id: parseInt(techId),
      date_mission: date
    });
    
    if (response.data.success) {
      showSuccess('✅ Attribution sauvegardée');
      await loadPlanningData(); // Reload data
    } else {
      showError(response.data.error);
    }
    hideLoader();
  } catch (error) {
    hideLoader();
    showError('Erreur sauvegarde: ' + error.message);
  }
}

// Sauvegarder modification inline (déclenchée par onchange)
async function saveInlineChange(centraleId) {
  const stId = document.getElementById(`st-${centraleId}`)?.value;
  const techId = document.getElementById(`tech-${centraleId}`)?.value;
  const date = document.getElementById(`date-${centraleId}`)?.value;
  
  // Ne sauvegarder que si tous les champs sont remplis
  if (!stId || !techId || !date) return;
  
  try {
    const response = await axios.post('/api/planning/save-attribution', {
      centrale_id: centraleId,
      sous_traitant_id: parseInt(stId),
      technicien_id: parseInt(techId),
      date_mission: date
    });
    
    if (response.data.success) {
      // Visual feedback discret
      const row = document.querySelector(`tr[data-centrale-id="${centraleId}"]`);
      if (row) {
        row.classList.add('bg-green-50');
        setTimeout(() => {
          row.classList.remove('bg-green-50');
          // Recharger les données pour afficher le statut checklist
          loadPlanningData();
        }, 800);
      }
      
      // Message de confirmation avec checklist
      if (response.data.checklist_initialized) {
        showSuccess('✅ Sauvegardé + Checklist 54 points créée !');
      }
    }
  } catch (error) {
    console.error('Erreur sauvegarde inline:', error);
  }
}

// Générer tous les ordres de mission depuis les attributions
async function generateAllMissions() {
  if (!confirm('Générer les ordres de mission pour toutes les centrales attribuées ?\n\nCette action va créer/confirmer les missions planifiées.')) {
    return;
  }
  
  try {
    showLoader();
    const response = await axios.post('/api/planning/generate-all-missions');
    
    if (response.data.success) {
      const data = response.data.data;
      let message = `✅ Ordres de mission générés !\n\n`;
      message += `📊 Total traités : ${data.total_traites}\n`;
      message += `✨ Créés : ${data.created}\n`;
      message += `🔄 Mis à jour : ${data.updated}\n`;
      if (data.errors > 0) {
        message += `❌ Erreurs : ${data.errors}`;
      }
      
      alert(message);
      await loadPlanningData();
    } else {
      showError(response.data.error);
    }
    hideLoader();
  } catch (error) {
    hideLoader();
    showError('Erreur génération : ' + error.message);
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

// Exporter planning au format Excel/CSV
async function exportPlanningExcel() {
  try {
    showLoader();
    const response = await axios.get('/api/planning/export-data');
    
    if (!response.data.success) {
      showError('Erreur export: ' + response.data.error);
      hideLoader();
      return;
    }
    
    // Générer CSV à partir des données
    const data = response.data.data;
    let csv = 'ID,ID_REF,Centrale,Type,Puissance (kWc),Localisation,Département,Distance (km),Base proche,Statut centrale,Date mission,Heure début,Durée (h),Statut mission,Sous-traitant,Contact ST,Technicien,Tél technicien\n';
    
    data.forEach(row => {
      csv += [
        row.id || '',
        row.id_ref || '',
        `"${(row.centrale_nom || '').replace(/"/g, '""')}"`,
        row.type || '',
        row.puissance_kwc || '',
        `"${(row.localisation || '').replace(/"/g, '""')}"`,
        row.dept || '',
        row.distance_km < 999999 ? row.distance_km.toFixed(1) : '',
        row.base_proche || '',
        row.centrale_statut || '',
        row.date_mission || '',
        row.heure_debut || '',
        row.duree_estimee_heures || '',
        row.mission_statut || '',
        `"${(row.sous_traitant_nom || '').replace(/"/g, '""')}"`,
        `"${(row.sous_traitant_contact || '').replace(/"/g, '""')}"`,
        `"${(row.technicien_nom || '').replace(/"/g, '""')}"`,
        `"${(row.technicien_tel || '').replace(/"/g, '""')}"`
      ].join(',') + '\n';
    });
    
    // Télécharger fichier
    const blob = new Blob(['\uFEFF' + csv], { type: 'text/csv;charset=utf-8;' });
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = `planning_girasole_${new Date().toISOString().split('T')[0]}.csv`;
    link.click();
    
    hideLoader();
    showSuccess('Export réussi ! Fichier téléchargé');
  } catch (error) {
    hideLoader();
    showError('Erreur export: ' + error.message);
  }
}

// Export ANNEXE 1 enrichie avec planning
async function exportAnnexe1Enrichie() {
  try {
    showLoader();
    
    const response = await axios.get('/api/planning/export-annexe1');
    
    if (!response.data.success) {
      throw new Error(response.data.error);
    }
    
    const data = response.data.data;
    
    // Construire CSV avec TOUTES les colonnes
    let csv = '';
    
    // Headers ANNEXE 1 + Planning
    csv += 'ID,Centrale,Type,Puissance (kWc),Localisation,Département,';
    csv += 'Latitude,Longitude,Distance Toulouse (km),Distance Lyon (km),Distance (km),Base Proche,';
    csv += 'Date Audit,Heure Début,Durée (h),Sous-Traitant,Contact ST,Tél ST,';
    csv += 'Technicien,Tél Technicien,Email Technicien,Statut Mission,Checklist,Statut Centrale\n';
    
    // Données
    data.forEach(row => {
      const line = [
        row.id_ref,
        `"${row.centrale}"`,
        row.type,
        row.puissance_kwc,
        `"${row.localisation}"`,
        row.departement,
        row.latitude,
        row.longitude,
        row.distance_toulouse_km,
        row.distance_lyon_km,
        row.distance_km,
        row.base_proche,
        row.date_audit,
        row.heure_debut,
        row.duree_heures,
        `"${row.sous_traitant}"`,
        `"${row.contact_st}"`,
        row.tel_st,
        `"${row.technicien}"`,
        row.tel_technicien,
        `"${row.email_technicien}"`,
        row.statut_mission,
        `"${row.checklist}"`,
        row.statut_centrale
      ];
      csv += line.join(',') + '\n';
    });
    
    // BOM UTF-8 pour Excel
    const blob = new Blob(['\uFEFF' + csv], { type: 'text/csv;charset=utf-8;' });
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    
    const today = new Date().toISOString().split('T')[0];
    link.download = `ANNEXE_1_ENRICHIE_GIRASOLE_${today}.csv`;
    
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    
    hideLoader();
    
    // Afficher stats
    const stats = response.data.stats;
    alert(`✅ ANNEXE 1 Enrichie exportée !\n\n` +
          `📊 Total : ${stats.total} centrales\n` +
          `📅 Planifiées : ${stats.planifiees}\n` +
          `✓ Avec checklist : ${stats.avec_checklist}\n\n` +
          `📁 Fichier : ANNEXE_1_ENRICHIE_GIRASOLE_${today}.csv`);
    
  } catch (error) {
    hideLoader();
    showError('Erreur export ANNEXE 1: ' + error.message);
  }
}

// Init au chargement
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', loadPlanningData);
} else {
  loadPlanningData();
}
