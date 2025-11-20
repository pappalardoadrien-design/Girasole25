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
function showTab(tabName) {
  // Hide all tabs
  document.querySelectorAll('.tab-content').forEach(tab => {
    tab.classList.add('hidden');
  });
  
  // Remove active class from all buttons
  document.querySelectorAll('.tab-btn').forEach(btn => {
    btn.classList.remove('active', 'border-blue-600', 'text-blue-600');
    btn.classList.add('border-transparent', 'text-gray-600');
  });
  
  // Show selected tab
  const selectedTab = document.getElementById(`tab-${tabName}`);
  if (selectedTab) {
    selectedTab.classList.remove('hidden');
  }
  
  // Add active class to clicked button
  event.target.closest('.tab-btn').classList.add('active', 'border-blue-600', 'text-blue-600');
  event.target.closest('.tab-btn').classList.remove('border-transparent', 'text-gray-600');
  
  // Load tab content
  if (tabName === 'dashboard') {
    loadDashboard();
  } else if (tabName === 'centrales') {
    loadCentrales();
  } else if (tabName === 'upload') {
    loadUploadForm();
  }
}

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
    document.getElementById('stat-photos').textContent = statsData.volumetrie.total_photos || 0;
    
    // Volumétrie
    const jsonMB = (statsData.volumetrie.total_json_mb || 0).toFixed(1);
    const photosEstimGB = ((statsData.volumetrie.total_photos || 0) * 3.5 / 1024).toFixed(1);
    document.getElementById('vol-json').textContent = `${jsonMB} MB`;
    document.getElementById('vol-photos').textContent = `${photosEstimGB} GB`;
    
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
    
    // Appliquer filtres
    const filterType = document.getElementById('filter-type').value;
    const filterStatut = document.getElementById('filter-statut').value;
    
    let filtered = centralesData;
    
    if (filterType) {
      filtered = filtered.filter(c => c.type === filterType);
    }
    
    if (filterStatut) {
      filtered = filtered.filter(c => c.statut === filterStatut);
    }
    
    // Afficher liste
    const container = document.getElementById('centrales-list');
    
    if (filtered.length === 0) {
      container.innerHTML = '<p class="text-center text-gray-500">Aucune centrale trouvée</p>';
      return;
    }
    
    const html = `
      <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Nom</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Type</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Statut</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Puissance (kWc)</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Retours</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Photos</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
            ${filtered.map(c => `
              <tr class="hover:bg-gray-50">
                <td class="px-6 py-4 whitespace-nowrap font-medium">${c.nom}</td>
                <td class="px-6 py-4 whitespace-nowrap">
                  <span class="px-2 py-1 text-xs rounded ${c.type === 'SOL' ? 'bg-blue-100 text-blue-800' : 'bg-green-100 text-green-800'}">
                    ${c.type}
                  </span>
                </td>
                <td class="px-6 py-4 whitespace-nowrap">
                  <span class="px-2 py-1 text-xs rounded ${getStatutColor(c.statut)}">
                    ${getStatutLabel(c.statut)}
                  </span>
                </td>
                <td class="px-6 py-4 whitespace-nowrap">${c.puissance_kwc || '-'}</td>
                <td class="px-6 py-4 whitespace-nowrap">${c.nb_retours || 0}</td>
                <td class="px-6 py-4 whitespace-nowrap">${c.total_photos || 0}</td>
                <td class="px-6 py-4 whitespace-nowrap">
                  <button onclick="changeCentraleStatut(${c.id}, '${c.statut}')" class="text-blue-600 hover:text-blue-800 mr-3">
                    <i class="fas fa-edit"></i>
                  </button>
                  <button onclick="viewCentraleDetail(${c.id})" class="text-green-600 hover:text-green-800">
                    <i class="fas fa-eye"></i>
                  </button>
                </td>
              </tr>
            `).join('')}
          </tbody>
        </table>
      </div>
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
