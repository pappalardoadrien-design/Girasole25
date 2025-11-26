// ============================================
// GESTION ATTRIBUTION CENTRALES SOUS-TRAITANTS
// ============================================

let selectedCentrales = [];
let currentSousTraitant = null;
let soustraitants = [];
let centrales = [];

// Charger les données d'attribution
async function loadAttributionData() {
    console.log('🤝 Chargement données attribution');
    
    try {
        // Charger sous-traitants
        const stResponse = await fetch('/api/sous-traitants');
        const stData = await stResponse.json();
        soustraitants = stData.data || [];
        
        // Charger centrales
        const cResponse = await fetch('/api/centrales');
        const cData = await cResponse.json();
        centrales = cData.data || [];
        
        // Charger historique
        const hResponse = await fetch('/api/attributions');
        const hData = await hResponse.json();
        
        // Afficher
        renderSousTraitants();
        renderCentrales();
        renderAttributionsHistory(hData.data || []);
        
    } catch (error) {
        console.error('❌ Erreur chargement attribution:', error);
        alert('Erreur lors du chargement des données');
    }
}

// Afficher liste sous-traitants
function renderSousTraitants() {
    const select = document.getElementById('select-soustraitant');
    if (!select) return;
    
    select.innerHTML = '<option value="">-- Sélectionner un sous-traitant --</option>';
    
    soustraitants.forEach(st => {
        const option = document.createElement('option');
        option.value = st.id;
        option.textContent = `${st.nom_entreprise} (${st.contact_principal || 'N/A'})`;
        option.dataset.email = st.email_contact;
        option.dataset.telephone = st.telephone;
        select.appendChild(option);
    });
    
    // Event listener
    select.onchange = function() {
        const stId = parseInt(this.value);
        currentSousTraitant = soustraitants.find(st => st.id === stId);
        updateSousTraitantInfo();
    };
}

// Mettre à jour info sous-traitant
function updateSousTraitantInfo() {
    const infoDiv = document.getElementById('soustraitant-info');
    if (!infoDiv) return;
    
    if (!currentSousTraitant) {
        infoDiv.innerHTML = '<span class="text-gray-500">Sélectionnez un sous-traitant</span>';
        return;
    }
    
    infoDiv.innerHTML = `
        <div class="space-y-1">
            <div><i class="fas fa-envelope mr-2 text-blue-600"></i>${currentSousTraitant.email_contact || 'N/A'}</div>
            <div><i class="fas fa-phone mr-2 text-green-600"></i>${currentSousTraitant.telephone || 'N/A'}</div>
        </div>
    `;
}

// Afficher liste centrales
function renderCentrales() {
    const container = document.getElementById('centrales-list');
    if (!container) return;
    
    const searchTerm = document.getElementById('search-attribution')?.value.toLowerCase() || '';
    
    const filtered = centrales.filter(c => 
        c.nom.toLowerCase().includes(searchTerm) ||
        (c.localisation && c.localisation.toLowerCase().includes(searchTerm)) ||
        (c.dept && c.dept.toLowerCase().includes(searchTerm))
    );
    
    if (filtered.length === 0) {
        container.innerHTML = '<p class="text-gray-500 text-center py-4">Aucune centrale trouvée</p>';
        return;
    }
    
    container.innerHTML = filtered.map(c => `
        <label class="flex items-center p-3 border rounded hover:bg-blue-50 cursor-pointer transition">
            <input 
                type="checkbox" 
                value="${c.id}" 
                class="centrale-checkbox w-5 h-5 text-blue-600 mr-3"
                onchange="toggleCentrale(${c.id})"
                ${selectedCentrales.includes(c.id) ? 'checked' : ''}
            >
            <div class="flex-1">
                <div class="font-medium">${c.nom}</div>
                <div class="text-sm text-gray-600">
                    ${c.type_centrale || c.type} | ${c.puissance_kwc} kWc | Dept ${c.dept || 'N/A'}
                    ${c.sous_traitant_nom ? `<span class="text-orange-600 ml-2">⚠️ Déjà attribué: ${c.sous_traitant_nom}</span>` : ''}
                </div>
            </div>
        </label>
    `).join('');
    
    updateSelectedCount();
}

// Toggle sélection centrale
function toggleCentrale(centraleId) {
    const index = selectedCentrales.indexOf(centraleId);
    if (index > -1) {
        selectedCentrales.splice(index, 1);
    } else {
        selectedCentrales.push(centraleId);
    }
    updateSelectedCount();
}

// Tout sélectionner
function selectAllCentrales() {
    selectedCentrales = centrales.map(c => c.id);
    renderCentrales();
}

// Tout désélectionner
function deselectAllCentrales() {
    selectedCentrales = [];
    renderCentrales();
}

// Mettre à jour compteur sélection
function updateSelectedCount() {
    const countSpan = document.getElementById('selected-count');
    if (countSpan) {
        countSpan.textContent = selectedCentrales.length;
    }
}

// Générer email personnalisé
function generateEmail() {
    if (!currentSousTraitant) {
        alert('⚠️ Veuillez sélectionner un sous-traitant');
        return;
    }
    
    if (selectedCentrales.length === 0) {
        alert('⚠️ Veuillez sélectionner au moins une centrale');
        return;
    }
    
    const selectedCentralesData = centrales.filter(c => selectedCentrales.includes(c.id));
    
    // Générer email
    const email = `
Objet: Demande de Tarification - Audit Qualité Photovoltaïque (${selectedCentrales.length} centrale${selectedCentrales.length > 1 ? 's' : ''})

Bonjour ${currentSousTraitant.contact_principal || currentSousTraitant.nom_entreprise},

Dans le cadre de notre programme d'audits qualité photovoltaïques 2025, nous souhaitons vous solliciter pour réaliser les audits des centrales suivantes :

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📋 LISTE DES CENTRALES (${selectedCentrales.length})
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

${selectedCentralesData.map((c, i) => `
${i + 1}. ${c.nom}
   • Type: ${c.type_centrale || c.type}
   • Puissance: ${c.puissance_kwc} kWc
   • Localisation: ${c.dept ? `Département ${c.dept}` : c.localisation || 'N/A'}
   • Adresse: ${c.adresse || 'À communiquer'}
`).join('')}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔍 DÉTAILS DE LA MISSION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Type d'audit: Audit Qualité Commissioning post-installation

Prestations incluses:
✅ Thermographie drone/sol (selon DTU NF EN 62446-3)
✅ Électroluminescence nocturne (analyse PID, LID, microfissures)
✅ Courbes I-V (sombres + référence, validation IEC 60904-1)
✅ Tests d'isolement DC (> 1 MΩ, seuil NF C 15-100)
✅ Monitoring (analyse production vs prévisionnel)
✅ Contrôle visuel/mécanique (fixations, câblage, connectique MC4)
✅ Rapport normé PDF (< 5 jours ouvrés)

Normes applicables: IEC 62446-1, IEC 61215/61730, NF C 15-100, UTE C 15-712-1

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💰 DEMANDE DE TARIFICATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Pourriez-vous nous communiquer votre tarification pour ces ${selectedCentrales.length} centrale${selectedCentrales.length > 1 ? 's' : ''} ?

Merci de préciser:
• Tarif unitaire par centrale (HT)
• Tarif total (HT)
• Délais d'intervention proposés
• Disponibilité janvier-février 2025

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📅 PLANNING & CONTACT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Date souhaitée: Janvier-Février 2025
Réponse attendue: Sous 5 jours ouvrés

Pour toute question:
📧 adrien@diagpv.fr
📞 [Votre numéro]

Nous restons à votre disposition pour toute précision.

Cordialement,

Adrien PAPPALARDO
Diagnostic Photovoltaïque
www.diagpv.fr
`.trim();
    
    // Afficher dans preview
    const preview = document.getElementById('email-preview');
    if (preview) {
        preview.textContent = email;
        preview.classList.remove('text-gray-500');
        preview.classList.add('text-gray-800');
    }
}

// Copier email dans presse-papiers
function copyEmail() {
    const preview = document.getElementById('email-preview');
    if (!preview || !preview.textContent || preview.textContent.includes('Cliquez sur')) {
        alert('⚠️ Générez d\'abord l\'email');
        return;
    }
    
    navigator.clipboard.writeText(preview.textContent).then(() => {
        alert('✅ Email copié dans le presse-papiers !');
    }).catch(err => {
        console.error('Erreur copie:', err);
        alert('❌ Erreur lors de la copie');
    });
}

// Enregistrer attribution
async function saveAttribution() {
    if (!currentSousTraitant) {
        alert('⚠️ Veuillez sélectionner un sous-traitant');
        return;
    }
    
    if (selectedCentrales.length === 0) {
        alert('⚠️ Veuillez sélectionner au moins une centrale');
        return;
    }
    
    const confirmMsg = `Confirmer l'attribution de ${selectedCentrales.length} centrale(s) à ${currentSousTraitant.nom_entreprise} ?`;
    if (!confirm(confirmMsg)) return;
    
    try {
        const response = await fetch('/api/attributions', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                centrale_ids: selectedCentrales,
                sous_traitant_id: currentSousTraitant.id,
                notes: `Attribution depuis interface le ${new Date().toLocaleDateString('fr-FR')}`
            })
        });
        
        const data = await response.json();
        
        if (data.success) {
            alert(`✅ Attribution enregistrée avec succès (${data.data.count} centrale(s))`);
            
            // Réinitialiser
            selectedCentrales = [];
            document.getElementById('select-soustraitant').value = '';
            currentSousTraitant = null;
            updateSousTraitantInfo();
            
            // Recharger
            loadAttributionData();
        } else {
            alert(`❌ Erreur: ${data.error}`);
        }
    } catch (error) {
        console.error('Erreur sauvegarde:', error);
        alert('❌ Erreur lors de l\'enregistrement');
    }
}

// Afficher historique attributions
function renderAttributionsHistory(attributions) {
    const container = document.getElementById('attributions-history');
    if (!container) return;
    
    if (attributions.length === 0) {
        container.innerHTML = '<p class="text-gray-500 text-center py-4">Aucune attribution enregistrée</p>';
        return;
    }
    
    container.innerHTML = attributions.slice(0, 20).map(a => {
        const statusColors = {
            'EN_ATTENTE': 'bg-gray-100 text-gray-800',
            'DEVIS_ENVOYE': 'bg-blue-100 text-blue-800',
            'ACCEPTE': 'bg-green-100 text-green-800',
            'REFUSE': 'bg-red-100 text-red-800',
            'TERMINE': 'bg-purple-100 text-purple-800'
        };
        
        const statusColor = statusColors[a.statut] || 'bg-gray-100 text-gray-800';
        
        return `
            <div class="border rounded p-4 hover:bg-gray-50">
                <div class="flex items-center justify-between mb-2">
                    <div class="font-medium">${a.centrale_nom}</div>
                    <span class="px-3 py-1 rounded-full text-xs font-medium ${statusColor}">
                        ${a.statut.replace('_', ' ')}
                    </span>
                </div>
                <div class="text-sm text-gray-600 space-y-1">
                    <div><i class="fas fa-building mr-2 text-blue-600"></i>${a.sous_traitant_nom}</div>
                    <div><i class="fas fa-calendar mr-2 text-green-600"></i>${new Date(a.date_attribution).toLocaleDateString('fr-FR')}</div>
                    ${a.email_envoye ? '<div><i class="fas fa-envelope mr-2 text-orange-600"></i>Email envoyé</div>' : ''}
                    ${a.tarif_propose ? `<div><i class="fas fa-euro-sign mr-2 text-purple-600"></i>${a.tarif_propose} € HT</div>` : ''}
                </div>
                ${a.notes ? `<div class="mt-2 text-xs text-gray-500 italic">${a.notes}</div>` : ''}
            </div>
        `;
    }).join('');
}

// Event listener recherche
document.addEventListener('DOMContentLoaded', () => {
    const searchInput = document.getElementById('search-attribution');
    if (searchInput) {
        searchInput.addEventListener('input', renderCentrales);
    }
});
