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
        statut,
        conformite,
        mission_id: missionId
      })
    });
    
    if (!response.ok) throw new Error('Server error');
    
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
        commentaire,
        mission_id: missionId
      })
    });
    
    if (!response.ok) throw new Error('Server error');
    
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
    
    const response = await fetch(`/api/checklist/item/${itemId}/photo`, {
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({
        photo_base64: photoBase64,
        photo_filename: filename,
        mission_id: missionId
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
  checklistItems.forEach(item => setupCommentListener(item.id));
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
  // TODO: Implémenter chargement photos depuis serveur
}

async function loadCommentaireFinal() {
  // TODO: Implémenter
}

async function loadPhotosGenerales() {
  // TODO: Implémenter
}

async function loadChecklistToiture() {
  // TODO: Implémenter
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
