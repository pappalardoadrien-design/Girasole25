// audit-v2-serveronly.js - 100% SERVEUR - 0% localStorage
// GARANTIE : Chaque action = Sauvegarde DB immédiate

const missionId = parseInt(window.location.pathname.split('/')[2]);
let checklistItems = [];
let checklistItemsToiture = [];
let auditToitureRequis = false;
let isSyncing = false;

// ============================================
// INDICATEURS VISUELS
// ============================================

function showSyncIndicator(action) {
  const existing = document.getElementById('syncIndicator');
  if (existing) existing.remove();
  
  const indicator = document.createElement('div');
  indicator.id = 'syncIndicator';
  indicator.style.cssText = `
    position: fixed;
    top: 70px;
    right: 20px;
    background: #3b82f6;
    color: white;
    padding: 12px 20px;
    border-radius: 25px;
    z-index: 1000;
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 14px;
    font-weight: 500;
    transition: all 0.3s ease;
  `;
  
  indicator.innerHTML = `
    <div class="spinner" style="
      border: 2px solid rgba(255,255,255,0.3);
      border-top: 2px solid white;
      border-radius: 50%;
      width: 16px;
      height: 16px;
      animation: spin 0.6s linear infinite;
    "></div>
    <span>Sauvegarde ${action}...</span>
  `;
  
  document.body.appendChild(indicator);
  
  return {
    success: () => {
      indicator.style.background = '#10b981';
      indicator.innerHTML = '<i class="fas fa-check-circle"></i> <span>Sauvegardé ✓</span>';
      setTimeout(() => indicator.remove(), 2000);
    },
    error: (msg) => {
      indicator.style.background = '#ef4444';
      indicator.innerHTML = `<i class="fas fa-exclamation-triangle"></i> <span>${msg || 'Erreur'}</span>`;
      setTimeout(() => indicator.remove(), 4000);
    }
  };
}

function showPermanentOfflineWarning() {
  const existing = document.getElementById('offlineWarning');
  if (existing) return;
  
  const warning = document.createElement('div');
  warning.id = 'offlineWarning';
  warning.style.cssText = `
    position: fixed;
    top: 10px;
    left: 50%;
    transform: translateX(-50%);
    background: #ef4444;
    color: white;
    padding: 15px 25px;
    border-radius: 10px;
    z-index: 1001;
    box-shadow: 0 4px 12px rgba(0,0,0,0.2);
    font-weight: 600;
    text-align: center;
  `;
  
  warning.innerHTML = `
    <i class="fas fa-wifi-slash mr-2"></i>
    PAS DE CONNEXION
    <br>
    <small style="font-weight: normal; font-size: 12px;">
      Reconnectez-vous pour sauvegarder vos modifications
    </small>
  `;
  
  document.body.appendChild(warning);
}

// ============================================
// CHARGEMENT DONNÉES - 100% DEPUIS SERVEUR
// ============================================

async function loadChecklist() {
  try {
    const indicator = showSyncIndicator('chargement');
    
    // Vérifier connexion
    if (!navigator.onLine) {
      indicator.error('Pas de connexion');
      showPermanentOfflineWarning();
      alert('⚠️ AUCUNE CONNEXION\n\nImpossible de charger l\'audit.\nConnectez-vous à Internet.');
      return;
    }
    
    // Charger depuis serveur UNIQUEMENT
    const response = await fetch(`/api/checklist/${missionId}`);
    const data = await response.json();
    
    if (!data.success || !data.data || data.data.length === 0) {
      // Initialiser si vide
      await fetch(`/api/checklist/${missionId}/init`, { method: 'POST' });
      const retryResponse = await fetch(`/api/checklist/${missionId}`);
      const retryData = await retryResponse.json();
      checklistItems = retryData.data || [];
    } else {
      checklistItems = data.data || [];
    }
    
    indicator.success();
    
    renderChecklist();
    updateProgress();
    
    // Charger photos de chaque item
    for (const item of checklistItems) {
      await loadItemPhotos(item.id);
    }
    
    // Charger commentaire final et photos générales
    await loadCommentaireFinal();
    await loadPhotosGenerales();
    
    // Charger checklist TOITURE si nécessaire
    await loadChecklistToiture();
    
  } catch (error) {
    console.error('Erreur chargement:', error);
    alert('❌ ERREUR CHARGEMENT\n\nImpossible de charger l\'audit.\nVérifiez votre connexion.');
  }
}

// ============================================
// SAUVEGARDE IMMÉDIATE - CHAQUE ACTION
// ============================================

async function saveItemStatus(itemId, statut, conformite = null) {
  if (isSyncing) return;
  isSyncing = true;
  
  const indicator = showSyncIndicator('statut');
  
  try {
    // Vérifier connexion
    if (!navigator.onLine) {
      throw new Error('offline');
    }
    
    const response = await fetch(`/api/checklist/item/${itemId}`, {
      method: 'PUT',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({
        statut
      })
    });
    
    if (!response.ok) {
      const errorText = await response.text();
      console.error(`❌ PUT /api/checklist/item/${itemId} ${response.status}:`, errorText);
      throw new Error(`Server error ${response.status}`);
    }
    
    // Mettre à jour en mémoire
    const item = checklistItems.find(i => i.id === itemId);
    if (item) {
      item.statut = statut;
      item.conformite = conformite;
    }
    
    indicator.success();
    updateProgress();
    
  } catch (error) {
    if (error.message === 'offline') {
      indicator.error('Pas de connexion');
      showPermanentOfflineWarning();
      alert('⚠️ PAS DE CONNEXION\n\nVos modifications ne sont PAS sauvegardées.\nReconnectez-vous immédiatement.');
    } else {
      indicator.error('Erreur serveur');
      alert('❌ ERREUR SAUVEGARDE\n\nVos modifications ne sont PAS sauvegardées.\nRéessayez.');
    }
  } finally {
    isSyncing = false;
  }
}

async function saveItemComment(itemId, commentaire) {
  if (isSyncing) return;
  isSyncing = true;
  
  const indicator = showSyncIndicator('commentaire');
  
  try {
    if (!navigator.onLine) throw new Error('offline');
    
    const response = await fetch(`/api/checklist/item/${itemId}/comment`, {
      method: 'PUT',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({
        commentaire
      })
    });
    
    if (!response.ok) {
      const errorText = await response.text();
      console.error(`❌ PUT /api/checklist/item/${itemId}/comment ${response.status}:`, errorText);
      throw new Error(`Server error ${response.status}`);
    }
    
    // Mettre à jour en mémoire
    const item = checklistItems.find(i => i.id === itemId);
    if (item) item.commentaire = commentaire;
    
    indicator.success();
    
  } catch (error) {
    if (error.message === 'offline') {
      indicator.error('Pas de connexion');
      showPermanentOfflineWarning();
      alert('⚠️ PAS DE CONNEXION\n\nVotre commentaire n\'est PAS sauvegardé.\nReconnectez-vous.');
    } else {
      indicator.error('Erreur');
    }
  } finally {
    isSyncing = false;
  }
}

async function saveItemPhoto(itemId, photoBase64, filename) {
  if (isSyncing) return;
  isSyncing = true;
  
  const indicator = showSyncIndicator('photo');
  
  try {
    if (!navigator.onLine) throw new Error('offline');
    
    const response = await fetch(`/api/checklist/${missionId}/item/${itemId}/photos`, {
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({
        photo_base64: photoBase64,
        photo_filename: filename
      })
    });
    
    if (!response.ok) throw new Error('Server error');
    
    indicator.success();
    
    // Recharger photos
    await loadItemPhotos(itemId);
    
  } catch (error) {
    if (error.message === 'offline') {
      indicator.error('Pas de connexion');
      showPermanentOfflineWarning();
      alert('⚠️ PAS DE CONNEXION\n\nVotre photo n\'est PAS sauvegardée.\nReconnectez-vous.');
    } else {
      indicator.error('Erreur');
    }
  } finally {
    isSyncing = false;
  }
}

// ============================================
// EVENT LISTENERS - SAUVEGARDE IMMÉDIATE
// ============================================

function updateStatus(itemId, nouveauStatut) {
  const item = checklistItems.find(i => i.id === itemId);
  if (!item) return;
  
  // Déterminer conformité
  let conformite = null;
  if (nouveauStatut === 'CONFORME') conformite = 'CONFORME';
  if (nouveauStatut === 'NON_CONFORME') conformite = 'NON_CONFORME';
  if (nouveauStatut === 'N/A') conformite = 'N_A';
  
  // SAUVEGARDE IMMÉDIATE
  saveItemStatus(itemId, nouveauStatut, conformite);
  
  // Mettre à jour UI
  const buttons = document.querySelectorAll(`[data-item-id="${itemId}"]`);
  buttons.forEach(btn => {
    btn.classList.remove('active');
    if (btn.dataset.statut === nouveauStatut) {
      btn.classList.add('active');
    }
  });
}

function setupCommentListener(itemId) {
  const textarea = document.querySelector(`#comment-${itemId}`);
  if (!textarea) return;
  
  let debounceTimer;
  textarea.addEventListener('input', () => {
    clearTimeout(debounceTimer);
    debounceTimer = setTimeout(() => {
      // SAUVEGARDE IMMÉDIATE (avec debounce 1s)
      saveItemComment(itemId, textarea.value);
    }, 1000);
  });
}

async function handlePhotoCapture(itemId) {
  const input = document.createElement('input');
  input.type = 'file';
  input.accept = 'image/*';
  input.capture = 'environment';
  
  input.onchange = async (e) => {
    const file = e.target.files[0];
    if (!file) return;
    
    // Compresser image
    const compressed = await compressImage(file);
    
    // SAUVEGARDE IMMÉDIATE
    await saveItemPhoto(itemId, compressed.base64, compressed.filename);
  };
  
  input.click();
}

// ============================================
// UTILITAIRES
// ============================================

async function compressImage(file) {
  return new Promise((resolve) => {
    const reader = new FileReader();
    reader.onload = (e) => {
      const img = new Image();
      img.onload = () => {
        const canvas = document.createElement('canvas');
        let width = img.width;
        let height = img.height;
        
        // Redimensionner si trop grand
        const maxSize = 1920;
        if (width > maxSize || height > maxSize) {
          if (width > height) {
            height = (height / width) * maxSize;
            width = maxSize;
          } else {
            width = (width / height) * maxSize;
            height = maxSize;
          }
        }
        
        canvas.width = width;
        canvas.height = height;
        const ctx = canvas.getContext('2d');
        ctx.drawImage(img, 0, 0, width, height);
        
        const base64 = canvas.toDataURL('image/jpeg', 0.8);
        resolve({
          base64,
          filename: `photo_${Date.now()}.jpg`
        });
      };
      img.src = e.target.result;
    };
    reader.readAsDataURL(file);
  });
}

function renderChecklist() {
  const categories = ['DOCUMENTATION', 'INSTALL_ELEC', 'NORMES_ELEC', 'TRANCHEES', 'CABLAGE', 'INSPECTIONS_VISUELLES'];
  const categoryIcons = {
    'DOCUMENTATION': '📄',
    'INSTALL_ELEC': '🔌',
    'NORMES_ELEC': '⚡',
    'TRANCHEES': '🏗️',
    'CABLAGE': '🔌',
    'INSPECTIONS_VISUELLES': '👁️'
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
        <div class="category-header" style="background: #3b82f6; color: white; padding: 12px; border-radius: 8px; font-weight: 600; margin-bottom: 10px;">
          ${categoryIcons[cat]} ${cat.replace(/_/g, ' ')}
        </div>
        ${items.map(item => `
          <div class="item-card" style="background: white; border: 1px solid #e5e7eb; border-radius: 8px; padding: 15px; margin-bottom: 10px;">
            <div style="font-weight: 500; margin-bottom: 10px;">${item.item_numero}. ${item.item_texte}</div>
            <div style="display: flex; gap: 10px; margin-bottom: 10px;">
              <button onclick="updateStatus(${item.id}, 'CONFORME')" 
                      data-item-id="${item.id}" 
                      data-statut="CONFORME"
                      class="${item.statut === 'CONFORME' ? 'active' : ''}"
                      style="flex: 1; padding: 10px; border: 2px solid #10b981; background: ${item.statut === 'CONFORME' ? '#10b981' : 'white'}; color: ${item.statut === 'CONFORME' ? 'white' : '#10b981'}; border-radius: 6px; font-weight: 600; cursor: pointer;">
                ✓ CONFORME
              </button>
              <button onclick="updateStatus(${item.id}, 'NON_CONFORME')" 
                      data-item-id="${item.id}" 
                      data-statut="NON_CONFORME"
                      class="${item.statut === 'NON_CONFORME' ? 'active' : ''}"
                      style="flex: 1; padding: 10px; border: 2px solid #ef4444; background: ${item.statut === 'NON_CONFORME' ? '#ef4444' : 'white'}; color: ${item.statut === 'NON_CONFORME' ? 'white' : '#ef4444'}; border-radius: 6px; font-weight: 600; cursor: pointer;">
                ✗ NON CONFORME
              </button>
              <button onclick="updateStatus(${item.id}, 'N/A')" 
                      data-item-id="${item.id}" 
                      data-statut="N/A"
                      class="${item.statut === 'N/A' ? 'active' : ''}"
                      style="flex: 1; padding: 10px; border: 2px solid #6b7280; background: ${item.statut === 'N/A' ? '#6b7280' : 'white'}; color: ${item.statut === 'N/A' ? 'white' : '#6b7280'}; border-radius: 6px; font-weight: 600; cursor: pointer;">
                N/A
              </button>
            </div>
            <textarea id="comment-${item.id}" 
                      placeholder="Commentaire (optionnel)..." 
                      style="width: 100%; padding: 10px; border: 1px solid #d1d5db; border-radius: 6px; min-height: 60px; margin-bottom: 10px;">${item.commentaire || ''}</textarea>
            <button onclick="handlePhotoCapture(${item.id})" 
                    style="width: 100%; padding: 10px; background: #3b82f6; color: white; border: none; border-radius: 6px; font-weight: 600; cursor: pointer;">
              <i class="fas fa-camera mr-2"></i> Ajouter Photo
            </button>
            <div id="photos-${item.id}" style="margin-top: 10px;"></div>
          </div>
        `).join('')}
      </div>
    `;
  }).join('');
  
  document.getElementById('checklistContainer').innerHTML = html;
  
  // Setup listeners
  checklistItems.forEach(item => {
    setupCommentListener(item.id);
    loadItemPhotos(item.id); // Charger photos pour chaque item
  });
}

function updateProgress() {
  const total = checklistItems.length;
  const completed = checklistItems.filter(i => i.statut !== 'NON_VERIFIE').length;
  const percent = total > 0 ? Math.round((completed / total) * 100) : 0;
  
  const progressBar = document.getElementById('progressBar');
  if (progressBar) {
    progressBar.style.width = percent + '%';
    progressBar.textContent = `${completed}/${total} (${percent}%)`;
  }
}

async function loadItemPhotos(itemId) {
  try {
    const response = await fetch(`/api/checklist/${missionId}/item/${itemId}/photos`);
    const data = await response.json();
    
    if (data.success && data.photos) {
      renderItemPhotos(itemId, data.photos);
    }
  } catch (error) {
    console.error('Erreur chargement photos item:', error);
  }
}

function renderItemPhotos(itemId, photos) {
  const container = document.getElementById(`photos-${itemId}`);
  if (!container) return;
  
  if (photos.length === 0) {
    container.innerHTML = '<p class="text-gray-500 text-sm italic">Aucune photo</p>';
    return;
  }
  
  container.innerHTML = `
    <div class="grid grid-cols-3 gap-2 mt-2">
      ${photos.map((photo, idx) => {
        // Retirer préfixe data:image si déjà présent
        const base64 = photo.photo_base64?.startsWith('data:') 
          ? photo.photo_base64 
          : `data:image/jpeg;base64,${photo.photo_base64}`;
        return `
          <div class="relative group">
            <img 
              src="${base64}" 
              class="w-full h-24 object-cover rounded-lg border-2 border-gray-300 cursor-pointer hover:border-blue-500 transition"
              onclick="openPhotoModal(${itemId}, ${idx})"
              alt="Photo ${idx + 1}"
            />
            <button 
              onclick="deletePhoto(${photo.id}, ${itemId})"
              class="absolute top-1 right-1 bg-red-500 text-white rounded-full w-6 h-6 opacity-0 group-hover:opacity-100 transition"
              title="Supprimer photo"
            >×</button>
          </div>
        `;
      }).join('')}
    </div>
  `;
}

function openPhotoModal(itemId, photoIndex) {
  // Créer modal si n'existe pas
  let modal = document.getElementById('photoModal');
  if (!modal) {
    modal = document.createElement('div');
    modal.id = 'photoModal';
    modal.style.cssText = `
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: rgba(0,0,0,0.9);
      z-index: 9999;
      justify-content: center;
      align-items: center;
    `;
    modal.innerHTML = `
      <img id="photoModalImg" style="max-width: 90%; max-height: 90vh; border-radius: 8px;" />
      <button onclick="closePhotoModal()" style="position: absolute; top: 20px; right: 20px; color: white; font-size: 32px; background: none; border: none; cursor: pointer;">×</button>
    `;
    document.body.appendChild(modal);
  }
  
  // Charger photo depuis API
  fetch(`/api/checklist/${missionId}/item/${itemId}/photos`)
    .then(r => r.json())
    .then(data => {
      const photo = data.photos[photoIndex];
      const base64 = photo.photo_base64?.startsWith('data:') 
        ? photo.photo_base64 
        : `data:image/jpeg;base64,${photo.photo_base64}`;
      document.getElementById('photoModalImg').src = base64;
      modal.style.display = 'flex';
    });
}

window.closePhotoModal = function() {
  const modal = document.getElementById('photoModal');
  if (modal) modal.style.display = 'none';
}

async function deletePhoto(photoId, itemId) {
  if (!confirm('Supprimer cette photo ?')) return;
  
  try {
    const response = await fetch(`/api/checklist/item/photo/${photoId}`, {
      method: 'DELETE'
    });
    
    if (response.ok) {
      alert('Photo supprimée');
      await loadItemPhotos(itemId);
    }
  } catch (error) {
    console.error('Erreur suppression photo:', error);
  }
}

// ============================================
// COMMENTAIRE FINAL MISSION
// ============================================

let commentaireFinal = '';

async function loadCommentaireFinal() {
  try {
    const response = await fetch(`/api/ordres-mission/${missionId}/commentaire-final`);
    const data = await response.json();
    commentaireFinal = data.data?.commentaire_final || '';
    renderCommentaireFinal();
  } catch (error) {
    console.error('Erreur chargement commentaire final:', error);
  }
}

function renderCommentaireFinal() {
  const container = document.getElementById('commentaireFinalSection');
  if (!container) return;
  
  container.innerHTML = `
    <div class="bg-gradient-to-r from-blue-50 to-blue-100 p-6 rounded-2xl shadow-lg border-2 border-blue-200 mb-6">
      <h3 class="text-xl font-bold text-gray-800 mb-4 flex items-center">
        <i class="fas fa-comment-dots mr-3 text-blue-600"></i>
        📋 SYNTHÈSE GÉNÉRALE MISSION
      </h3>
      
      <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700 mb-2">
          Commentaire général sur la centrale :
        </label>
        <textarea 
          id="commentaire-final-textarea"
          rows="6" 
          class="w-full p-4 border-2 border-blue-300 rounded-xl focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all resize-y"
          placeholder="Vue d'ensemble installation, conditions météo, accès chantier, sécurité, observations générales..."
        >${commentaireFinal}</textarea>
        <p class="text-xs text-gray-500 mt-2">
          💡 Ce commentaire sera inclus dans le rapport final PDF
        </p>
      </div>
      
      <div id="photosGeneralesContainer">
        <div class="flex items-center justify-between mb-3">
          <label class="block text-sm font-medium text-gray-700">
            Photos générales (contexte, vue d'ensemble) :
          </label>
          <span id="photosGeneralesCount" class="text-xs text-gray-500">0 photo(s)</span>
        </div>
        
        <input 
          type="file" 
          id="photosGeneralesInput" 
          accept="image/*" 
          multiple 
          capture="environment"
          class="hidden"
        >
        
        <button 
          onclick="document.getElementById('photosGeneralesInput').click()" 
          class="w-full bg-blue-600 text-white px-4 py-3 rounded-xl hover:bg-blue-700 transition-all mb-4 flex items-center justify-center gap-2"
        >
          <i class="fas fa-camera"></i>
          📸 Ajouter photos générales
        </button>
        
        <div id="photosGeneralesGallery" class="grid grid-cols-3 gap-3 mt-3">
          <!-- Photos générales ici -->
        </div>
      </div>
      
      <!-- BOUTON GÉNÉRATION RAPPORT -->
      <div class="mt-6 border-t-2 border-blue-300 pt-6 space-y-3">
        <!-- Bouton TERMINÉ (retour dashboard) -->
        <button 
          onclick="terminerAudit()" 
          class="w-full bg-gradient-to-r from-blue-600 to-blue-700 text-white px-6 py-4 rounded-xl hover:from-blue-700 hover:to-blue-800 transition-all shadow-lg flex items-center justify-center gap-3 font-bold text-lg"
        >
          <i class="fas fa-check-circle text-2xl"></i>
          ✅ TERMINÉ - Retour Dashboard
        </button>
        
        <!-- Bouton GÉNÉRER RAPPORT -->
        <button 
          onclick="genererRapportFinal()" 
          class="w-full bg-gradient-to-r from-green-600 to-green-700 text-white px-6 py-4 rounded-xl hover:from-green-700 hover:to-green-800 transition-all shadow-lg flex items-center justify-center gap-3 font-bold text-lg"
        >
          <i class="fas fa-file-pdf text-2xl"></i>
          📄 GÉNÉRER RAPPORT FINAL (JSON)
        </button>
        
        <p class="text-xs text-gray-500 mt-3 text-center">
          ✅ Toutes les données sont sauvegardées automatiquement
        </p>
      </div>
    </div>
  `;
  
  // Event listener textarea auto-save
  const textarea = document.getElementById('commentaire-final-textarea');
  textarea?.addEventListener('input', async (e) => {
    commentaireFinal = e.target.value;
    await saveCommentaireFinal();
  });
  
  // Event listener upload photos
  const input = document.getElementById('photosGeneralesInput');
  input?.addEventListener('change', handlePhotosGeneralesUpload);
  
  loadPhotosGenerales();
}

async function saveCommentaireFinal() {
  try {
    await fetch(`/api/ordres-mission/${missionId}/commentaire-final`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ commentaire_final: commentaireFinal })
    });
  } catch (error) {
    console.error('Erreur sauvegarde commentaire final:', error);
  }
}

// ============================================
// PHOTOS GÉNÉRALES
// ============================================

let photosGenerales = [];

async function loadPhotosGenerales() {
  try {
    const response = await fetch(`/api/ordres-mission/${missionId}/photos-generales`);
    const data = await response.json();
    photosGenerales = data.data || [];
    renderPhotosGenerales();
  } catch (error) {
    console.error('Erreur chargement photos générales:', error);
  }
}

function renderPhotosGenerales() {
  const gallery = document.getElementById('photosGeneralesGallery');
  if (!gallery) return;
  
  gallery.innerHTML = photosGenerales.map((photo, index) => `
    <div class="relative">
      <img src="data:image/jpeg;base64,${photo.photo_base64}" class="w-full h-32 object-cover rounded-lg shadow">
      <button 
        onclick="deletePhotoGenerale(${photo.id})"
        class="absolute top-1 right-1 bg-red-500 text-white rounded-full w-6 h-6 flex items-center justify-center"
      >
        <i class="fas fa-times text-xs"></i>
      </button>
    </div>
  `).join('');
  
  const countSpan = document.getElementById('photosGeneralesCount');
  if (countSpan) countSpan.textContent = `${photosGenerales.length} photo(s)`;
}

async function handlePhotosGeneralesUpload(event) {
  const files = event.target.files;
  if (!files || files.length === 0) return;
  
  showSyncIndicator('photos');
  
  for (let file of files) {
    const reader = new FileReader();
    reader.onload = async (e) => {
      const base64 = e.target.result;
      
      try {
        const response = await fetch(`/api/ordres-mission/${missionId}/photos-generales`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            photo_base64: base64,
            filename: file.name,
            description: ''
          })
        });
        
        if (response.ok) {
          await loadPhotosGenerales();
        }
      } catch (error) {
        console.error('Erreur upload photo générale:', error);
      }
    };
    reader.readAsDataURL(file);
  }
  
  event.target.value = '';
}

async function deletePhotoGenerale(photoId) {
  if (!confirm('Supprimer cette photo ?')) return;
  
  try {
    await fetch(`/api/ordres-mission/photos-generales/${photoId}`, {
      method: 'DELETE'
    });
    await loadPhotosGenerales();
  } catch (error) {
    console.error('Erreur suppression photo générale:', error);
  }
}

// ============================================
// CHECKLIST TOITURE
// ============================================

async function loadChecklistToiture() {
  try {
    const response = await fetch(`/api/checklist-toiture/${missionId}`);
    const data = await response.json();
    
    if (data.success && data.audit_toiture_requis) {
      auditToitureRequis = true;
      checklistItemsToiture = data.items || [];
      renderChecklistToiture();
      
      // Charger photos pour chaque item toiture
      for (const item of checklistItemsToiture) {
        await loadItemPhotos(item.id);
      }
    }
  } catch (error) {
    console.error('Erreur chargement checklist toiture:', error);
  }
}

function renderChecklistToiture() {
  const container = document.getElementById('checklistToitureContainer');
  if (!container || !auditToitureRequis) return;
  
  const html = `
    <div class="mb-6">
      <div class="bg-gradient-to-r from-orange-500 to-orange-700 text-white p-4 rounded-t-2xl shadow-lg">
        <div class="flex items-center justify-between">
          <div class="flex items-center space-x-3">
            <span class="text-3xl">🏗️</span>
            <div>
              <span class="font-bold text-xl">AUDIT EN TOITURE</span>
              <p class="text-xs text-orange-200 mt-1">Démontage ~25 panneaux + Vérifications DTU 40.35</p>
            </div>
          </div>
          <span class="text-sm opacity-90">${checklistItemsToiture.length} points</span>
        </div>
      </div>
      
      <div class="space-y-3 mt-4">
        ${checklistItemsToiture.map(item => renderChecklistItemToiture(item)).join('')}
      </div>
    </div>
  `;
  
  container.innerHTML = html;
}

function renderChecklistItemToiture(item) {
  const isSaved = item.statut !== 'NON_VERIFIE';
  
  return `
    <div class="bg-white rounded-xl shadow-md p-4 border-l-4 ${isSaved ? 'border-green-500' : 'border-gray-300'}">
      <div class="flex items-start justify-between mb-3">
        <div class="flex-1">
          <div class="flex items-center space-x-2 mb-2">
            <span class="inline-flex items-center justify-center w-6 h-6 rounded-full bg-orange-100 text-orange-700 text-xs font-bold">
              ${item.item_numero}
            </span>
            <span class="font-semibold text-gray-800 text-sm">${item.libelle}</span>
          </div>
          ${isSaved ? `<div class="text-xs text-green-600 font-medium">✓ Vérifié</div>` : ''}
        </div>
      </div>
      
      <!-- Statut -->
      <div class="grid grid-cols-3 gap-2 mb-3">
        <button 
          class="status-btn ${item.statut === 'CONFORME' ? 'active bg-green-500 text-white' : 'bg-gray-100 text-gray-700'}"
          onclick="updateStatusToiture(${item.id}, 'CONFORME', 'RAS')"
        >
          <i class="fas fa-check mr-1"></i>Conforme
        </button>
        <button 
          class="status-btn ${item.statut === 'NON_CONFORME' ? 'active bg-red-500 text-white' : 'bg-gray-100 text-gray-700'}"
          onclick="updateStatusToiture(${item.id}, 'NON_CONFORME', 'ANOMALIE')"
        >
          <i class="fas fa-times mr-1"></i>Non conforme
        </button>
        <button 
          class="status-btn ${item.statut === 'N/A' ? 'active bg-gray-400 text-white' : 'bg-gray-100 text-gray-700'}"
          onclick="updateStatusToiture(${item.id}, 'N/A', 'N/A')"
        >
          N/A
        </button>
      </div>
      
      <!-- Commentaire -->
      <textarea 
        id="comment-toiture-${item.id}"
        class="w-full p-2 border border-gray-300 rounded-lg text-sm"
        placeholder="Commentaire (optionnel)..."
        rows="2"
        onchange="saveCommentToiture(${item.id})"
      >${item.commentaire || ''}</textarea>
      
      <!-- Photos -->
      <div class="mt-3">
        <div class="flex items-center justify-between mb-2">
          <span class="text-sm font-medium text-gray-700">
            <i class="fas fa-images mr-1"></i>Photos (<span id="photo-count-toiture-${item.id}">0</span>)
          </span>
          <button class="photo-btn inline-flex items-center" onclick="openPhotoUploader(${item.id})">
            <i class="fas fa-camera mr-2"></i>Ajouter photos
          </button>
        </div>
        <input type="file" id="photo-input-${item.id}" accept="image/*" capture="environment" 
               multiple onchange="handleMultiPhotoUpload(${item.id}, event)" style="display:none">
        <div id="photos-gallery-${item.id}" class="grid grid-cols-3 gap-2">
          <!-- Photos chargées dynamiquement -->
        </div>
      </div>
    </div>
  `;
}

async function updateStatusToiture(itemId, statut, conformite) {
  try {
    const item = checklistItemsToiture.find(i => i.id === itemId);
    if (!item) return;
    
    item.statut = statut;
    item.conformite = conformite;
    
    await fetch(`/api/checklist-toiture/${missionId}/item/${itemId}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ statut, conformite, technicien: 'Audit' })
    });
    
    renderChecklistToiture();
  } catch (error) {
    console.error('Erreur sauvegarde statut toiture:', error);
  }
}

async function saveCommentToiture(itemId) {
  try {
    const textarea = document.getElementById(`comment-toiture-${itemId}`);
    const commentaire = textarea?.value || '';
    
    const item = checklistItemsToiture.find(i => i.id === itemId);
    if (item) {
      item.commentaire = commentaire;
    }
    
    await fetch(`/api/checklist-toiture/${missionId}/item/${itemId}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ 
        statut: item.statut || 'NON_VERIFIE', 
        commentaire 
      })
    });
  } catch (error) {
    console.error('Erreur sauvegarde commentaire toiture:', error);
  }
}

// ============================================
// DÉMARRAGE
// ============================================

// Ajouter style pour animation spinner
const style = document.createElement('style');
style.textContent = `
  @keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
  }
`;
document.head.appendChild(style);

// ============================================
// GÉNÉRATION RAPPORT FINAL
// ============================================

async function terminerAudit() {
  // Toutes les modifications sont déjà sauvegardées en temps réel
  if (confirm('Terminer cet audit et retourner au Dashboard ?\n\n✅ Checklist sauvegardée\n✅ Commentaires sauvegardés\n✅ Photos sauvegardées')) {
    window.location.href = '/';
  }
}

async function genererRapportFinal() {
  if (!confirm('Générer le rapport final de cet audit ?\n\nCela créera un document JSON complet avec checklist, photos et commentaires.')) {
    return;
  }
  
  showSyncIndicator('rapport');
  
  try {
    const response = await fetch(`/api/rapports/generer/${missionId}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' }
    });
    
    const data = await response.json();
    
    if (data.success) {
      alert('✅ RAPPORT GÉNÉRÉ\n\nRapport ID: ' + data.rapport_id + '\n\nLe rapport a été sauvegardé et est accessible via /api/rapports/' + data.rapport_id);
      
      // Optionnel : télécharger le JSON
      if (confirm('Télécharger les données du rapport (JSON) ?')) {
        await telechargerRapportJSON(data.rapport_id);
      }
    } else {
      alert('❌ ERREUR\n\n' + (data.error || 'Impossible de générer le rapport'));
    }
  } catch (error) {
    console.error('Erreur génération rapport:', error);
    alert('❌ ERREUR RÉSEAU\n\nImpossible de générer le rapport.\nVérifiez votre connexion.');
  }
}

async function telechargerRapportJSON(rapportId) {
  try {
    const response = await fetch(`/api/rapports/${rapportId}`);
    const data = await response.json();
    
    if (data.success && data.data) {
      const rapport = data.data;
      const donnees = JSON.parse(rapport.donnees_rapport);
      
      // Créer un blob JSON
      const blob = new Blob([JSON.stringify(donnees, null, 2)], { type: 'application/json' });
      const url = URL.createObjectURL(blob);
      
      // Télécharger
      const a = document.createElement('a');
      a.href = url;
      a.download = `rapport_mission_${missionId}_${new Date().toISOString().split('T')[0]}.json`;
      a.click();
      
      URL.revokeObjectURL(url);
    }
  } catch (error) {
    console.error('Erreur téléchargement rapport:', error);
  }
}

// ============================================
// DÉMARRAGE
// ============================================

// Charger au démarrage
document.addEventListener('DOMContentLoaded', loadChecklist);

// Détecter changements connexion
window.addEventListener('online', () => {
  const warning = document.getElementById('offlineWarning');
  if (warning) warning.remove();
  
  alert('✅ CONNEXION RÉTABLIE\n\nVous pouvez reprendre l\'audit.');
  location.reload();
});

window.addEventListener('offline', () => {
  showPermanentOfflineWarning();
  alert('⚠️ CONNEXION PERDUE\n\nNe faites AUCUNE modification.\nReconnectez-vous immédiatement.');
});
