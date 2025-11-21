// planning-girasole.js - Interface Planning GIRASOLE 2025

let centralesData = [];
let selectedCentrales = new Set();

// Charger les centrales au démarrage
async function loadPlanningCentrales() {
  try {
    showLoader();
    const response = await axios.get('/api/planning/centrales');
    
    if (response.data.success) {
      centralesData = response.data.data;
      renderCentralesTable(centralesData);
      updateStats();
    } else {
      showError('Erreur chargement centrales: ' + response.data.error);
    }
  } catch (error) {
    showError('Erreur connexion API: ' + error.message);
  } finally {
    hideLoader();
  }
}

// Render tableau centrales
function renderCentralesTable(centrales) {
  const container = document.getElementById('centrales-table');
  
  if (!centrales || centrales.length === 0) {
    container.innerHTML = '<div class="text-center text-gray-500 py-8">Aucune centrale trouvée</div>';
    return;
  }
  
  const html = `
    <div class="overflow-x-auto">
      <table class="min-w-full bg-white border border-gray-200">
        <thead class="bg-blue-600 text-white">
          <tr>
            <th class="px-4 py-3 text-left">
              <input type="checkbox" id="select-all" onchange="toggleSelectAll(this.checked)" class="rounded">
            </th>
            <th class="px-4 py-3 text-left">#</th>
            <th class="px-4 py-3 text-left">Nom Centrale</th>
            <th class="px-4 py-3 text-left">Localisation</th>
            <th class="px-4 py-3 text-center">Puissance (kWc)</th>
            <th class="px-4 py-3 text-center">Type</th>
            <th class="px-4 py-3 text-center">Statut</th>
            <th class="px-4 py-3 text-center">Distance</th>
            <th class="px-4 py-3 text-center">Base</th>
          </tr>
        </thead>
        <tbody>
          ${centrales.map((centrale, idx) => `
            <tr class="border-b hover:bg-gray-50 transition ${idx % 2 === 0 ? 'bg-white' : 'bg-gray-50'}">
              <td class="px-4 py-3">
                <input type="checkbox" 
                       class="centrale-checkbox rounded" 
                       data-centrale-id="${centrale.id}"
                       onchange="toggleSelectCentrale(${centrale.id}, this.checked)">
              </td>
              <td class="px-4 py-3 font-semibold text-gray-700">${idx + 1}</td>
              <td class="px-4 py-3">
                <div class="font-semibold text-gray-900">${centrale.nom}</div>
                <div class="text-xs text-gray-500">ID: ${centrale.id}</div>
              </td>
              <td class="px-4 py-3 text-sm text-gray-600">${centrale.localisation || 'Non renseignée'}</td>
              <td class="px-4 py-3 text-center font-semibold text-blue-600">${centrale.puissance_kwc?.toFixed(2) || '0'}</td>
              <td class="px-4 py-3 text-center">
                <span class="px-2 py-1 text-xs font-semibold rounded ${centrale.type === 'SOL' ? 'bg-yellow-100 text-yellow-800' : 'bg-gray-100 text-gray-800'}">
                  ${centrale.type}
                </span>
              </td>
              <td class="px-4 py-3 text-center">
                <span class="px-2 py-1 text-xs font-semibold rounded ${getStatutColor(centrale.statut)}">
                  ${centrale.statut}
                </span>
              </td>
              <td class="px-4 py-3 text-center text-sm">${centrale.distance_km} km</td>
              <td class="px-4 py-3 text-center">
                <span class="px-2 py-1 text-xs font-semibold rounded ${centrale.base_proche === 'Toulouse' ? 'bg-blue-100 text-blue-800' : 'bg-red-100 text-red-800'}">
                  ${centrale.base_proche}
                </span>
              </td>
            </tr>
          `).join('')}
        </tbody>
      </table>
    </div>
  `;
  
  container.innerHTML = html;
}

// Couleur statut
function getStatutColor(statut) {
  const colors = {
    'A_AUDITER': 'bg-gray-100 text-gray-800',
    'EN_COURS': 'bg-yellow-100 text-yellow-800',
    'TERMINE': 'bg-purple-100 text-purple-800',
    'VALIDE': 'bg-green-100 text-green-800'
  };
  return colors[statut] || 'bg-gray-100 text-gray-800';
}

// Toggle sélection toutes centrales
function toggleSelectAll(checked) {
  document.querySelectorAll('.centrale-checkbox').forEach(cb => {
    cb.checked = checked;
    const centraleId = parseInt(cb.dataset.centraleId);
    if (checked) {
      selectedCentrales.add(centraleId);
    } else {
      selectedCentrales.delete(centraleId);
    }
  });
  updateSelectionCount();
}

// Toggle sélection une centrale
function toggleSelectCentrale(centraleId, checked) {
  if (checked) {
    selectedCentrales.add(centraleId);
  } else {
    selectedCentrales.delete(centraleId);
  }
  updateSelectionCount();
}

// Mettre à jour compteur sélection
function updateSelectionCount() {
  const count = selectedCentrales.size;
  const counter = document.getElementById('selection-counter');
  if (counter) {
    counter.textContent = `${count} sélectionnée${count > 1 ? 's' : ''}`;
  }
  
  // Activer/désactiver bouton export batch
  const exportBtn = document.getElementById('export-batch-btn');
  if (exportBtn) {
    exportBtn.disabled = count === 0;
    exportBtn.classList.toggle('opacity-50', count === 0);
    exportBtn.classList.toggle('cursor-not-allowed', count === 0);
  }
}

// Mettre à jour statistiques
function updateStats() {
  const total = centralesData.length;
  const puissanceTotale = centralesData.reduce((sum, c) => sum + (c.puissance_kwc || 0), 0);
  const distanceMoyenne = centralesData.reduce((sum, c) => sum + (c.distance_km || 0), 0) / total;
  
  document.getElementById('stat-total').textContent = total;
  document.getElementById('stat-puissance').textContent = puissanceTotale.toFixed(2) + ' kWc';
  document.getElementById('stat-distance').textContent = distanceMoyenne.toFixed(1) + ' km';
  
  const toulouse = centralesData.filter(c => c.base_proche === 'Toulouse').length;
  const lyon = centralesData.filter(c => c.base_proche === 'Lyon').length;
  document.getElementById('stat-toulouse').textContent = toulouse;
  document.getElementById('stat-lyon').textContent = lyon;
}

// Export batch ordres de mission
async function exportBatchMissions() {
  if (selectedCentrales.size === 0) {
    alert('⚠️ Veuillez sélectionner au moins une centrale');
    return;
  }
  
  const technicienId = document.getElementById('technicien-select')?.value;
  const sousTraitantId = document.getElementById('sous-traitant-select')?.value;
  const dateDebut = document.getElementById('date-debut')?.value;
  
  if (!technicienId || !sousTraitantId || !dateDebut) {
    alert('⚠️ Veuillez renseigner technicien, sous-traitant et date de début');
    return;
  }
  
  if (!confirm(`Créer ${selectedCentrales.size} ordres de mission à partir du ${dateDebut} ?`)) {
    return;
  }
  
  try {
    showLoader();
    
    const response = await axios.post('/api/planning/export-batch-missions', {
      centrale_ids: Array.from(selectedCentrales),
      technicien_id: parseInt(technicienId),
      sous_traitant_id: parseInt(sousTraitantId),
      date_debut: dateDebut
    });
    
    if (response.data.success) {
      const { created, errors } = response.data.data;
      alert(`✅ Succès !\n\n${created} ordres de mission créés\n${errors} erreurs`);
      
      // Recharger les centrales
      await loadPlanningCentrales();
      
      // Réinitialiser sélection
      selectedCentrales.clear();
      document.querySelectorAll('.centrale-checkbox').forEach(cb => cb.checked = false);
      updateSelectionCount();
    } else {
      alert('❌ Erreur: ' + response.data.error);
    }
  } catch (error) {
    alert('❌ Erreur: ' + error.message);
  } finally {
    hideLoader();
  }
}

// Filtrer centrales
function filterCentrales() {
  const searchTerm = document.getElementById('search-input')?.value.toLowerCase() || '';
  const baseFilter = document.getElementById('base-filter')?.value || 'all';
  const statutFilter = document.getElementById('statut-filter')?.value || 'all';
  
  const filtered = centralesData.filter(centrale => {
    const matchSearch = !searchTerm || 
      centrale.nom.toLowerCase().includes(searchTerm) ||
      centrale.localisation?.toLowerCase().includes(searchTerm);
    
    const matchBase = baseFilter === 'all' || centrale.base_proche === baseFilter;
    const matchStatut = statutFilter === 'all' || centrale.statut === statutFilter;
    
    return matchSearch && matchBase && matchStatut;
  });
  
  renderCentralesTable(filtered);
}

// Tri centrales
function sortCentrales(column) {
  centralesData.sort((a, b) => {
    if (column === 'distance') {
      return (a.distance_km || 0) - (b.distance_km || 0);
    } else if (column === 'puissance') {
      return (b.puissance_kwc || 0) - (a.puissance_kwc || 0);
    } else if (column === 'nom') {
      return a.nom.localeCompare(b.nom);
    }
    return 0;
  });
  
  renderCentralesTable(centralesData);
}

// Utilitaires
function showLoader() {
  document.getElementById('loader')?.classList.remove('hidden');
}

function hideLoader() {
  document.getElementById('loader')?.classList.add('hidden');
}

function showError(message) {
  alert('❌ ' + message);
}

// Charger techniciens et sous-traitants pour le formulaire batch
async function loadFormOptions() {
  try {
    // Charger sous-traitants
    const stResponse = await axios.get('/api/sous-traitants');
    if (stResponse.data.success) {
      const select = document.getElementById('sous-traitant-select');
      if (select) {
        select.innerHTML = '<option value="">Sélectionner...</option>' +
          stResponse.data.data.map(st => `<option value="${st.id}">${st.nom_entreprise}</option>`).join('');
      }
    }
    
    // Charger techniciens
    const techResponse = await axios.get('/api/techniciens');
    if (techResponse.data.success) {
      const select = document.getElementById('technicien-select');
      if (select) {
        select.innerHTML = '<option value="">Sélectionner...</option>' +
          techResponse.data.data.map(t => `<option value="${t.id}">${t.prenom} ${t.nom} (${t.nom_entreprise})</option>`).join('');
      }
    }
  } catch (error) {
    console.error('Erreur chargement options:', error);
  }
}

// Init au chargement page
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', () => {
    loadPlanningCentrales();
    loadFormOptions();
  });
} else {
  loadPlanningCentrales();
  loadFormOptions();
}
