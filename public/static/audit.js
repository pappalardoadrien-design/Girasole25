// audit.js - Interface Audit Terrain Mobile avec Auto-Save + Mode Offline

const missionId = parseInt(window.location.pathname.split('/')[2]);
let checklistItems = [];
let autoSaveTimer = null;
let isOnline = navigator.onLine;
let pendingSyncQueue = [];

// LocalStorage keys
const STORAGE_KEY = `audit_mission_${missionId}`;
const SYNC_QUEUE_KEY = `sync_queue_${missionId}`;

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
  
  if (window.confirm('Marquer la mission comme TERMINÉE ?')) {
    try {
      await fetch(`/api/ordres-mission/${missionId}/statut`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ statut: 'TERMINE' })
      });
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
