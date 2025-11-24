// ======================
// GLOBAL STATE
// ======================
let centralesData = [];
let statsData = {};
let chartStatut = null;
let chartType = null;

// ======================
// TAB NAVIGATION
// ======================
// Note: showTab() est maintenant définie dans index.tsx (page principale)
// Cette fonction est supprimée pour éviter les conflits

// ======================
// DASHBOARD
// ======================
async function loadDashboard() {
  try {
    // Charger statistiques
    const response = await axios.get('/api/stats');
    if (!response.data.success) {
      throw new Error(response.data.error);
    }
    
    statsData = response.data.data;
    
    // Mettre à jour les cards
    document.getElementById('stat-total').textContent = statsData.global.total_centrales || 52;
    document.getElementById('stat-auditees').textContent = statsData.global.auditees || 0;
    document.getElementById('stat-validees').textContent = statsData.global.validees || 0;
    document.getElementById('stat-photos').textContent = statsData.missions?.total_missions || 0;
    
    // Volumétrie missions (remplace volumétrie photos)
    const missionsTotal = statsData.missions?.total_missions || 0;
    const missionsPlanifiees = statsData.missions?.planifiees || 0;
    document.getElementById('vol-json').textContent = `${missionsTotal} missions`;
    document.getElementById('vol-photos').textContent = `${missionsPlanifiees} planifiées`;
    
    // Créer graphiques
    createChartStatut();
    createChartType();
    
  } catch (error) {
    console.error('Erreur chargement dashboard:', error);
    alert('Erreur lors du chargement du dashboard');
  }
}

function createChartStatut() {
  const ctx = document.getElementById('chartStatut');
  
  if (chartStatut) {
    chartStatut.destroy();
  }
  
  const labels = statsData.par_statut.map(s => {
    const labelMap = {
      'A_AUDITER': 'À Auditer',
      'EN_COURS': 'En Cours',
      'TERMINE': 'Terminé',
      'VALIDE': 'Validé'
    };
    return labelMap[s.statut] || s.statut;
  });
  
  const data = statsData.par_statut.map(s => s.count);
  
  const colors = ['#94a3b8', '#fbbf24', '#34d399', '#a78bfa'];
  
  chartStatut = new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: labels,
      datasets: [{
        data: data,
        backgroundColor: colors,
        borderWidth: 2,
        borderColor: '#ffffff'
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: true,
      plugins: {
        legend: {
          position: 'bottom'
        }
      }
    }
  });
}

function createChartType() {
  const ctx = document.getElementById('chartType');
  
  if (chartType) {
    chartType.destroy();
  }
  
  const labels = statsData.par_type.map(t => `${t.type} (${t.count})`);
  const data = statsData.par_type.map(t => t.count);
  const validesData = statsData.par_type.map(t => t.valides);
  
  chartType = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: labels,
      datasets: [
        {
          label: 'Total',
          data: data,
          backgroundColor: '#3b82f6'
        },
        {
          label: 'Validés',
          data: validesData,
          backgroundColor: '#10b981'
        }
      ]
    },
    options: {
      responsive: true,
      maintainAspectRatio: true,
      scales: {
        y: {
          beginAtZero: true,
          ticks: {
            stepSize: 5
          }
        }
      },
      plugins: {
        legend: {
          position: 'bottom'
        }
      }
    }
  });
}

// ======================
// CENTRALES LIST
// ======================
async function loadCentrales() {
  try {
    const response = await axios.get('/api/centrales');
    if (!response.data.success) {
      throw new Error(response.data.error);
    }
    
    centralesData = response.data.data;
    
    // Appliquer filtres et recherche
    const filterType = document.getElementById('filter-type').value;
    const filterStatut = document.getElementById('filter-statut').value;
    const searchQuery = document.getElementById('search-centrales')?.value.toLowerCase() || '';
    
    let filtered = centralesData;
    
    // Filtre par type
    if (filterType) {
      filtered = filtered.filter(c => c.type === filterType);
    }
    
    // Filtre par statut
    if (filterStatut) {
      filtered = filtered.filter(c => c.statut === filterStatut);
    }
    
    // Recherche par nom ou localisation
    if (searchQuery) {
      filtered = filtered.filter(c => 
        c.nom.toLowerCase().includes(searchQuery) || 
        (c.localisation && c.localisation.toLowerCase().includes(searchQuery))
      );
    }
    
    // Tri (par défaut par nom)
    const sortBy = document.getElementById('sort-by')?.value || 'nom';
    filtered.sort((a, b) => {
      if (sortBy === 'nom') return a.nom.localeCompare(b.nom);
      if (sortBy === 'date_audit') return (b.date_audit || '') > (a.date_audit || '') ? 1 : -1;
      if (sortBy === 'nb_retours') return (b.nb_retours || 0) - (a.nb_retours || 0);
      return 0;
    })
    
    // Afficher liste
    const container = document.getElementById('centrales-list');
    
    if (filtered.length === 0) {
      container.innerHTML = '<p class="text-center text-gray-500">Aucune centrale trouvée</p>';
      return;
    }
    
    // Mettre à jour le compteur
    document.getElementById('centrales-count').textContent = 
      `${filtered.length} centrale${filtered.length > 1 ? 's' : ''} affichée${filtered.length > 1 ? 's' : ''}`;
    
    const html = `
      <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nom</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Type</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Statut</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Localisation</th>
              <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Retours</th>
              <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Photos</th>
              <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
            ${filtered.map(c => `
              <tr class="hover:bg-gray-50 transition-colors duration-150">
                <td class="px-6 py-4 whitespace-nowrap">
                  <div class="flex items-center">
                    <i class="fas fa-solar-panel text-yellow-500 mr-2"></i>
                    <span class="font-medium text-gray-900">${c.nom}</span>
                  </div>
                </td>
                <td class="px-6 py-4 whitespace-nowrap">
                  <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ${c.type === 'SOL' ? 'bg-blue-100 text-blue-800' : 'bg-green-100 text-green-800'}">
                    ${c.type === 'SOL' ? '☀️' : '🏠'} ${c.type}
                  </span>
                </td>
                <td class="px-6 py-4 whitespace-nowrap">
                  <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ${getStatutColor(c.statut)}">
                    ${getStatutLabel(c.statut)}
                  </span>
                </td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                  ${c.localisation || '-'}
                </td>
                <td class="px-6 py-4 whitespace-nowrap text-center">
                  <span class="inline-flex items-center justify-center w-8 h-8 rounded-full ${(c.nb_retours || 0) > 0 ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-400'}">
                    ${c.nb_retours || 0}
                  </span>
                </td>
                <td class="px-6 py-4 whitespace-nowrap text-center">
                  <span class="inline-flex items-center text-sm ${(c.total_photos || 0) > 0 ? 'text-blue-600 font-medium' : 'text-gray-400'}">
                    <i class="fas fa-camera mr-1"></i>
                    ${c.total_photos || 0}
                  </span>
                </td>
                <td class="px-6 py-4 whitespace-nowrap text-center">
                  <div class="flex items-center justify-center space-x-2">
                    <a href="/audit/${c.id}" target="_blank" 
                       class="text-blue-600 hover:text-blue-800 transition-colors" 
                       title="Checklist Audit">
                      <i class="fas fa-clipboard-check text-lg"></i>
                    </a>
                    <a href="/photos-audit/${c.id}" target="_blank" 
                       class="text-purple-600 hover:text-purple-800 transition-colors" 
                       title="Photos (${c.total_photos || 0})">
                      <i class="fas fa-images text-lg"></i>
                    </a>
                    <button onclick="changeCentraleStatut(${c.id}, '${c.statut}')" 
                            class="text-orange-600 hover:text-orange-800 transition-colors" 
                            title="Modifier statut">
                      <i class="fas fa-edit text-lg"></i>
                    </button>
                    <button onclick="viewCentraleDetail(${c.id})" 
                            class="text-green-600 hover:text-green-800 transition-colors" 
                            title="Voir détails">
                      <i class="fas fa-eye text-lg"></i>
                    </button>
                  </div>
                </td>
              </tr>
            `).join('')}
          </tbody>
        </table>
      </div>
      
      ${filtered.length === 0 ? `
        <div class="text-center py-12">
          <i class="fas fa-search text-gray-300 text-6xl mb-4"></i>
          <p class="text-gray-500 text-lg">Aucune centrale trouvée</p>
          <p class="text-gray-400 text-sm mt-2">Essayez de modifier vos filtres ou votre recherche</p>
        </div>
      ` : ''}
    `;
    
    container.innerHTML = html;
    
  } catch (error) {
    console.error('Erreur chargement centrales:', error);
    document.getElementById('centrales-list').innerHTML = '<p class="text-center text-red-500">Erreur de chargement</p>';
  }
}

function getStatutColor(statut) {
  const colors = {
    'A_AUDITER': 'bg-gray-100 text-gray-800',
    'EN_COURS': 'bg-yellow-100 text-yellow-800',
    'TERMINE': 'bg-green-100 text-green-800',
    'VALIDE': 'bg-purple-100 text-purple-800'
  };
  return colors[statut] || 'bg-gray-100 text-gray-800';
}

function getStatutLabel(statut) {
  const labels = {
    'A_AUDITER': 'À Auditer',
    'EN_COURS': 'En Cours',
    'TERMINE': 'Terminé',
    'VALIDE': 'Validé'
  };
  return labels[statut] || statut;
}

async function changeCentraleStatut(id, currentStatut) {
  const statuts = ['A_AUDITER', 'EN_COURS', 'TERMINE', 'VALIDE'];
  const labels = ['À Auditer', 'En Cours', 'Terminé', 'Validé'];
  
  const options = statuts.map((s, i) => 
    `<option value="${s}" ${s === currentStatut ? 'selected' : ''}>${labels[i]}</option>`
  ).join('');
  
  const newStatut = prompt(`Changer le statut de la centrale ${id}:\n\nChoisissez:\n0 = À Auditer\n1 = En Cours\n2 = Terminé\n3 = Validé\n\nEntrez le numéro (0-3):`);
  
  if (newStatut === null) return;
  
  const index = parseInt(newStatut);
  if (isNaN(index) || index < 0 || index > 3) {
    alert('Choix invalide');
    return;
  }
  
  const selectedStatut = statuts[index];
  
  try {
    const response = await axios.put(`/api/centrales/${id}/statut`, {
      statut: selectedStatut
    });
    
    if (!response.data.success) {
      throw new Error(response.data.error);
    }
    
    alert('Statut mis à jour avec succès');
    loadCentrales();
    
  } catch (error) {
    console.error('Erreur mise à jour statut:', error);
    alert('Erreur lors de la mise à jour du statut');
  }
}

async function viewCentraleDetail(id) {
  try {
    const response = await axios.get(`/api/centrales/${id}`);
    if (!response.data.success) {
      throw new Error(response.data.error);
    }
    
    const { centrale, retours } = response.data.data;
    
    const retoursHtml = retours.length > 0 
      ? retours.map(r => `
          <div class="border-l-4 border-blue-500 pl-4 mb-3">
            <p class="font-medium">${r.nom_fichier}</p>
            <p class="text-sm text-gray-600">Technicien: ${r.technicien} | ${r.nombre_photos} photos | ${r.taille_mo} MB</p>
            <p class="text-sm text-gray-500">${new Date(r.date_upload).toLocaleString('fr-FR')}</p>
          </div>
        `).join('')
      : '<p class="text-gray-500">Aucun retour JSON enregistré</p>';
    
    alert(`CENTRALE: ${centrale.nom}\n\nType: ${centrale.type}\nStatut: ${getStatutLabel(centrale.statut)}\nPuissance: ${centrale.puissance_kwc || '-'} kWc\nLocalisation: ${centrale.localisation || '-'}\n\nRetours: ${retours.length}`);
    
  } catch (error) {
    console.error('Erreur détail centrale:', error);
    alert('Erreur lors du chargement des détails');
  }
}

// ======================
// UPLOAD FORM
// ======================
async function loadUploadForm() {
  try {
    // Charger liste centrales pour select
    const response = await axios.get('/api/centrales');
    if (!response.data.success) {
      throw new Error(response.data.error);
    }
    
    const centrales = response.data.data;
    const select = document.getElementById('upload-centrale');
    
    select.innerHTML = '<option value="">Sélectionner une centrale...</option>' +
      centrales
        .filter(c => c.statut !== 'VALIDE')
        .map(c => `<option value="${c.id}">${c.nom} (${c.type})</option>`)
        .join('');
    
  } catch (error) {
    console.error('Erreur chargement form upload:', error);
  }
}

// ======================
// ANALYTICS
// ======================
let chartCompletion = null;

async function loadAnalytics() {
  try {
    const response = await axios.get('/api/stats');
    if (!response.data.success) {
      throw new Error(response.data.error);
    }
    
    const data = response.data.data;
    const centralesResponse = await axios.get('/api/centrales');
    const centrales = centralesResponse.data.data;
    
    // Progression mission
    const auditees = data.global.auditees || 0;
    const total = data.global.total_centrales || 52;
    const progressPercent = ((auditees / total) * 100).toFixed(1);
    
    document.getElementById('analytics-progress-percent').textContent = `${progressPercent}%`;
    document.getElementById('analytics-progress-bar').style.width = `${progressPercent}%`;
    document.getElementById('analytics-remaining').textContent = total - auditees;
    
    // Temps restant estimé (6h30 SOL, 8h10 TOITURE)
    const remaining = centrales.filter(c => c.statut === 'A_AUDITER');
    const solRemaining = remaining.filter(c => c.type === 'SOL').length;
    const toitRemaining = remaining.filter(c => c.type === 'TOITURE').length;
    const heuresRestantes = (solRemaining * 6.5 + toitRemaining * 8.17).toFixed(0);
    document.getElementById('analytics-time-remaining').textContent = `${heuresRestantes}h`;
    
    // KPI
    const totalPhotos = data.volumetrie.total_photos || 0;
    const avgPhotos = auditees > 0 ? Math.round(totalPhotos / auditees) : 0;
    document.getElementById('analytics-avg-photos').textContent = avgPhotos;
    
    const volumeJSON = (data.volumetrie.total_json_mb || 0) / 1024;
    const volumePhotos = totalPhotos * 3.5 / 1024; // Estimation 3.5 MB/photo
    const volumeTotal = (volumeJSON + volumePhotos).toFixed(1);
    document.getElementById('analytics-volume-total').textContent = `${volumeTotal} GB`;
    
    const validationRate = total > 0 ? ((data.global.validees / total) * 100).toFixed(1) : 0;
    document.getElementById('analytics-validation-rate').textContent = `${validationRate}%`;
    
    // Détails par type et statut
    const solCentrales = centrales.filter(c => c.type === 'SOL');
    const toitureCentrales = centrales.filter(c => c.type === 'TOITURE');
    
    document.getElementById('sol-a-auditer').textContent = solCentrales.filter(c => c.statut === 'A_AUDITER').length;
    document.getElementById('sol-en-cours').textContent = solCentrales.filter(c => c.statut === 'EN_COURS').length;
    document.getElementById('sol-termine').textContent = solCentrales.filter(c => c.statut === 'TERMINE').length;
    document.getElementById('sol-valide').textContent = solCentrales.filter(c => c.statut === 'VALIDE').length;
    
    document.getElementById('toiture-a-auditer').textContent = toitureCentrales.filter(c => c.statut === 'A_AUDITER').length;
    document.getElementById('toiture-en-cours').textContent = toitureCentrales.filter(c => c.statut === 'EN_COURS').length;
    document.getElementById('toiture-termine').textContent = toitureCentrales.filter(c => c.statut === 'TERMINE').length;
    document.getElementById('toiture-valide').textContent = toitureCentrales.filter(c => c.statut === 'VALIDE').length;
    
    // Chart completion
    createChartCompletion(data, centrales);
    
  } catch (error) {
    console.error('Erreur chargement analytics:', error);
  }
}

function createChartCompletion(statsData, centrales) {
  const ctx = document.getElementById('chartCompletion');
  
  if (chartCompletion) {
    chartCompletion.destroy();
  }
  
  const total = centrales.length;
  const aAuditer = centrales.filter(c => c.statut === 'A_AUDITER').length;
  const enCours = centrales.filter(c => c.statut === 'EN_COURS').length;
  const termine = centrales.filter(c => c.statut === 'TERMINE').length;
  const valide = centrales.filter(c => c.statut === 'VALIDE').length;
  
  chartCompletion = new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: ['À Auditer', 'En Cours', 'Terminé', 'Validé'],
      datasets: [{
        data: [aAuditer, enCours, termine, valide],
        backgroundColor: ['#94a3b8', '#fbbf24', '#34d399', '#a78bfa'],
        borderWidth: 3,
        borderColor: '#ffffff'
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: true,
      plugins: {
        legend: {
          position: 'bottom'
        },
        tooltip: {
          callbacks: {
            label: function(context) {
              const label = context.label || '';
              const value = context.parsed || 0;
              const percent = ((value / total) * 100).toFixed(1);
              return `${label}: ${value} (${percent}%)`;
            }
          }
        }
      }
    }
  });
}

// ======================
// EXPORT FUNCTIONS
// ======================
async function exportToCSV() {
  try {
    const response = await axios.get('/api/centrales');
    if (!response.data.success) throw new Error(response.data.error);
    
    const centrales = response.data.data;
    
    // Créer CSV
    let csv = 'Nom,Type,Statut,Localisation,Puissance (kWc),Nb Retours,Total Photos\n';
    centrales.forEach(c => {
      csv += `${c.nom},${c.type},${c.statut},${c.localisation || '-'},${c.puissance_kwc || 0},${c.nb_retours || 0},${c.total_photos || 0}\n`;
    });
    
    // Télécharger
    const blob = new Blob([csv], { type: 'text/csv' });
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `girasole_centrales_${new Date().toISOString().split('T')[0]}.csv`;
    a.click();
    window.URL.revokeObjectURL(url);
    
    alert('✅ Export CSV réussi !');
  } catch (error) {
    console.error('Erreur export CSV:', error);
    alert('❌ Erreur lors de l\'export CSV');
  }
}

async function exportToJSON() {
  try {
    const response = await axios.get('/api/centrales');
    if (!response.data.success) throw new Error(response.data.error);
    
    const statsResponse = await axios.get('/api/stats');
    
    const exportData = {
      date_export: new Date().toISOString(),
      mission: 'GIRASOLE 2025',
      centrales: response.data.data,
      statistiques: statsResponse.data.data
    };
    
    const json = JSON.stringify(exportData, null, 2);
    const blob = new Blob([json], { type: 'application/json' });
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `girasole_export_${new Date().toISOString().split('T')[0]}.json`;
    a.click();
    window.URL.revokeObjectURL(url);
    
    alert('✅ Export JSON réussi !');
  } catch (error) {
    console.error('Erreur export JSON:', error);
    alert('❌ Erreur lors de l\'export JSON');
  }
}

function printReport() {
  window.print();
}

// Upload form submit
document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('form-upload');
  if (form) {
    form.addEventListener('submit', async (e) => {
      e.preventDefault();
      
      const formData = {
        centrale_id: document.getElementById('upload-centrale').value,
        nom_fichier: document.getElementById('upload-fichier').value,
        taille_mo: parseFloat(document.getElementById('upload-taille').value),
        nombre_photos: parseInt(document.getElementById('upload-photos').value),
        technicien: document.getElementById('upload-technicien').value
      };
      
      try {
        const response = await axios.post('/api/retours', formData);
        
        if (!response.data.success) {
          throw new Error(response.data.error);
        }
        
        // Afficher succès
        const resultDiv = document.getElementById('upload-result');
        resultDiv.className = 'p-4 bg-green-100 border border-green-400 text-green-700 rounded';
        resultDiv.innerHTML = `
          <i class="fas fa-check-circle mr-2"></i>
          <strong>Succès!</strong> Retour JSON enregistré avec succès.
        `;
        resultDiv.classList.remove('hidden');
        
        // Reset form
        form.reset();
        
        // Cacher message après 5s
        setTimeout(() => {
          resultDiv.classList.add('hidden');
        }, 5000);
        
      } catch (error) {
        console.error('Erreur upload:', error);
        
        const resultDiv = document.getElementById('upload-result');
        resultDiv.className = 'p-4 bg-red-100 border border-red-400 text-red-700 rounded';
        resultDiv.innerHTML = `
          <i class="fas fa-exclamation-circle mr-2"></i>
          <strong>Erreur!</strong> ${error.message}
        `;
        resultDiv.classList.remove('hidden');
      }
    });
  }
  
  // Load dashboard on page load
  loadDashboard();
});
