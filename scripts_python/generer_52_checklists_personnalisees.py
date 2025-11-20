#!/usr/bin/env python3
"""
GÉNÉRATEUR 52 CHECKLISTS PERSONNALISÉES - GIRASOLE 2025
Diagnostic Photovoltaïque

Génère 52 checklists HTML personnalisées avec:
- Nom centrale spécifique
- Sections adaptées SOL vs TOITURE
- Upload photos intégré + Base64
- Export JSON local (pas d'API)
- Auto-save LocalStorage

Usage:
    python3 generer_52_checklists_personnalisees.py
"""

import json
from pathlib import Path
from datetime import datetime

def generer_checklist_html(centrale):
    """
    Génère une checklist HTML personnalisée pour une centrale
    
    Args:
        centrale: Dict avec infos centrale (id, nom, type, audit_toiture, etc.)
    
    Returns:
        str: HTML complet de la checklist
    """
    
    centrale_id = centrale['id']
    centrale_nom = centrale['nom']
    puissance = centrale['puissance_kwc']
    type_install = centrale['type']
    dept = centrale['dept']
    adresse = centrale.get('adresse', 'Non renseignée')
    audit_toiture = centrale.get('audit_toiture', 'NON') == 'OUI'
    
    # Sections communes à TOUTES les centrales (CDC GIRASOLE - Audit VISUEL uniquement)
    sections_communes = [
        {
            'id': 'preparation',
            'titre': '🎒 1. PRÉPARATION INTERVENTION',
            'points': [
                'Plan prévention GIRASOLE lu et signé',
                'Habilitations électriques valides (B2V, BR, BC)',
                'EPI complets (casque, gants isolants, chaussures sécurité)',
                'Appareil photo haute résolution (>12 Mpx)',
                'Documents GIRASOLE consultés (plans TCQ, PV réception, autocontrôle, CR visite)',
                'Contact site GIRASOLE prévenu (accès clés shelters/locaux)',
                'Photo panneau signalétique centrale + 4 vues cardinales installation'
            ]
        },
        {
            'id': 'nfc15100',
            'titre': '⚡ 2. CONFORMITÉ NF C 15-100 (Inspection VISUELLE)',
            'points': [
                'AGCP: Réglages calibres VISUELLEMENT cohérents plans TCQ',
                'AGCP: Courbes déclenchement adaptées (C ou D selon charge)',
                'AGCP: Protection différentielle Type B 30 mA DC présente',
                'Sections câbles AC: Marquage sections VISIBLE sur câbles',
                'Sections câbles AC: Adéquation avec protections amont (vérif plans)',
                'Liaison terre: Repérage vert/jaune respecté partout',
                'Liaison terre: Section terre VISIBLE cohérente (mini 16mm² Cu)',
                'Liaison terre: Cosses bimétal Cu/Alu présentes (si jonction)',
                'Indices Protection: Shelters/coffrets IP44 min, boîtes jonction DC IP65 min',
                'Indices Protection: Absence infiltration eau/condensation constatée',
                'Repérage circuits: Schémas unifilaires présents et affichés',
                'Repérage circuits: Identification câbles claire (tags sérigraphiés vs manuscrit)',
                'Distances sécurité: Volumes respectés (pas câbles nus accessibles)',
                'Photos: AGCP complet, tableau électrique, câblage, terre (min 10 photos)'
            ]
        },
        {
            'id': 'utec15712',
            'titre': '🔌 3. CONFORMITÉ UTE C 15-712 (Inspection VISUELLE PV)',
            'points': [
                'Interrupteurs DC: Présence par string ou sectionneur général',
                'Interrupteurs DC: Calibre adapté Isc strings (vérif datasheet)',
                'Interrupteurs DC: Repérage clair position ON/OFF',
                'Parafoudres: Présents côté DC et AC (Type 2 minimum)',
                'Parafoudres: Voyants état OK (pas de défaut)',
                'Parafoudres: Raccordement terre <50 cm (DC) et <1m (AC)',
                'Câbles DC: Tenue UV si exposition (double isolation solaire)',
                'Câbles DC: Couleurs +/- différentes (rouge/noir ou rouge/bleu)',
                'Câbles DC: Pas de raccordements intermédiaires (continuité string)',
                'Boîtes jonction DC: Étanchéité IP65 min (presse-étoupes serrés)',
                'Boîtes jonction DC: Orientation anti-ruissellement eau pluie',
                'Boîtes jonction DC: Absence infiltration/condensation (ouvrir 1 échantillon)',
                'Terre modules PV: Continuité VISUELLE structures PV',
                'Terre modules PV: Cosses bimétal systématiques alu/cuivre',
                'Signalétique DC: Étiquettes "Tension DC dangereuse" présentes',
                'Signalétique DC: Schémas strings affichés, plaques constructeurs lisibles',
                'Photos: Interrupteurs DC, parafoudres, boîtes jonction, signalétique (min 10 photos)'
            ]
        },
        {
            'id': 'pratiques',
            'titre': '🛠️ 4. BONNES/MAUVAISES PRATIQUES (CDC GIRASOLE §2.5)',
            'points': [
                'Chemins câbles: Type fixation (galva chaud/froid/peinture), entraxe <1,5m',
                'Chemins câbles: Qualité assemblage (robuste vs fragile)',
                'Cosses connexions: Bimétal Cu/Alu systématique, technique (sertissage/vissage)',
                'Repérage filerie: Type (sérigraphié/manuscrit/absent), système tenant-aboutissant',
                'Repérage filerie: Durabilité tags (UV-résistants vs papier)',
                'Rayons courbure: AC (R>6×Ø), DC (R>12×Ø), absence contraintes mécaniques',
                'Fourreaux/TPC: Rebouchage (mousse/mortier/non rebouché), étanchéité',
                'Brassage câbles DC: Organisation (clair vs "spaghettis"), attaches UV',
                'Tranchées AC: Respect CDC tranchées GIRASOLE (profondeur, grillage, remblai)',
                'Alignement modules PV: Constat visuel qualité (parfait/décalages)',
                'Plans TCQ: Présents sur place (oui/non)',
                'Photos: Toutes BP/MP détectées (min 12 photos variées)'
            ]
        },
        {
            'id': 'prescriptions',
            'titre': '📋 5. PRESCRIPTIONS GIRASOLE (CDC §2.4)',
            'points': [
                'Autocontrôle installateur: Présent sur site ou fourni',
                'Autocontrôle installateur: Grille renseignée exhaustivement (pas cases vides)',
                'Autocontrôle installateur: Signature installateur + date, cohérent terrain',
                'PV réception lot PV: Document présent',
                'PV réception lot PV: Signé GIRASOLE ET installateur (2 parties)',
                'PV réception lot PV: Date cohérente fin travaux, réserves listées/levées',
                'CR visite chantier: Au moins 1 CR pendant phase travaux lot PV',
                'CR visite chantier: Écarts travaux documentés, actions correctives tracées',
                'CDC tranchées: Profondeur conforme (0,60m min trottoirs, 0,80m autres)',
                'CDC tranchées: Lit sable 10 cm + grillage avertisseur + remblai correct',
                'Corrélation: Écarts audit signalés dans CR chantier GIRASOLE ? (OUI/NON/Partiel)',
                'Photos: Documents (autocontrôle, PV réception) si accessibles (min 4 photos)'
            ]
        }
    ]
    
    # Section spécifique TOITURE (DTU 40.35 + ETN + Notice + démontage 25 panneaux)
    section_toiture = {
        'id': 'toiture',
        'titre': '🏠 6. INSPECTION TOITURE (DTU 40.35 + ETN + Notice - Démontage 25 panneaux)',
        'points': [
            # Sécurité préalable MOP DiagPV
            '⚠️ SÉCURITÉ: Harnais anti-chute enfilé + vérifié (sangle, mousqueton, charge >12 kN)',
            '⚠️ SÉCURITÉ: Ligne vie/point ancrage identifié OU nacelle positionnée stable',
            '⚠️ SÉCURITÉ: Conditions météo (vent <40 km/h, pas pluie, toiture sèche)',
            '⚠️ SÉCURITÉ: INTERDIT ABSOLU = Marcher sur panneaux PV (CDC GIRASOLE §2.6)',
            
            # Démontage 25 panneaux minimum (exigence CDC GIRASOLE §2.2)
            '🔧 DÉMONTAGE: Minimum 25 panneaux démontés (échantillonnage pertinent)',
            '🔧 DÉMONTAGE: 1er + dernier panneau String 1, String 2, String 3 (6 panneaux)',
            '🔧 DÉMONTAGE: Zones critiques (bord toiture vent, près exutoire/faîtage, angle)',
            '🔧 DÉMONTAGE: Suspicions visuelles (décollement, connecteurs exposés)',
            '🔧 DÉMONTAGE: Remontage sans atteindre intégrité panneaux/supports',
            
            # Fixation SI/Support (DTU 40.35 Article 6 - Étanchéité percements)
            '🔩 FIXATION SI: Dépose 1 profil complet SI pour inspection boulonnerie',
            '🔩 FIXATION SI: Boulonnerie inox A4 (marin) ou A2 (standard), serrage couple-mètre si possible',
            '🔩 FIXATION SI: Étanchéité percements Kalzips/bac acier (intacts, pas fissurés/déformés)',
            '🔩 FIXATION SI: Joints EPDM présents et écrasés correctement',
            '🔩 FIXATION SI: Mastic étanchéité appliqué (absence infiltration future)',
            
            # Fixation Panneau/SI
            '🔨 FIXATION PANNEAUX: Dépose complète 10 panneaux minimum (sur les 25)',
            '🔨 FIXATION PANNEAUX: Mid-Clamp/End-Clamp conformes notice fabricant (nombre, serrage)',
            '🔨 FIXATION PANNEAUX: Espacement modules conforme (entre-axes, alignement)',
            '🔨 FIXATION PANNEAUX: Absence sur-serrage (risque fissure cadre) ou sous-serrage (jeu)',
            
            # Étanchéité sous panneaux (DTU 40.35 Article 5)
            '💧 ÉTANCHÉITÉ: Inspection surface toiture sous panneaux retirés',
            '💧 ÉTANCHÉITÉ: Kalzips/bac acier état (absence perforations, déformations critiques)',
            '💧 ÉTANCHÉITÉ: Absence infiltration (sec complet, pas traces humidité/flaques)',
            '💧 ÉTANCHÉITÉ: Plots EPDM en place (pas déplacés ni absents)',
            
            # Câblage toiture
            '🔌 CÂBLES TOITURE: Fixations câbles non-perçantes (clips) ou étanchéifiées',
            '🔌 CÂBLES TOITURE: Cheminement sur chemin dédié (pas direct sur couverture)',
            '🔌 CÂBLES TOITURE: Passage faîtage/arêtes étanchéifié correctement',
            
            # Connecteurs DC toiture (CDC GIRASOLE §2.5)
            '🔗 CONNECTEURS: Type (MC4/PVZH202B selon centrale), compatibilité mâle/femelle',
            '🔗 CONNECTEURS: Verrouillage clip audible (absence mal-encliqueté)',
            '🔗 CONNECTEURS: IP67/IP68, orientation anti-ruissellement (connecteur vers bas)',
            '🔗 CONNECTEURS: Joints état neuf (pas fissurés/vieillissement visible)',
            
            # ETN Système Intégration (CDC GIRASOLE §2.2)
            '📜 ETN SI: Respect prescriptions ETN du système intégration utilisé',
            '📜 ETN SI: Entraxe fixations conforme ETN (vérification échantillon)',
            '📜 ETN SI: Type fixations conforme ETN (vis, platines, joints spécifiés)',
            '📜 ETN SI: Écarts ETN détectés documentés précisément',
            
            # Notice montage panneau (CDC GIRASOLE §2.2)
            '📘 NOTICE: Respect notice montage panneau fournie',
            '📘 NOTICE: Nombre fixations par panneau conforme notice (mid-clamp/end-clamp)',
            '📘 NOTICE: Espacement modules conforme notice (entre-axes, jeu dilatation)',
            '📘 NOTICE: Si non-respect notice pour raison conception initiale → signaler immédiatement',
            
            # Photos toiture (minimum 30 photos CDC GIRASOLE §2.7)
            '📸 PHOTOS: 4 vues ensemble toiture + zones démontage (min 10 photos)',
            '📸 PHOTOS: Fixations SI (boulonnerie, étanchéité, joints EPDM - min 8 photos)',
            '📸 PHOTOS: Fixations panneaux (clamps, espacements, conformité notice - min 6 photos)',
            '📸 PHOTOS: Étanchéité sous panneaux (couverture, plots, infiltrations - min 6 photos)',
            '📸 PHOTOS: Défauts DTU 40.35/ETN/Notice (cataloguer TOUTES non-conformités - min 5 photos)'
        ]
    }
    
    # Section post-intervention
    section_post = {
        'id': 'post',
        'titre': '✅ 6. POST-INTERVENTION',
        'points': [
            'Toutes photos nomenclature prises (GEN/ELEC/MP/BP/DOC' + ('/TOIT' if audit_toiture else '') + ')',
            'Observations terrain complétées',
            'Mesures électriques enregistrées',
            'Installation remise en état',
            'Site nettoyé et sécurisé'
        ]
    }
    
    # Construction sections selon type
    sections_finales = sections_communes.copy()
    if audit_toiture:
        sections_finales.append(section_toiture)
    sections_finales.append(section_post)
    
    # Génération HTML
    html = f'''<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checklist Audit - {centrale_nom}</title>
    <style>
        * {{ box-sizing: border-box; margin: 0; padding: 0; }}
        body {{
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 15px;
            line-height: 1.6;
        }}
        .container {{
            max-width: 900px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.3);
            overflow: hidden;
        }}
        .header {{
            background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }}
        .header h1 {{ font-size: 26px; margin-bottom: 10px; }}
        .centrale-info {{
            background: rgba(255,255,255,0.15);
            padding: 15px;
            border-radius: 10px;
            margin-top: 15px;
            text-align: left;
        }}
        .centrale-info p {{ margin: 5px 0; font-size: 14px; }}
        .info-section {{
            padding: 25px;
            background: #f8f9fa;
            border-bottom: 3px solid #e9ecef;
        }}
        .info-section input, .info-section select {{
            width: 100%;
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 8px;
            margin: 8px 0;
            font-size: 14px;
        }}
        .section {{
            padding: 25px;
            border-bottom: 2px solid #e9ecef;
        }}
        .section-header {{
            font-size: 20px;
            color: #2c3e50;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 3px solid #2ecc71;
            font-weight: 700;
        }}
        .check-item {{
            background: #f8f9fa;
            padding: 15px;
            margin-bottom: 12px;
            border-radius: 8px;
            border-left: 4px solid #95a5a6;
            transition: all 0.3s;
        }}
        .check-item.checked {{
            background: #d4edda;
            border-left-color: #2ecc71;
        }}
        .check-item.critique {{
            border-left-color: #e74c3c;
            background: #ffe6e6;
        }}
        .check-item label {{
            display: flex;
            align-items: center;
            cursor: pointer;
        }}
        .check-item input[type="checkbox"] {{
            width: 24px;
            height: 24px;
            margin-right: 12px;
            cursor: pointer;
        }}
        .check-item textarea {{
            width: 100%;
            min-height: 60px;
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 8px;
            margin-top: 10px;
            font-family: inherit;
            resize: vertical;
        }}
        .photo-zone {{
            margin: 20px 0;
            padding: 25px;
            background: white;
            border: 3px dashed #2ecc71;
            border-radius: 10px;
            text-align: center;
        }}
        .photo-zone input[type="file"] {{ display: none; }}
        .btn-upload {{
            padding: 15px 30px;
            font-size: 16px;
            font-weight: bold;
            background: #2ecc71;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s;
        }}
        .btn-upload:hover {{ background: #27ae60; transform: translateY(-2px); }}
        .photo-preview {{
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-top: 20px;
            justify-content: center;
        }}
        .photo-preview img {{
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 10px;
            border: 3px solid #2ecc71;
            cursor: pointer;
        }}
        .photo-stats {{
            background: #e8f5e9;
            padding: 15px;
            border-radius: 10px;
            margin: 15px 0;
            text-align: center;
            font-weight: 600;
        }}
        .btn-export {{
            width: 100%;
            padding: 20px;
            font-size: 18px;
            font-weight: bold;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            margin: 20px 0;
            transition: all 0.3s;
        }}
        .btn-export:hover {{
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }}
        .footer {{
            padding: 25px;
            background: #2c3e50;
            color: white;
            text-align: center;
            font-size: 13px;
        }}
        .alert {{ padding: 15px; border-radius: 10px; margin: 15px 0; }}
        .alert-warning {{ background: #fff3cd; border-left: 4px solid #ffc107; color: #856404; }}
        .alert-info {{ background: #d1ecf1; border-left: 4px solid #17a2b8; color: #0c5460; }}
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🔆 CHECKLIST AUDIT PV</h1>
            <h2>{centrale_nom}</h2>
            <div class="centrale-info">
                <p><strong>ID Centrale:</strong> {centrale_id}</p>
                <p><strong>Puissance:</strong> {puissance} kWc</p>
                <p><strong>Type:</strong> {type_install}</p>
                <p><strong>Département:</strong> {dept}</p>
                <p><strong>Adresse:</strong> {adresse}</p>
                <p><strong>Audit toiture:</strong> {"✅ OUI" if audit_toiture else "❌ NON (audit visuel seulement)"}</p>
            </div>
        </div>
        
        <div class="info-section">
            <h3 style="margin-bottom: 15px; color: #2c3e50;">📝 Informations Intervention</h3>
            <input type="text" id="auditeur" placeholder="Nom auditeur / technicien *" required>
            <input type="date" id="date" required>
            <select id="meteo">
                <option value="">Conditions météo *</option>
                <option value="Ensoleillé">☀️ Ensoleillé</option>
                <option value="Nuageux">⛅ Nuageux</option>
                <option value="Couvert">☁️ Couvert</option>
                <option value="Pluie">🌧️ Pluie</option>
            </select>
            <input type="text" id="temperature" placeholder="Température ambiante (°C)">
        </div>
'''
    
    # Sections de contrôle
    for section in sections_finales:
        html += f'''
        <div class="section">
            <div class="section-header">{section['titre']}</div>
'''
        
        for i, point in enumerate(section['points']):
            critique = '⚠️' in point
            item_id = f"{section['id']}_{i}"
            html += f'''
            <div class="check-item {'critique' if critique else ''}" id="item_{item_id}">
                <label>
                    <input type="checkbox" onchange="updateItem('{item_id}')">
                    <span>{point}</span>
                </label>
                <textarea placeholder="Observations..." onchange="saveLocal()"></textarea>
            </div>
'''
        
        html += '        </div>\n'
    
    # Section photos
    html += f'''
        <div class="section">
            <div class="section-header">📸 PHOTOS TERRAIN</div>
            
            <div class="alert alert-warning">
                <strong>⚠️ NOMENCLATURE PHOTOS OBLIGATOIRE :</strong><br>
                • <strong>GEN</strong> : Vues générales (min 5)<br>
                • <strong>ELEC</strong> : Onduleurs, câbles, protections (min 5)<br>
                • <strong>MP</strong> : Modules détails (min 10)<br>
                • <strong>BP</strong> : Boîtes protection (min 2)<br>
                {'• <strong>TOIT</strong> : Toiture, fixations, traversées (min 8)<br>' if audit_toiture else ''}
                • <strong>DOC</strong> : Documents, schémas (min 1)<br>
                <strong>TOTAL MINIMUM : {33 if audit_toiture else 25} photos</strong>
            </div>
            
            <div class="photo-zone">
                <input type="file" id="photoInput" accept="image/*" multiple>
                <button class="btn-upload" onclick="document.getElementById('photoInput').click()">
                    📷 AJOUTER PHOTOS
                </button>
                <p style="margin-top: 15px; color: #666;">Sélectionner plusieurs photos à la fois</p>
            </div>
            
            <div class="photo-stats" id="photoStats">
                📊 Photos: <span id="nbPhotos">0</span> | Taille: <span id="taillePhotos">0 MB</span>
            </div>
            
            <div class="photo-preview" id="photoPreview"></div>
        </div>
        
        <div class="section">
            <div class="alert alert-info">
                <strong>💾 SAUVEGARDE AUTOMATIQUE :</strong> Les données sont sauvegardées localement toutes les 10 secondes.
            </div>
            
            <button class="btn-export" onclick="exporterJSON()">
                📥 EXPORTER CHECKLIST + PHOTOS (JSON)
            </button>
        </div>
        
        <div class="footer">
            <p><strong>Diagnostic Photovoltaïque</strong> | 3 rue d'Apollo, 31240 L'Union</p>
            <p>☎️ 05.81.10.16.59 | 📧 contact@diagpv.fr | 🌐 www.diagnosticphotovoltaique.fr</p>
            <p style="margin-top: 10px;">RCS Toulouse 792 972 309 | Mission GIRASOLE 2025</p>
        </div>
    </div>
    
    <script>
        const CENTRALE_ID = '{centrale_id}';
        const CENTRALE_NOM = '{centrale_nom}';
        let photosBase64 = [];
        let totalSize = 0;
        
        // Date du jour par défaut
        document.getElementById('date').value = new Date().toISOString().split('T')[0];
        
        // Update item état
        function updateItem(itemId) {{
            const item = document.getElementById('item_' + itemId);
            const checkbox = item.querySelector('input[type="checkbox"]');
            if (checkbox.checked) {{
                item.classList.add('checked');
            }} else {{
                item.classList.remove('checked');
            }}
            saveLocal();
        }}
        
        // Gestion photos
        document.getElementById('photoInput').addEventListener('change', function(e) {{
            const files = e.target.files;
            for (let file of files) {{
                const reader = new FileReader();
                reader.onload = function(event) {{
                    const base64Data = event.target.result;
                    totalSize += base64Data.length;
                    
                    photosBase64.push({{
                        nom: file.name,
                        taille: file.size,
                        type: file.type,
                        data: base64Data,
                        date: new Date().toISOString()
                    }});
                    
                    // Prévisualisation
                    const img = document.createElement('img');
                    img.src = base64Data;
                    img.onclick = function() {{ window.open(base64Data); }};
                    document.getElementById('photoPreview').appendChild(img);
                    
                    updatePhotoStats();
                    saveLocal();
                }};
                reader.readAsDataURL(file);
            }}
        }});
        
        function updatePhotoStats() {{
            document.getElementById('nbPhotos').textContent = photosBase64.length;
            document.getElementById('taillePhotos').textContent = (totalSize / (1024 * 1024)).toFixed(2);
        }}
        
        // Export JSON
        function exporterJSON() {{
            const auditeur = document.getElementById('auditeur').value;
            const date = document.getElementById('date').value;
            const meteo = document.getElementById('meteo').value;
            const temperature = document.getElementById('temperature').value;
            
            if (!auditeur || !date || !meteo) {{
                alert('⚠️ Veuillez remplir les champs obligatoires: Nom, Date, Météo');
                return;
            }}
            
            const data = {{
                centrale_id: CENTRALE_ID,
                centrale_nom: CENTRALE_NOM,
                auditeur: auditeur,
                date_audit: date,
                meteo: meteo,
                temperature: temperature,
                horodatage: new Date().toISOString(),
                audit_toiture: {str(audit_toiture).lower()},
                points_controle: [],
                photos: photosBase64,
                nb_photos: photosBase64.length,
                taille_totale_mb: (totalSize / (1024 * 1024)).toFixed(2)
            }};
            
            // Récupération points contrôle
            document.querySelectorAll('.check-item').forEach((item, index) => {{
                const checkbox = item.querySelector('input[type="checkbox"]');
                const textarea = item.querySelector('textarea');
                const label = item.querySelector('label span');
                
                data.points_controle.push({{
                    id: index,
                    titre: label.textContent.trim(),
                    checked: checkbox.checked,
                    observations: textarea.value
                }});
            }});
            
            // Téléchargement
            const blob = new Blob([JSON.stringify(data, null, 2)], {{type: 'application/json'}});
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = `audit_${{CENTRALE_ID}}_${{date}}_${{Date.now()}}.json`;
            a.click();
            
            alert(`✅ Export réussi !\\n\\n` +
                  `Centrale: ${{CENTRALE_ID}} - ${{CENTRALE_NOM}}\\n` +
                  `Photos: ${{photosBase64.length}}\\n` +
                  `Taille: ${{(totalSize / (1024 * 1024)).toFixed(2)}} MB\\n\\n` +
                  `📧 Envoyer ce fichier JSON à DiagPV`);
        }}
        
        // Auto-save LocalStorage
        function saveLocal() {{
            const data = {{
                centrale_id: CENTRALE_ID,
                auditeur: document.getElementById('auditeur').value,
                date: document.getElementById('date').value,
                meteo: document.getElementById('meteo').value,
                temperature: document.getElementById('temperature').value,
                checkboxes: [],
                textareas: [],
                photos_count: photosBase64.length,
                last_save: new Date().toISOString()
            }};
            
            document.querySelectorAll('.check-item input[type="checkbox"]').forEach(cb => {{
                data.checkboxes.push(cb.checked);
            }});
            
            document.querySelectorAll('.check-item textarea').forEach(ta => {{
                data.textareas.push(ta.value);
            }});
            
            localStorage.setItem('checklist_' + CENTRALE_ID, JSON.stringify(data));
        }}
        
        // Chargement auto-save
        function loadLocal() {{
            const saved = localStorage.getItem('checklist_' + CENTRALE_ID);
            if (saved) {{
                const data = JSON.parse(saved);
                document.getElementById('auditeur').value = data.auditeur || '';
                document.getElementById('date').value = data.date || '';
                document.getElementById('meteo').value = data.meteo || '';
                document.getElementById('temperature').value = data.temperature || '';
                
                const checkboxes = document.querySelectorAll('.check-item input[type="checkbox"]');
                const textareas = document.querySelectorAll('.check-item textarea');
                
                data.checkboxes.forEach((checked, i) => {{
                    if (checkboxes[i]) {{
                        checkboxes[i].checked = checked;
                        if (checked) {{
                            checkboxes[i].closest('.check-item').classList.add('checked');
                        }}
                    }}
                }});
                
                data.textareas.forEach((value, i) => {{
                    if (textareas[i]) {{
                        textareas[i].value = value;
                    }}
                }});
            }}
        }}
        
        // Auto-save périodique
        setInterval(saveLocal, 10000);
        
        // Init
        window.addEventListener('DOMContentLoaded', loadLocal);
    </script>
</body>
</html>'''
    
    return html

def main():
    """Génère les 52 checklists personnalisées"""
    
    print("=" * 80)
    print("🔆 GÉNÉRATION 52 CHECKLISTS PERSONNALISÉES - GIRASOLE 2025")
    print("=" * 80)
    print()
    
    # Charger liste centrales
    base_dir = Path(__file__).parent.parent
    centrales_path = base_dir / 'data' / 'liste_52_centrales.json'
    
    print(f"📄 Lecture liste centrales: {centrales_path}")
    with open(centrales_path, 'r', encoding='utf-8') as f:
        centrales = json.load(f)
    
    print(f"✅ {len(centrales)} centrales chargées\n")
    
    # Créer répertoire output
    output_dir = base_dir / 'checklists_personnalisees_52'
    output_dir.mkdir(exist_ok=True)
    
    print(f"📁 Répertoire output: {output_dir}\n")
    print("⚙️  Génération checklists...\n")
    
    stats = {'sol': 0, 'toiture': 0, 'total': 0}
    
    for i, centrale in enumerate(centrales, 1):
        centrale_id = centrale['id']
        centrale_nom = centrale['nom']
        audit_toiture = centrale.get('audit_toiture', 'NON') == 'OUI'
        
        # Générer HTML
        html = generer_checklist_html(centrale)
        
        # Sauvegarder
        filename = f"CHECKLIST_{centrale_id}_{centrale_nom.replace(' ', '_').replace('/', '_')}.html"
        output_path = output_dir / filename
        
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(html)
        
        # Stats
        if audit_toiture:
            stats['toiture'] += 1
            type_icon = "🏠"
        else:
            stats['sol'] += 1
            type_icon = "☀️"
        
        stats['total'] += 1
        
        print(f"   {i:2d}. {type_icon} {centrale_id} - {centrale_nom[:40]:40s} → {filename[:60]}")
    
    print()
    print("=" * 80)
    print("✅ GÉNÉRATION TERMINÉE !")
    print("=" * 80)
    print()
    print(f"📊 STATISTIQUES:")
    print(f"   ☀️  Audit visuel seul (SOL):     {stats['sol']}")
    print(f"   🏠 Audit visuel + TOITURE:       {stats['toiture']}")
    print(f"   📦 TOTAL checklists générées:    {stats['total']}")
    print()
    print(f"📁 Checklists sauvegardées dans:")
    print(f"   {output_dir}")
    print()
    print("🎯 PROCHAINES ÉTAPES:")
    print("   1. Tester une checklist dans navigateur")
    print("   2. Créer package ZIP pour distribution sous-traitants")
    print("   3. Rédiger guide utilisateur")
    print()

if __name__ == "__main__":
    main()
