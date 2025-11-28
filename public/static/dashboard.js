/**
 * Dashboard GIRASOLE - Dynamique avec données réelles
 * Version: 2.4.5
 * Date: 28/11/2024
 */

// Variables globales pour les graphiques
let chartStatut = null;
let chartType = null;

/**
 * Charger toutes les données du Dashboard
 */
async function loadDashboard() {
    console.log('📊 Chargement Dashboard...');
    
    try {
        // Récupérer toutes les données en parallèle
        const [centralesRes, ordresRes, sousTraitantsRes] = await Promise.all([
            fetch('/api/centrales'),
            fetch('/api/ordres-mission'),
            fetch('/api/sous-traitants')
        ]);

        const centralesData = await centralesRes.json();
        const ordresData = await ordresRes.json();
        const sousTraitantsData = await sousTraitantsRes.json();

        const centrales = centralesData.data || [];
        const ordres = ordresData.data || [];
        const sousTraitants = sousTraitantsData.data || [];

        console.log('✅ Données récupérées:', {
            centrales: centrales.length,
            ordres: ordres.length,
            sousTraitants: sousTraitants.length
        });

        // Mettre à jour les statistiques
        updateStats(centrales, ordres);

        // Mettre à jour les graphiques
        updateCharts(centrales, ordres, sousTraitants);

        // Mettre à jour la volumétrie
        updateVolumetrie(centrales, ordres);

    } catch (error) {
        console.error('❌ Erreur chargement Dashboard:', error);
        showError('Erreur lors du chargement des données');
    }
}

/**
 * Mettre à jour les cartes statistiques
 */
function updateStats(centrales, ordres) {
    // Total centrales
    document.getElementById('stat-total').textContent = centrales.length;

    // Compter les centrales par statut
    const statutCounts = {
        A_AUDITER: 0,
        EN_COURS: 0,
        TERMINE: 0,
        VALIDE: 0
    };

    centrales.forEach(c => {
        const statut = c.statut || 'A_AUDITER';
        if (statutCounts.hasOwnProperty(statut)) {
            statutCounts[statut]++;
        }
    });

    // Auditées = EN_COURS + TERMINE + VALIDE
    const auditees = statutCounts.EN_COURS + statutCounts.TERMINE + statutCounts.VALIDE;
    document.getElementById('stat-auditees').textContent = auditees;

    // Validées = VALIDE
    document.getElementById('stat-validees').textContent = statutCounts.VALIDE;

    // Missions total = ordres de mission
    document.getElementById('stat-photos').textContent = ordres.length;
}

/**
 * Mettre à jour les graphiques
 */
function updateCharts(centrales, ordres, sousTraitants) {
    updateChartStatut(centrales);
    updateChartType(centrales);
}

/**
 * Graphique : Répartition par Statut
 */
function updateChartStatut(centrales) {
    const canvas = document.getElementById('chartStatut');
    if (!canvas) return;

    const ctx = canvas.getContext('2d');

    // Compter par statut
    const statutCounts = {
        'À auditer': 0,
        'En cours': 0,
        'Terminé': 0,
        'Validé': 0
    };

    centrales.forEach(c => {
        const statut = c.statut || 'A_AUDITER';
        switch(statut) {
            case 'A_AUDITER':
                statutCounts['À auditer']++;
                break;
            case 'EN_COURS':
                statutCounts['En cours']++;
                break;
            case 'TERMINE':
                statutCounts['Terminé']++;
                break;
            case 'VALIDE':
                statutCounts['Validé']++;
                break;
        }
    });

    // Détruire ancien graphique
    if (chartStatut) {
        chartStatut.destroy();
    }

    // Créer nouveau graphique
    chartStatut = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: Object.keys(statutCounts),
            datasets: [{
                data: Object.values(statutCounts),
                backgroundColor: [
                    '#FCD34D', // Jaune - À auditer
                    '#60A5FA', // Bleu - En cours
                    '#34D399', // Vert - Terminé
                    '#A78BFA'  // Violet - Validé
                ],
                borderWidth: 2,
                borderColor: '#ffffff'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            plugins: {
                legend: {
                    position: 'bottom',
                    labels: {
                        padding: 15,
                        font: {
                            size: 12
                        }
                    }
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            const label = context.label || '';
                            const value = context.parsed || 0;
                            const total = context.dataset.data.reduce((a, b) => a + b, 0);
                            const percentage = total > 0 ? Math.round((value / total) * 100) : 0;
                            return `${label}: ${value} (${percentage}%)`;
                        }
                    }
                }
            }
        }
    });
}

/**
 * Graphique : SOL vs TOITURE
 */
function updateChartType(centrales) {
    const canvas = document.getElementById('chartType');
    if (!canvas) return;

    const ctx = canvas.getContext('2d');

    // Compter par type
    const typeCounts = {
        'SOL': 0,
        'TOITURE': 0,
        'OMBRIERE': 0
    };

    centrales.forEach(c => {
        const type = c.type || 'SOL';
        if (typeCounts.hasOwnProperty(type)) {
            typeCounts[type]++;
        }
    });

    // Détruire ancien graphique
    if (chartType) {
        chartType.destroy();
    }

    // Créer nouveau graphique
    chartType = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: Object.keys(typeCounts),
            datasets: [{
                label: 'Nombre de centrales',
                data: Object.values(typeCounts),
                backgroundColor: [
                    '#3B82F6', // Bleu - SOL
                    '#EF4444', // Rouge - TOITURE
                    '#10B981'  // Vert - OMBRIERE
                ],
                borderWidth: 0
            }]
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
                    display: false
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            const value = context.parsed.y || 0;
                            const total = context.dataset.data.reduce((a, b) => a + b, 0);
                            const percentage = total > 0 ? Math.round((value / total) * 100) : 0;
                            return `${value} centrales (${percentage}%)`;
                        }
                    }
                }
            }
        }
    });
}

/**
 * Mettre à jour la volumétrie
 */
function updateVolumetrie(centrales, ordres) {
    // Missions créées = nombre d'ordres de mission
    const missionsCreees = ordres.length;
    document.getElementById('vol-json').textContent = missionsCreees;

    // Missions planifiées = ordres avec date_mission
    const missionsPlanifiees = ordres.filter(om => om.date_mission).length;
    document.getElementById('vol-photos').textContent = missionsPlanifiees;
}

/**
 * Afficher un message d'erreur
 */
function showError(message) {
    console.error('❌', message);
    
    // Mettre des valeurs par défaut
    document.getElementById('stat-total').textContent = '0';
    document.getElementById('stat-auditees').textContent = '0';
    document.getElementById('stat-validees').textContent = '0';
    document.getElementById('stat-photos').textContent = '0';
    document.getElementById('vol-json').textContent = '0';
    document.getElementById('vol-photos').textContent = '0';
}

/**
 * Rafraîchir le Dashboard automatiquement toutes les 30 secondes
 */
function autoRefreshDashboard() {
    // Rafraîchir uniquement si l'onglet Dashboard est visible
    const dashboardTab = document.getElementById('tab-dashboard');
    if (dashboardTab && !dashboardTab.classList.contains('hidden')) {
        loadDashboard();
    }
}

// Auto-refresh toutes les 30 secondes
setInterval(autoRefreshDashboard, 30000);

// Exposer la fonction globalement
window.loadDashboard = loadDashboard;

console.log('✅ Dashboard.js chargé');
