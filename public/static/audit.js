// audit.js - Interface Audit Terrain Mobile avec Auto-Save

const missionId = parseInt(window.location.pathname.split('/')[2]);
let checklistItems = [];
let autoSaveTimer = null;

// Charger checklist au démarrage
async function loadChecklist() {
  try {
    const response = await axios.get(`/api/checklist/${missionId}`);
    
    if (!response.data.success || response.data.data.length === 0) {
      // Initialiser checklist si vide
      await axios.post(`/api/checklist/${missionId}/init`);
      const retry = await axios.get(`/api/checklist/${missionId}`);
      checklistItems = retry.data.data;
    } else {
      checklistItems = response.data.data;
    }
    
    renderChecklist();
    updateProgress();
  } catch (error) {
    console.error('Erreur chargement:', error);
    alert('Erreur chargement checklist');
  }
}

// Render checklist groupée par catégorie
function renderChecklist() {
  const categories = ['DOC', 'ELEC', 'TABLEAUX', 'CABLAGE', 'MODULES', 'STRUCTURES', 'TOITURE'];
  const categoryIcons = {
    'DOC': '📄',
    'ELEC': '⚡',
    'TABLEAUX': '🔌',
    'CABLAGE': '🔌',
    'MODULES': '☀️',
    'STRUCTURES': '🏗️',
    'TOITURE': '🏠'
  };
  
  const grouped = {};
  categories.forEach(cat => {
    grouped[cat] = checklistItems.filter(item => item.categorie === cat);
  });
  
  const html = categories.map(cat => {
    const items = grouped[cat] || [];
    if (items.length === 0) return '';
    
    return `
      <div class="mb-6">
        <div class="category-header">
          <div class="flex items-center justify-between">
            <div class="flex items-center space-x-2">
              <span class="text-2xl">${categoryIcons[cat]}</span>
              <span class="font-bold text-lg">${cat}</span>
            </div>
            <span class="text-sm opacity-90">${items.length} points</span>
          </div>
        </div>
        
        <div class="space-y-3 mt-4">
          ${items.map(item => renderChecklistItem(item)).join('')}
        </div>
      </div>
    `;
  }).join('');
  
  document.getElementById('checklistContainer').innerHTML = html;
}

// Render un item checklist
function renderChecklistItem(item) {
  const isSaved = item.statut !== 'NON_VERIFIE';
  
  return `
    <div class="checklist-item bg-white rounded-lg shadow p-4 border-l-4 border-gray-300 ${isSaved ? 'saved' : ''}" id="item-${item.id}">
      <div class="font-semibold text-gray-800 mb-3">${item.item_numero}. ${item.item_texte}</div>
      
      <!-- Boutons statut -->
      <div class="flex gap-2 mb-3">
        <button class="status-btn conforme ${item.statut === 'CONFORME' ? 'active' : ''}" 
                onclick="updateStatus(${item.id}, 'CONFORME', true)">
          ✅ Conforme
        </button>
        <button class="status-btn non-conforme ${item.statut === 'NON_CONFORME' ? 'active' : ''}" 
                onclick="updateStatus(${item.id}, 'NON_CONFORME', false)">
          ❌ Non conforme
        </button>
        <button class="status-btn na ${item.statut === 'NA' ? 'active' : ''}" 
                onclick="updateStatus(${item.id}, 'NA', null)">
          ➖ N/A
        </button>
      </div>
      
      <!-- Commentaire -->
      <textarea 
        id="comment-${item.id}"
        class="w-full p-2 border border-gray-300 rounded-lg text-sm"
        placeholder="Commentaire (optionnel)..."
        rows="2"
        onchange="scheduleAutoSave(${item.id})"
      >${item.commentaire || ''}</textarea>
      
      <!-- Photo -->
      <div>
        <label for="photo-${item.id}" class="photo-btn">
          <i class="fas fa-camera mr-2"></i>${item.photo_filename ? 'Changer photo' : 'Ajouter photo'}
        </label>
        <input type="file" id="photo-${item.id}" accept="image/*" capture="environment" 
               onchange="handlePhotoUpload(${item.id}, event)">
        ${item.photo_base64 ? `<img src="data:image/jpeg;base64,${item.photo_base64}" class="photo-preview" alt="Photo">` : ''}
      </div>
    </div>
  `;
}

// Mettre à jour statut item
async function updateStatus(itemId, statut, conformite) {
  const item = checklistItems.find(i => i.id === itemId);
  if (!item) return;
  
  item.statut = statut;
  item.conformite = conformite;
  
  // Sauvegarder immédiatement
  await saveItem(itemId);
  
  // Marquer comme sauvegardé visuellement
  const itemEl = document.getElementById(`item-${itemId}`);
  if (itemEl) {
    itemEl.classList.add('saved');
  }
  updateProgress();
}

// Gérer upload photo
function handlePhotoUpload(itemId, event) {
  const file = event.target.files[0];
  if (!file) return;
  
  // Vérifier taille (max 5MB)
  if (file.size > 5 * 1024 * 1024) {
    alert('⚠️ Photo trop volumineuse (max 5MB)');
    return;
  }
  
  const reader = new FileReader();
  reader.onload = async (e) => {
    const base64 = e.target.result.split(',')[1]; // Retirer préfixe data:image
    const item = checklistItems.find(i => i.id === itemId);
    if (item) {
      item.photo_base64 = base64;
      item.photo_filename = file.name;
      await saveItem(itemId);
      renderChecklist(); // Re-render pour afficher photo
    }
  };
  reader.readAsDataURL(file);
}

// Planifier auto-save (3 secondes après dernière modification)
function scheduleAutoSave(itemId) {
  clearTimeout(autoSaveTimer);
  autoSaveTimer = setTimeout(() => saveItem(itemId), 3000);
}

// Sauvegarder item
async function saveItem(itemId) {
  const item = checklistItems.find(i => i.id === itemId);
  if (!item) return;
  
  const commentEl = document.getElementById(`comment-${itemId}`);
  const commentaire = commentEl ? commentEl.value : '';
  
  try {
    // Récupérer technicien depuis meta page
    const technicienNom = document.querySelector('[data-technicien-nom]')?.dataset.technicienNom || 'Technicien';
    
    await axios.put(`/api/checklist/${itemId}`, {
      statut: item.statut,
      conformite: item.conformite,
      commentaire: commentaire,
      photo_base64: item.photo_base64 || null,
      photo_filename: item.photo_filename || null,
      technicien_nom: technicienNom
    });
    
    // Afficher indicateur sauvegarde
    showSaveIndicator();
    
  } catch (error) {
    console.error('Erreur sauvegarde:', error);
    alert('⚠️ Erreur sauvegarde. Vérifiez votre connexion.');
  }
}

// Afficher indicateur sauvegarde
function showSaveIndicator() {
  const indicator = document.getElementById('saveIndicator');
  if (indicator) {
    indicator.style.display = 'block';
    setTimeout(() => {
      indicator.style.display = 'none';
    }, 2000);
  }
}

// Mettre à jour progression
function updateProgress() {
  const total = checklistItems.length;
  const verified = checklistItems.filter(i => i.statut !== 'NON_VERIFIE').length;
  const percentage = total > 0 ? (verified / total * 100).toFixed(0) : 0;
  
  const progressBar = document.getElementById('progressBar');
  const progressText = document.getElementById('progressText');
  
  if (progressBar) {
    progressBar.style.width = `${percentage}%`;
  }
  
  if (progressText) {
    progressText.textContent = `${verified}/${total} vérifications`;
  }
}

// Terminer audit
async function finishAudit() {
  const verified = checklistItems.filter(i => i.statut !== 'NON_VERIFIE').length;
  const total = checklistItems.length;
  
  if (verified < total) {
    const confirm = window.confirm(`Attention: ${total - verified} vérifications non complétées.\n\nVoulez-vous vraiment terminer l'audit ?`);
    if (!confirm) return;
  }
  
  if (window.confirm('Marquer la mission comme TERMINÉE ?')) {
    try {
      await axios.put(`/api/ordres-mission/${missionId}/statut`, { statut: 'TERMINE' });
      alert('✅ Mission terminée ! Retour à l\'interface planning...');
      window.location.href = '/';
    } catch (error) {
      alert('Erreur mise à jour statut');
      console.error(error);
    }
  }
}

// Charger au démarrage page
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', loadChecklist);
} else {
  loadChecklist();
}
