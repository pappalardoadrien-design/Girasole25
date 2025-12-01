// ============================================
// GESTION ATTRIBUTION CENTRALES/SOUS-TRAITANTS
// 100% SERVEUR - 0% localStorage
// ============================================

// Charger la liste des sous-traitants
async function loadSousTraitants() {
  try {
    const response = await fetch('/api/sous-traitants');
    const result = await response.json();
    // L'API retourne {success: true, data: [...]}
    return result.data || result || [];
  } catch (error) {
    console.error('❌ Erreur chargement sous-traitants:', error);
    return [];
  }
}

// Charger les centrales avec leurs missions et sous-traitants
async function loadCentralesAvecAttributions() {
  try {
    // ⚡ OPTIMISATION : Charger TOUT en parallèle (1 seul appel missions)
    const [centralesResponse, missionsResponse, sousTraitants] = await Promise.all([
      fetch('/api/centrales'),
      fetch('/api/ordres-mission'),
      loadSousTraitants()
    ]);
    
    const centralesData = await centralesResponse.json();
    const missionsData = await missionsResponse.json();
    const centrales = centralesData.data || centralesData.centrales || [];
    const missions = missionsData.data || missionsData.missions || [];
    
    // Créer un index missions par centrale_id pour lookup O(1)
    const missionsMap = {};
    if (Array.isArray(missions)) {
      missions.forEach(m => {
        if (m.centrale_id) {
          missionsMap[m.centrale_id] = m;
        }
      });
    } else {
      console.warn('⚠️ Missions n\'est pas un tableau:', missions);
    }
    
    const container = document.getElementById('centrales-list');
    if (!container) {
      console.error('❌ Container centrales-list non trouvé');
      return;
    }
    
    if (!centrales || centrales.length === 0) {
      container.innerHTML = '<div class="text-center py-12 text-gray-500">Aucune centrale trouvée</div>';
      return;
    }
    
    // Générer HTML avec tableau et dropdowns
    let html = `
      <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Centrale</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Type</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Puissance</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Statut</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Sous-traitant</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
    `;
    
    // ⚡ BOUCLE SYNCHRONE (pas de await dans la boucle)
    for (const centrale of centrales) {
      const statutBadge = getStatutBadge(centrale.statut);
      const typeBadge = centrale.type === 'TOITURE' ? '🏠 TOITURE' : '☀️ SOL';
      
      // Lookup O(1) au lieu de fetch() séquentiel
      const mission = missionsMap[centrale.id] || null;
      
      // Dropdown des sous-traitants
      const dropdownOptions = sousTraitants.map(st => {
        const selected = mission && mission.sous_traitant_id === st.id ? 'selected' : '';
        return `<option value="${st.id}" ${selected}>${st.nom_entreprise}</option>`;
      }).join('');
      
      html += `
        <tr>
          <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${centrale.id}</td>
          <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${centrale.nom}</td>
          <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">${typeBadge}</td>
          <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">${centrale.puissance_kwc || '-'} kWc</td>
          <td class="px-6 py-4 whitespace-nowrap">${statutBadge}</td>
          <td class="px-6 py-4 whitespace-nowrap">
            ${mission ? `
              <select 
                onchange="changerAttribution(${mission.id}, this.value, ${centrale.id})"
                class="px-3 py-1 border rounded focus:ring-2 focus:ring-blue-500 text-sm"
              >
                <option value="">-- Sélectionner --</option>
                ${dropdownOptions}
              </select>
            ` : '<span class="text-gray-400 text-sm">Pas de mission</span>'}
          </td>
          <td class="px-6 py-4 whitespace-nowrap text-sm">
            <a href="/audit/${mission ? mission.id : centrale.id}" class="text-blue-600 hover:text-blue-800">
              <i class="fas fa-clipboard-list"></i> Audit
            </a>
          </td>
        </tr>
      `;
    }
    
    html += `
          </tbody>
        </table>
      </div>
    `;
    
    container.innerHTML = html;
    
    console.log(`✅ ${centrales.length} centrales affichées avec dropdowns`);
    
  } catch (error) {
    console.error('❌ Erreur chargement centrales:', error);
    const container = document.getElementById('centrales-list');
    if (container) {
      container.innerHTML = '<div class="text-center py-12 text-red-500">Erreur de chargement</div>';
    }
  }
}

// Changer l'attribution d'une mission à un sous-traitant
async function changerAttribution(missionId, sousTraitantId, centraleId) {
  if (!sousTraitantId) {
    alert('Veuillez sélectionner un sous-traitant');
    return;
  }
  
  if (!confirm('Changer l\'attribution de cette centrale ?')) {
    // Recharger pour annuler le changement visuel
    await loadCentralesAvecAttributions();
    return;
  }
  
  try {
    const response = await fetch(`/api/ordres-mission/${missionId}/subcontractor`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        sous_traitant_id: parseInt(sousTraitantId)
      })
    });
    
    const result = await response.json();
    
    if (result.success) {
      console.log(`✅ Attribution changée: Mission ${missionId} → Sous-traitant ${sousTraitantId}`);
      alert(`✅ Attribution modifiée avec succès !\n${result.message || ''}`);
      
      // Recharger la liste pour afficher la nouvelle attribution
      await loadCentralesAvecAttributions();
    } else {
      console.error('❌ Erreur API:', result.error);
      alert(`❌ Erreur : ${result.error}`);
      // Recharger pour remettre l'ancienne valeur
      await loadCentralesAvecAttributions();
    }
    
  } catch (error) {
    console.error('❌ Erreur changement attribution:', error);
    alert('❌ Erreur lors du changement d\'attribution');
    // Recharger pour remettre l'ancienne valeur
    await loadCentralesAvecAttributions();
  }
}

// Fonction utilitaire pour générer les badges de statut
function getStatutBadge(statut) {
  const badges = {
    'A_AUDITER': '<span class="px-2 py-1 text-xs font-semibold rounded-full bg-yellow-100 text-yellow-800">⏳ À auditer</span>',
    'EN_COURS': '<span class="px-2 py-1 text-xs font-semibold rounded-full bg-blue-100 text-blue-800">🔄 En cours</span>',
    'TERMINE': '<span class="px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">✅ Terminé</span>',
    'VALIDE': '<span class="px-2 py-1 text-xs font-semibold rounded-full bg-purple-100 text-purple-800">⭐ Validé</span>'
  };
  return badges[statut] || '<span class="px-2 py-1 text-xs font-semibold rounded-full bg-gray-100 text-gray-800">-</span>';
}

// Exposer les fonctions globalement
window.loadCentralesAvecAttributions = loadCentralesAvecAttributions;
window.changerAttribution = changerAttribution;

// Alias pour compatibilité avec le code existant
window.loadCentrales = loadCentralesAvecAttributions;

console.log('✅ Module centrales-attribution.js chargé');
