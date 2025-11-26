// audit.js - Interface Audit Terrain Mobile avec Auto-Save + Mode Offline

const missionId = parseInt(window.location.pathname.split('/')[2]);
let checklistItems = [];
let commentaireFinal = '';
let photosGenerales = [];
let autoSaveTimer = null;
let isOnline = navigator.onLine;
let pendingSyncQueue = [];

// LocalStorage keys
const STORAGE_KEY = `audit_mission_${missionId}`;
const SYNC_QUEUE_KEY = `sync_queue_${missionId}`;
const COMMENTAIRE_FINAL_KEY = `commentaire_final_${missionId}`;
const PHOTOS_GENERALES_KEY = `photos_generales_${missionId}`;

// Détecter changements connexion
window.addEventListener('online', () => {
  isOnline = true;
  console.log('✅ Connexion rétablie - Sync en cours...');
  document.getElementById('offlineIndicator')?.remove();
  syncPendingChanges();
});

window.addEventListener('offline', () => {
  isOnline = false;
  console.log('⚠️ Mode offline activé');
  showOfflineIndicator();
});

// Indicateur mode offline
function showOfflineIndicator() {
  if (document.getElementById('offlineIndicator')) return;
  
  const indicator = document.createElement('div');
  indicator.id = 'offlineIndicator';
  indicator.style.cssText = 'position:fixed;top:70px;left:50%;transform:translateX(-50%);background:#f59e0b;color:white;padding:10px 20px;border-radius:20px;z-index:100;box-shadow:0 4px 6px rgba(0,0,0,0.1);';
  indicator.innerHTML = '<i class="fas fa-wifi-slash mr-2"></i>Mode Offline - Données sauvegardées localement';
  document.body.appendChild(indicator);
}

// Vérifier si localStorage est disponible (Tracking Prevention)
function isLocalStorageAvailable() {
  try {
    const test = '__localStorage_test__';
    localStorage.setItem(test, test);
    localStorage.removeItem(test);
    return true;
  } catch (e) {
    console.warn('⚠️ localStorage non disponible (Tracking Prevention activé)');
    return false;
  }
}

// Safe localStorage operations
function safeLocalStorageGet(key) {
  if (!isLocalStorageAvailable()) return null;
  try {
    return localStorage.getItem(key);
  } catch (e) {
    return null;
  }
}

function safeLocalStorageSet(key, value) {
  if (!isLocalStorageAvailable()) return false;
  try {
    localStorage.setItem(key, value);
    return true;
  } catch (e) {
    return false;
  }
}

// Charger checklist au démarrage
async function loadChecklist() {
  try {
    // Essayer de charger depuis localStorage d'abord (mode offline)
    const localData = safeLocalStorageGet(STORAGE_KEY);
    
    if (isOnline) {
      // Mode online : charger depuis serveur avec fetch natif
      const response = await fetch(`/api/checklist/${missionId}`);
      const data = await response.json();
      
      if (!data.success || !data.data || data.data.length === 0) {
        // Initialiser checklist si vide
        await fetch(`/api/checklist/${missionId}/init`, { method: 'POST' });
        const retryResponse = await fetch(`/api/checklist/${missionId}`);
        const retryData = await retryResponse.json();
        checklistItems = retryData.data || [];
      } else {
        checklistItems = data.data || [];
      }
      
      // Sauvegarder en local pour backup offline
      safeLocalStorageSet(STORAGE_KEY, JSON.stringify(checklistItems));
      
    } else if (localData) {
      // Mode offline : charger depuis localStorage
      checklistItems = JSON.parse(localData);
      showOfflineIndicator();
      console.log('📦 Checklist chargée depuis localStorage (mode offline)');
    } else {
      throw new Error('Aucune donnée locale disponible et pas de connexion');
    }
    
    renderChecklist();
    updateProgress();
    
    // Charger photos de chaque item
    for (const item of checklistItems) {
      await loadItemPhotos(item.id);
    }
    
    // Charger commentaire final et photos générales
    await loadCommentaireFinal();
    await loadPhotosGenerales();
    
    // Sync changements en attente si connexion rétablie
    if (isOnline) {
      syncPendingChanges();
    }
    
  } catch (error) {
    console.error('Erreur chargement:', error);
    alert('⚠️ Erreur chargement checklist. Vérifiez votre connexion.');
  }
}

// Render checklist groupée par catégorie
function renderChecklist() {
  // Catégories CDC GIRASOLE 2025 (40 points)
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
      
      <!-- Photos Multiples (nouveau système) -->
      <div class="mt-3">
        <div class="flex items-center justify-between mb-2">
          <span class="text-sm font-medium text-gray-700">
            <i class="fas fa-images mr-1"></i>Photos (<span id="photo-count-${item.id}">0</span>)
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

// Compresser image avant upload (réduit ~80% taille)
async function compressImage(file, maxWidth = 1920, maxHeight = 1080, quality = 0.8) {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onload = (e) => {
      const img = new Image();
      img.onload = () => {
        const canvas = document.createElement('canvas');
        let width = img.width;
        let height = img.height;
        
        // Redimensionner si nécessaire
        if (width > maxWidth || height > maxHeight) {
          const ratio = Math.min(maxWidth / width, maxHeight / height);
          width = width * ratio;
          height = height * ratio;
        }
        
        canvas.width = width;
        canvas.height = height;
        
        const ctx = canvas.getContext('2d');
        ctx.drawImage(img, 0, 0, width, height);
        
        // Convertir en JPEG avec compression
        canvas.toBlob(
          (blob) => {
            const compressedReader = new FileReader();
            compressedReader.onload = (e2) => {
              const base64 = e2.target.result.split(',')[1];
              const compressionRatio = ((1 - blob.size / file.size) * 100).toFixed(0);
              console.log(`📷 Photo compressée: ${(file.size/1024).toFixed(0)}KB → ${(blob.size/1024).toFixed(0)}KB (-${compressionRatio}%)`);
              resolve(base64);
            };
            compressedReader.readAsDataURL(blob);
          },
          'image/jpeg',
          quality
        );
      };
      img.onerror = reject;
      img.src = e.target.result;
    };
    reader.onerror = reject;
    reader.readAsDataURL(file);
  });
}

// Gérer upload photo
async function handlePhotoUpload(itemId, event) {
  const file = event.target.files[0];
  if (!file) return;
  
  // Vérifier taille originale (max 20MB)
  if (file.size > 20 * 1024 * 1024) {
    alert('⚠️ Photo trop volumineuse (max 20MB)');
    return;
  }
  
  try {
    // Afficher loader
    const itemEl = document.getElementById(`item-${itemId}`);
    if (itemEl) {
      itemEl.style.opacity = '0.6';
    }
    
    // Compresser image
    const base64 = await compressImage(file, 1920, 1080, 0.8);
    
    const item = checklistItems.find(i => i.id === itemId);
    if (item) {
      item.photo_base64 = base64;
      item.photo_filename = file.name;
      await saveItem(itemId);
      renderChecklist(); // Re-render pour afficher photo
    }
    
    // Retirer loader
    if (itemEl) {
      itemEl.style.opacity = '1';
    }
    
  } catch (error) {
    console.error('Erreur compression photo:', error);
    alert('⚠️ Erreur traitement photo');
  }
}

// Planifier auto-save (3 secondes après dernière modification)
function scheduleAutoSave(itemId) {
  clearTimeout(autoSaveTimer);
  autoSaveTimer = setTimeout(() => saveItem(itemId), 3000);
}

// Sauvegarder item (avec mode offline)
async function saveItem(itemId) {
  const item = checklistItems.find(i => i.id === itemId);
  if (!item) return;
  
  const commentEl = document.getElementById(`comment-${itemId}`);
  const commentaire = commentEl ? commentEl.value : '';
  const technicienNom = document.querySelector('[data-technicien-nom]')?.dataset.technicienNom || 'Technicien';
  
  const updateData = {
    statut: item.statut,
    conformite: item.conformite,
    commentaire: commentaire,
    photo_base64: item.photo_base64 || null,
    photo_filename: item.photo_filename || null,
    technicien_nom: technicienNom
  };
  
  // Sauvegarder TOUJOURS en localStorage (backup offline)
  safeLocalStorageSet(STORAGE_KEY, JSON.stringify(checklistItems));
  
  if (isOnline) {
    // Mode online : envoyer au serveur
    try {
      await fetch(`/api/checklist/${itemId}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(updateData)
      });
      showSaveIndicator('✅ Sauvegardé');
    } catch (error) {
      console.error('Erreur sauvegarde online:', error);
      // Ajouter à la queue de sync
      addToSyncQueue(itemId, updateData);
      showSaveIndicator('💾 Sauvegardé localement', '#f59e0b');
    }
  } else {
    // Mode offline : ajouter à la queue
    addToSyncQueue(itemId, updateData);
    showSaveIndicator('💾 Sauvegardé localement', '#f59e0b');
  }
}

// Ajouter changement à la queue de sync
function addToSyncQueue(itemId, data) {
  const queue = JSON.parse(safeLocalStorageGet(SYNC_QUEUE_KEY) || '[]');
  
  // Remplacer si item déjà dans queue
  const existingIndex = queue.findIndex(q => q.itemId === itemId);
  if (existingIndex >= 0) {
    queue[existingIndex] = { itemId, data, timestamp: Date.now() };
  } else {
    queue.push({ itemId, data, timestamp: Date.now() });
  }
  
  safeLocalStorageSet(SYNC_QUEUE_KEY, JSON.stringify(queue));
  console.log(`📦 Item ${itemId} ajouté à la queue de sync (${queue.length} en attente)`);
}

// Synchroniser changements en attente
async function syncPendingChanges() {
  const queue = JSON.parse(safeLocalStorageGet(SYNC_QUEUE_KEY) || '[]');
  
  if (queue.length === 0) {
    console.log('✅ Aucun changement en attente');
    return;
  }
  
  console.log(`🔄 Sync ${queue.length} changements en attente...`);
  let successCount = 0;
  
  for (const change of queue) {
    try {
      await fetch(`/api/checklist/${change.itemId}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(change.data)
      });
      successCount++;
    } catch (error) {
      console.error(`❌ Erreur sync item ${change.itemId}:`, error);
      // Garder dans la queue si échec
      break;
    }
  }
  
  // Retirer items synchronisés de la queue
  if (successCount > 0) {
    const remainingQueue = queue.slice(successCount);
    safeLocalStorageSet(SYNC_QUEUE_KEY, JSON.stringify(remainingQueue));
    console.log(`✅ ${successCount}/${queue.length} changements synchronisés`);
    
    if (remainingQueue.length === 0) {
      alert(`✅ Tous vos changements ont été synchronisés avec succès !`);
    }
  }
}

// Afficher indicateur sauvegarde
function showSaveIndicator(text = '✅ Sauvegardé', color = '#10b981') {
  const indicator = document.getElementById('saveIndicator');
  if (indicator) {
    indicator.textContent = text;
    indicator.style.background = color;
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
  
  if (window.confirm('Marquer la mission comme TERMINÉE ?\n\n💡 Vous pourrez toujours modifier la checklist, ajouter des photos et des commentaires après.')) {
    try {
      await fetch(`/api/ordres-mission/${missionId}/statut`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ statut: 'TERMINE' })
      });
      
      // Proposer de voir le rapport
      const voirRapport = window.confirm('✅ Mission terminée !\n\n📄 Voulez-vous consulter le rapport final ?\n\n💡 Vous pourrez revenir sur cette page pour modifier la checklist et ajouter des photos.');
      
      if (voirRapport) {
        window.open(`/api/ordres-mission/${missionId}/rapport-final`, '_blank');
        setTimeout(() => {
          window.location.href = '/';
        }, 500);
      } else {
        window.location.href = '/';
      }
    } catch (error) {
      alert('Erreur mise à jour statut');
      console.error(error);
    }
  }
}

// ========================================
// PHOTOS MULTIPLES PAR ITEM (Nouveau système)
// ========================================

// Ouvrir sélecteur photos
function openPhotoUploader(itemId) {
  document.getElementById(`photo-input-${itemId}`).click();
}

// Gérer upload photos multiples
async function handleMultiPhotoUpload(itemId, event) {
  const files = event.target.files;
  if (!files || files.length === 0) return;
  
  showSaveIndicator(`📤 Upload ${files.length} photo(s)...`, '#3b82f6');
  
  for (let i = 0; i < files.length; i++) {
    const file = files[i];
    
    // Vérifier taille (max 5 MB)
    if (file.size > 5 * 1024 * 1024) {
      alert(`❌ Photo "${file.name}" trop lourde (max 5 MB)`);
      continue;
    }
    
    try {
      // Compresser image
      const base64 = await compressImage(file);
      
      // Upload via API
      const response = await fetch(`/api/checklist/${missionId}/item/${itemId}/photos`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          photo_base64: base64,
          photo_filename: file.name,
          commentaire: null
        })
      });
      
      const data = await response.json();
      
      if (!data.success) {
        throw new Error(data.error || 'Erreur upload');
      }
      
      console.log(`✅ Photo ${i+1}/${files.length} uploadée (ID: ${data.photo_id})`);
      
    } catch (error) {
      console.error(`❌ Erreur upload photo ${file.name}:`, error);
      alert(`Erreur upload ${file.name}: ${error.message}`);
    }
  }
  
  // Recharger galerie photos
  await loadItemPhotos(itemId);
  showSaveIndicator(`✅ ${files.length} photo(s) uploadée(s)`, '#10b981');
  
  // Reset input
  event.target.value = '';
}

// Charger photos d'un item
async function loadItemPhotos(itemId) {
  try {
    const response = await fetch(`/api/checklist/${missionId}/item/${itemId}/photos`);
    const data = await response.json();
    
    if (!data.success) {
      console.error('Erreur chargement photos:', data.error);
      return;
    }
    
    const photos = data.photos || [];
    const gallery = document.getElementById(`photos-gallery-${itemId}`);
    const counter = document.getElementById(`photo-count-${itemId}`);
    
    if (counter) {
      counter.textContent = photos.length;
    }
    
    if (!gallery) return;
    
    if (photos.length === 0) {
      gallery.innerHTML = '<p class="text-sm text-gray-400 col-span-3 text-center py-2">Aucune photo</p>';
      return;
    }
    
    gallery.innerHTML = photos.map(photo => `
      <div class="relative group">
        <div class="aspect-square bg-gray-100 rounded overflow-hidden cursor-pointer"
             onclick="viewPhoto(${itemId}, ${photo.id})">
          <div class="w-full h-full flex items-center justify-center">
            <i class="fas fa-image text-2xl text-gray-400"></i>
          </div>
        </div>
        <button class="absolute top-1 right-1 bg-red-500 text-white rounded-full w-6 h-6 flex items-center justify-center opacity-0 group-hover:opacity-100 transition"
                onclick="deletePhoto(${itemId}, ${photo.id}, event)">
          <i class="fas fa-times text-xs"></i>
        </button>
        <div class="text-xs text-gray-500 mt-1 truncate">${photo.photo_filename || 'Photo'}</div>
      </div>
    `).join('');
    
  } catch (error) {
    console.error('Erreur chargement photos:', error);
  }
}

// Voir photo en grand (avec Base64)
async function viewPhoto(itemId, photoId) {
  try {
    const response = await fetch(`/api/checklist/item/${itemId}/photo/${photoId}`);
    const data = await response.json();
    
    if (!data.success || !data.photo) {
      alert('Erreur chargement photo');
      return;
    }
    
    const photo = data.photo;
    
    // Créer lightbox
    const lightbox = document.createElement('div');
    lightbox.id = 'photo-lightbox';
    lightbox.style.cssText = 'position:fixed;top:0;left:0;right:0;bottom:0;background:rgba(0,0,0,0.9);z-index:1000;display:flex;align-items:center;justify-content:center;';
    lightbox.onclick = () => lightbox.remove();
    
    const img = document.createElement('img');
    img.src = `data:image/jpeg;base64,${photo.photo_base64}`;
    img.style.cssText = 'max-width:90%;max-height:90%;object-fit:contain;';
    
    lightbox.appendChild(img);
    document.body.appendChild(lightbox);
    
  } catch (error) {
    console.error('Erreur affichage photo:', error);
    alert('Erreur affichage photo');
  }
}

// Supprimer photo
async function deletePhoto(itemId, photoId, event) {
  event.stopPropagation();
  
  if (!confirm('Supprimer cette photo ?')) return;
  
  try {
    const response = await fetch(`/api/checklist/item/${itemId}/photo/${photoId}`, {
      method: 'DELETE'
    });
    
    const data = await response.json();
    
    if (!data.success) {
      throw new Error(data.error || 'Erreur suppression');
    }
    
    showSaveIndicator('🗑️ Photo supprimée', '#ef4444');
    await loadItemPhotos(itemId);
    
  } catch (error) {
    console.error('Erreur suppression photo:', error);
    alert('Erreur suppression photo');
  }
}

// Charger photos pour tous les items au démarrage
async function loadAllPhotos() {
  for (const item of checklistItems) {
    await loadItemPhotos(item.id);
  }
}

// ==========================================
// COMMENTAIRE FINAL MISSION
// ==========================================

// Charger commentaire final
async function loadCommentaireFinal() {
  try {
    const localData = safeLocalStorageGet(COMMENTAIRE_FINAL_KEY);
    
    if (isOnline) {
      const response = await fetch(`/api/ordres-mission/${missionId}/commentaire-final`);
      const data = await response.json();
      commentaireFinal = data.data?.commentaire_final || '';
      safeLocalStorageSet(COMMENTAIRE_FINAL_KEY, commentaireFinal);
    } else if (localData) {
      commentaireFinal = localData;
    }
    
    renderCommentaireFinal();
  } catch (error) {
    console.error('Erreur chargement commentaire final:', error);
  }
}

// Afficher section commentaire final
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
          <span id="photosGeneralesCount" class="text-xs text-gray-500">
            ${photosGenerales.length} photo(s)
          </span>
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
    </div>
  `;
  
  // Event listener textarea auto-save
  const textarea = document.getElementById('commentaire-final-textarea');
  textarea?.addEventListener('input', (e) => {
    commentaireFinal = e.target.value;
    debounceSaveCommentaireFinal();
  });
  
  // Event listener upload photos
  const input = document.getElementById('photosGeneralesInput');
  input?.addEventListener('change', handlePhotosGeneralesUpload);
  
  renderPhotosGenerales();
}

// Sauvegarder commentaire final (debounce 1s)
let commentaireFinalTimer = null;
function debounceSaveCommentaireFinal() {
  clearTimeout(commentaireFinalTimer);
  commentaireFinalTimer = setTimeout(saveCommentaireFinal, 1000);
}

async function saveCommentaireFinal() {
  try {
    safeLocalStorageSet(COMMENTAIRE_FINAL_KEY, commentaireFinal);
    
    if (!isOnline) {
      showSaveIndicator('💾 Sauvegardé localement', '#f59e0b');
      return;
    }
    
    const response = await fetch(`/api/ordres-mission/${missionId}/commentaire-final`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ commentaire_final: commentaireFinal })
    });
    
    const data = await response.json();
    if (data.success) {
      showSaveIndicator('✅ Commentaire sauvegardé', '#10b981');
    }
  } catch (error) {
    console.error('Erreur save commentaire final:', error);
    showSaveIndicator('⚠️ Erreur sauvegarde', '#ef4444');
  }
}

// ==========================================
// PHOTOS GÉNÉRALES MISSION
// ==========================================

// Charger photos générales
async function loadPhotosGenerales() {
  try {
    const localData = safeLocalStorageGet(PHOTOS_GENERALES_KEY);
    
    if (isOnline) {
      const response = await fetch(`/api/ordres-mission/${missionId}/photos-generales`);
      const data = await response.json();
      photosGenerales = data.photos || [];
      safeLocalStorageSet(PHOTOS_GENERALES_KEY, JSON.stringify(photosGenerales));
    } else if (localData) {
      photosGenerales = JSON.parse(localData);
    }
    
    renderPhotosGenerales();
  } catch (error) {
    console.error('Erreur chargement photos générales:', error);
  }
}

// Afficher galerie photos générales
function renderPhotosGenerales() {
  const gallery = document.getElementById('photosGeneralesGallery');
  const countSpan = document.getElementById('photosGeneralesCount');
  
  if (!gallery) return;
  
  if (countSpan) {
    countSpan.textContent = `${photosGenerales.length} photo(s)`;
  }
  
  if (photosGenerales.length === 0) {
    gallery.innerHTML = `
      <div class="col-span-3 text-center text-gray-400 py-6">
        <i class="fas fa-images text-4xl mb-2"></i>
        <p class="text-sm">Aucune photo générale</p>
      </div>
    `;
    return;
  }
  
  gallery.innerHTML = photosGenerales.map(photo => `
    <div class="relative bg-white rounded-lg shadow-md overflow-hidden group">
      <div 
        class="w-full h-24 bg-gradient-to-br from-blue-100 to-blue-200 flex items-center justify-center cursor-pointer"
        onclick="viewPhotoGenerale(${photo.id})"
      >
        <i class="fas fa-image text-3xl text-blue-400"></i>
      </div>
      <button 
        onclick="deletePhotoGenerale(${photo.id})"
        class="absolute top-1 right-1 bg-red-600 text-white rounded-full w-6 h-6 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity"
      >
        <i class="fas fa-times text-xs"></i>
      </button>
      <p class="text-xs text-gray-600 p-1 truncate">${photo.filename}</p>
    </div>
  `).join('');
}

// Upload photos générales
async function handlePhotosGeneralesUpload(event) {
  const files = Array.from(event.target.files);
  if (files.length === 0) return;
  
  showSaveIndicator(`📤 Upload ${files.length} photo(s)...`, '#3b82f6');
  
  for (const file of files) {
    try {
      const compressed = await compressImage(file);
      
      const photoData = {
        photo_base64: compressed,
        filename: file.name,
        description: 'Photo générale mission'
      };
      
      if (!isOnline) {
        // Mode offline : stocker en attente
        photosGenerales.push({ ...photoData, id: Date.now(), uploaded_at: new Date().toISOString() });
        safeLocalStorageSet(PHOTOS_GENERALES_KEY, JSON.stringify(photosGenerales));
        showSaveIndicator('💾 Photo sauvegardée localement', '#f59e0b');
      } else {
        const response = await fetch(`/api/ordres-mission/${missionId}/photos-generales`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(photoData)
        });
        
        const data = await response.json();
        if (data.success) {
          await loadPhotosGenerales();
          showSaveIndicator('✅ Photo uploadée', '#10b981');
        }
      }
    } catch (error) {
      console.error('Erreur upload photo générale:', error);
      alert('Erreur upload photo');
    }
  }
  
  event.target.value = '';
}

// Voir photo générale (lightbox)
async function viewPhotoGenerale(photoId) {
  try {
    const response = await fetch(`/api/ordres-mission/${missionId}/photos-generales/${photoId}`);
    const data = await response.json();
    
    if (data.success && data.photo) {
      const modal = document.createElement('div');
      modal.className = 'fixed inset-0 bg-black bg-opacity-90 z-50 flex items-center justify-center p-4';
      modal.onclick = () => modal.remove();
      
      modal.innerHTML = `
        <div class="relative max-w-4xl max-h-full">
          <img src="${data.photo.photo_base64}" class="max-w-full max-h-screen rounded-lg shadow-2xl">
          <button onclick="this.parentElement.parentElement.remove()" class="absolute top-4 right-4 bg-white text-black px-4 py-2 rounded-full hover:bg-gray-200">
            <i class="fas fa-times"></i> Fermer
          </button>
          <div class="absolute bottom-4 left-4 right-4 bg-white bg-opacity-90 p-3 rounded-lg">
            <p class="font-semibold">${data.photo.filename}</p>
            <p class="text-xs text-gray-600">${new Date(data.photo.uploaded_at).toLocaleString('fr-FR')}</p>
          </div>
        </div>
      `;
      
      document.body.appendChild(modal);
    }
  } catch (error) {
    console.error('Erreur affichage photo:', error);
    alert('Erreur affichage photo');
  }
}

// Supprimer photo générale
async function deletePhotoGenerale(photoId) {
  if (!confirm('Supprimer cette photo ?')) return;
  
  try {
    if (isOnline) {
      const response = await fetch(`/api/ordres-mission/photos-generales/${photoId}`, {
        method: 'DELETE'
      });
      
      const data = await response.json();
      if (data.success) {
        await loadPhotosGenerales();
        showSaveIndicator('🗑️ Photo supprimée', '#ef4444');
      }
    } else {
      photosGenerales = photosGenerales.filter(p => p.id !== photoId);
      safeLocalStorageSet(PHOTOS_GENERALES_KEY, JSON.stringify(photosGenerales));
      renderPhotosGenerales();
      showSaveIndicator('🗑️ Suppression locale', '#f59e0b');
    }
  } catch (error) {
    console.error('Erreur suppression photo:', error);
    alert('Erreur suppression photo');
  }
}

// Charger au démarrage page
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', async () => {
    await loadChecklist();
    await loadAllPhotos();
  });
} else {
  loadChecklist().then(() => loadAllPhotos());
}
