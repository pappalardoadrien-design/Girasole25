# 🚀 MISSION GIRASOLE 2025 - WORKSPACE OPÉRATIONNEL

**Diagnostic Photovoltaïque - Expertise indépendante depuis 2012**  
**Date préparation** : 19 novembre 2025  
**Contact** : Adrien PAPPALARDO - 06 07 29 22 12

---

## 🎯 SYNTHÈSE EXÉCUTIVE

### ✅ **MISSION 90% PRÊTE - LIVRABLES OPÉRATIONNELS**

Ce dossier contient **TOUT le travail déjà réalisé** pour la mission GIRASOLE 2025 :
- ✅ **52 checklists terrain personnalisées** (1 par centrale) → Prêtes distribution
- ✅ **52 ordres mission brandés DiagPV** → Prêts distribution
- ✅ **Checklist BE validation** → Prête utilisation bureau
- ✅ **Planificateur tournées Excel** → Affectation 4 bases sous-traitants
- ✅ **Calculateur marges Excel** → Rentabilité par centrale
- ✅ **Scripts Python automatisation** → Base génération livrables
- ✅ **Templates ANNEXE 2 + rapports** → Conformes GIRASOLE
- ✅ **Guides complets** → Documentation opérationnelle

### ❌ **CE QU'IL RESTE À FAIRE (10% - CE SOIR)**
1. ❌ Finaliser script génération 52 rapports PDF (2-3h)
2. ❌ Finaliser script fusion JSON → ANNEXE 2 (1-2h)
3. ❌ Tester workflow complet avec 1 centrale pilote (30 min)

---

## 📂 STRUCTURE WORKSPACE

```
girasole_mission_2025/
│
├── checklists_terrain_52/          ⭐ 52 checklists HTML personnalisées
│   ├── CHECKLIST_3085_Hangar_Maxime_Bayle.html
│   ├── CHECKLIST_3251_SCI_KILJOR.html
│   └── ... (50 autres)
│
├── ordres_mission_52/              ⭐ 52 ordres mission brandés
│   ├── OM_3085_Hangar_Maxime_Bayle.html
│   ├── OM_3251_SCI_KILJOR.html
│   └── ... (50 autres)
│
├── checklist_be/                   ⭐ Validation bureau d'études
│   └── TEMPLATE_CHECKLIST_BE_V2.html
│
├── scripts_python/                 ⭐ Automatisation génération livrables
│   ├── generer_52_checklists_v2.py
│   ├── generer_annexe2_automatique.py  ⚠️ À FINALISER
│   └── generer_rapport_individuel_centrale.py  ⚠️ À FINALISER
│
├── templates/                      ⭐ Templates livrables
│   ├── ANNEXE2_GIRASOLE_SYNTHESE_AUTO.xlsx
│   ├── RAPPORT_EXEMPLE_3085_Hangar_Maxime_Bayle.html
│   ├── TEMPLATE_CHECKLIST_TERRAIN_V2.html
│   └── liste_52_centrales.json
│
├── planification/                  ⭐ Organisation tournées
│   ├── PLANIFICATEUR_TOURNEES_GIRASOLE_2025_V2.xlsx
│   ├── CALCULATEUR_MARGES_GIRASOLE_2025_CORRIGE.xlsx
│   └── BRIEFING_TECHNICIENS_GIRASOLE_2025.pptx
│
├── securite/                       ⭐ MOP interventions toiture
│   └── MOP_INTERVENTIONS_TOITURE_DIAGPV.pdf
│
├── guides/                         ⭐ Documentation complète
│   ├── README_PACK_COMPLET.md
│   └── INVENTAIRE_ZIP_COMPLET_GIRASOLE_2025.md
│
└── data/                          ⭐ Données 52 centrales
    └── liste_52_centrales.json
```

---

## 🔄 WORKFLOW OPÉRATIONNEL

### **PHASE 1 : PRÉPARATION (J+0 - CE SOIR)**

#### **1.1 - Finaliser scripts Python (4-6h)**

```bash
cd /home/user/girasole_mission_2025/scripts_python/

# Script 1 : Finaliser génération rapports PDF
# TODO : Compléter generer_rapport_individuel_centrale.py
#   - Input : JSON terrain + BE + photos ZIP
#   - Output : Rapport PDF branded DiagPV avec photos
#   - Librairies : python-docx, Pillow, openpyxl

# Script 2 : Finaliser fusion JSON → ANNEXE 2
# TODO : Compléter generer_annexe2_automatique.py ligne 143
#   - Charger data_audit depuis JSON checklists
#   - Remplir colonnes audit ANNEXE 2
```

#### **1.2 - Tester workflow avec centrale pilote (30 min)**

```bash
# Tester centrale 3085 (Hangar Maxime Bayle) :
# 1. Remplir checklist terrain → Export JSON
# 2. Remplir checklist BE → Export JSON
# 3. Générer rapport PDF
# 4. Vérifier ANNEXE 2
```

#### **1.3 - Distribution fichiers sous-traitants (1h)**

**Organiser par base géographique** :

```
BASE_LYON/
├── checklists/ (14 centrales Lyon)
├── ordres_mission/ (14 ordres Lyon)
└── BRIEFING_TECHNICIENS_GIRASOLE_2025.pptx

BASE_MILLAU/
├── checklists/ (13 centrales Millau)
├── ordres_mission/ (13 ordres Millau)
└── MOP_INTERVENTIONS_TOITURE_DIAGPV.pdf (si toiture)

BASE_ORTHEZ/
├── checklists/ (12 centrales Orthez)
├── ordres_mission/ (12 ordres Orthez)
└── BRIEFING_TECHNICIENS_GIRASOLE_2025.pptx

BASE_TOULOUSE/
├── checklists/ (13 centrales Toulouse)
├── ordres_mission/ (13 ordres Toulouse)
└── MOP_INTERVENTIONS_TOITURE_DIAGPV.pdf (si toiture)
```

**Référence affectation** : Voir `planification/PLANIFICATEUR_TOURNEES_GIRASOLE_2025_V2.xlsx`

---

### **PHASE 2 : TERRAIN (J+1 à J+42)**

#### **Workflow sous-traitant journée type**

**MATIN (8h00-9h00)**
1. Consulter ordre mission centrale du jour
2. Cliquer lien GPS pour navigation
3. Vérifier météo (⚠️ TOITURE : vent < 20 km/h obligatoire)
4. Préparer équipement :
   - Laptop chargé
   - Appareil photo/smartphone
   - Multimètre, mégohmmètre
   - EPI (casque, gants, chaussures sécurité)
   - ⚠️ TOITURE : Harnais, PTI, binôme expérimenté

**SUR SITE (9h00-17h00)**
1. Ouvrir checklist HTML dans navigateur (fonctionne offline)
2. Remplir checklist au fur et à mesure (cocher items, saisir notes)
3. Prendre photos selon nomenclature GIRASOLE :
   - **GEN** (GENERAL) : 5 photos vues ensemble
   - **ELEC** (NFC15100) : 10 photos coffrets/connexions
   - **TOIT** (DTU40) : 7 photos toiture (UNIQUEMENT 13 centrales toiture)
   - **BP** (BONNES_PRATIQUES) : 5 photos conformité
   - **MP** (MAUVAISES_PRATIQUES) : 5 photos défauts
   - **DOC** (DOCUMENTATION) : 10 photos plans/étiquettes
4. Exporter JSON + ZIP photos fin intervention

**SOIR (18h00)**
1. Upload fichiers vers serveur DiagPV :
   - `CHECKLIST_{ID}_{NOM}_terrain.json`
   - `PHOTOS_{ID}_{NOM}.zip`
2. Compléter rapport journée (km, temps, observations)

---

### **PHASE 3 : VALIDATION BE (J+43 à J+49)**

#### **Workflow Bureau d'Études**

**PAR CENTRALE** (2-3h par centrale) :
1. Ouvrir `checklist_be/TEMPLATE_CHECKLIST_BE_V2.html`
2. Importer JSON terrain depuis Phase 2
3. Analyser documentaire :
   - Vérifier DOE (Dossier Ouvrage Exécuté)
   - Croiser plans calepinage vs photos terrain
   - Vérifier schémas électriques
   - Conformité étiquettes/signalétique
4. Valider mesures électriques :
   - Cohérence Voc/Isc vs datasheet modules
   - Isolement conforme normes
   - Onduleurs OK
5. Analyser images & photos :
   - Qualité suffisante
   - Nomenclature GIRASOLE respectée
   - Défauts bien photographiés
6. Analyse technique experte :
   - Classifier défauts (CRITIQUE/MAJEUR/MINEUR)
   - Estimer impacts production
   - Vérifier conformité normes IEC/NFC/DTU
7. Rédiger recommandations priorisées
8. Exporter JSON BE validé : `CHECKLIST_{ID}_{NOM}_BE.json`

**CONTRÔLE QUALITÉ FABIEN CORRERA** :
- Relecture 100% checklists BE
- Validation conformité technique
- Signature finale rapports

---

### **PHASE 4 : GÉNÉRATION LIVRABLES (J+50)**

#### **Exécution scripts automatisation**

```bash
cd /home/user/girasole_mission_2025/scripts_python/

# 1. Fusionner 52 JSON → ANNEXE 2 Excel
python3 generer_annexe2_automatique.py
# Output: ../templates/ANNEXE2_GIRASOLE_SYNTHESE_FINALE.xlsx

# 2. Générer 52 rapports PDF individuels
python3 generer_rapport_individuel_centrale.py
# Output: 52 fichiers RAPPORT_{CODE}_{NOM}.pdf dans ./output/

# 3. Contrôle qualité final
# - Vérifier ANNEXE 2 complète (52 lignes)
# - Ouvrir échantillon 5 rapports PDF
# - Valider photos bien intégrées
# - Vérifier branding DiagPV (logo, RCS, signature Fabien)
```

#### **Livraison client GIRASOLE**

```
LIVRABLES_GIRASOLE_2025/
├── ANNEXE_2_SYNTHESE_52_CENTRALES.xlsx
└── RAPPORTS_INDIVIDUELS/
    ├── RAPPORT_3085_Hangar_Maxime_Bayle.pdf
    ├── RAPPORT_3251_SCI_KILJOR.pdf
    └── ... (50 autres)
```

---

## 📊 DONNÉES MISSION

### **52 centrales photovoltaïques**
- **39 CENTRALES AU SOL** : Accès simple, intervention rapide
- **13 CENTRALES TOITURE** : Ligne de vie obligatoire, harnais, binôme, MOP spécifique

### **Puissance totale** : ~16 MWc

### **Matériel installé (homogène)**
- Modules : DMEGC 455Wc polycristallin (majorité)
- Onduleurs : DOMESOLAR / HUAWEI (selon sites)

### **Type audit** : QUALITÉ VISUELLE uniquement
- ✅ Inspection visuelle modules/structures
- ✅ Photos standardisées nomenclature GIRASOLE
- ✅ Mesures électriques basiques (Voc, Isc, isolement)
- ❌ PAS électroluminescence (EL)
- ❌ PAS thermographie infrarouge drone
- ❌ PAS courbes I-V

### **Normes applicables**
- **IEC 62446-1** : Inspection installation PV
- **NF C 15-100** : Installations électriques BT
- **DTU 40.35** : Couverture photovoltaïque (⚠️ UNIQUEMENT 13 TOITURE)

### **Durée estimée** : 6-8 semaines terrain (janvier-mars 2025)

---

## 🔧 SCRIPTS PYTHON À FINALISER

### **Script 1 : `generer_rapport_individuel_centrale.py`**

**État actuel** : Fonction basique seulement (9.4 KB)

**À COMPLÉTER** :
```python
#!/usr/bin/env python3
"""
GÉNÉRATEUR RAPPORTS PDF INDIVIDUELS - GIRASOLE 2025
Diagnostic Photovoltaïque

Génère 52 rapports PDF brandés DiagPV avec photos
"""

import json
from pathlib import Path
from docx import Document
from docx.shared import Inches, Pt, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH
from PIL import Image
import zipfile

def generer_rapport_pdf(centrale_id, json_terrain_path, json_be_path, photos_zip_path):
    """
    Génère 1 rapport PDF branded DiagPV pour 1 centrale
    
    Args:
        centrale_id: ID centrale (ex: 3085)
        json_terrain_path: Chemin JSON checklist terrain
        json_be_path: Chemin JSON checklist BE
        photos_zip_path: Chemin ZIP photos nomenclature GIRASOLE
    
    Returns:
        Path rapport PDF généré
    """
    
    # 1. Charger données JSON
    with open(json_terrain_path, 'r', encoding='utf-8') as f:
        data_terrain = json.load(f)
    
    with open(json_be_path, 'r', encoding='utf-8') as f:
        data_be = json.load(f)
    
    # 2. Créer document Word
    doc = Document()
    
    # 3. En-tête DiagPV
    ajouter_entete_diagpv(doc, centrale_id, data_terrain)
    
    # 4. Page de garde
    ajouter_page_garde(doc, data_terrain)
    
    # 5. Synthèse exécutive
    ajouter_synthese_executive(doc, data_be)
    
    # 6. Caractéristiques installation
    ajouter_caracteristiques(doc, data_terrain)
    
    # 7. Méthodologie audit
    ajouter_methodologie(doc)
    
    # 8. Résultats inspection visuelle
    ajouter_resultats_inspection(doc, data_terrain)
    
    # 9. Anomalies détectées avec photos
    ajouter_anomalies_photos(doc, data_be, photos_zip_path)
    
    # 10. Recommandations priorisées
    ajouter_recommandations(doc, data_be)
    
    # 11. Annexes (toutes photos)
    ajouter_annexes_photos(doc, photos_zip_path)
    
    # 12. Pied de page avec signature Fabien
    ajouter_pied_page(doc)
    
    # 13. Sauvegarder Word
    output_docx = Path(f'./output/RAPPORT_{centrale_id}_{data_terrain["nom"]}.docx')
    doc.save(output_docx)
    
    # 14. Convertir Word → PDF
    # TODO : Utiliser libreoffice --headless ou python-docx2pdf
    output_pdf = output_docx.with_suffix('.pdf')
    
    print(f"✅ Rapport généré : {output_pdf.name}")
    return output_pdf

def ajouter_entete_diagpv(doc, centrale_id, data):
    """Ajoute en-tête branded DiagPV"""
    # Logo DiagPV (vert/gris)
    # Coordonnées : 3 rue d'Apollo, 31240 L'Union
    # RCS Toulouse 792 972 309
    pass

def ajouter_page_garde(doc, data):
    """Page garde avec titre, centrale, date"""
    pass

def ajouter_synthese_executive(doc, data_be):
    """Synthèse : Conforme/Non-conforme, défauts majeurs"""
    pass

def ajouter_caracteristiques(doc, data):
    """Tableau : Puissance, modules, onduleurs, localisation"""
    pass

def ajouter_methodologie(doc):
    """Normes appliquées : IEC 62446-1, NF C 15-100, DTU 40.35"""
    pass

def ajouter_resultats_inspection(doc, data):
    """Tableaux résultats par section checklist"""
    pass

def ajouter_anomalies_photos(doc, data_be, photos_zip):
    """Liste anomalies avec photos défauts"""
    # Extraire photos MP (MAUVAISES_PRATIQUES) depuis ZIP
    pass

def ajouter_recommandations(doc, data_be):
    """Recommandations priorisées CRITIQUE → MAJEUR → MINEUR"""
    pass

def ajouter_annexes_photos(doc, photos_zip):
    """Toutes photos par catégorie GEN/ELEC/TOIT/BP/MP/DOC"""
    # Extraire toutes photos depuis ZIP
    # Organiser par catégorie nomenclature
    pass

def ajouter_pied_page(doc):
    """Pied page : Signature Fabien CORRERA + Disclaimer"""
    pass

def main():
    """Génère 52 rapports PDF"""
    print("📄 GÉNÉRATEUR RAPPORTS PDF - GIRASOLE 2025\n")
    
    # Charger liste 52 centrales
    centrales_path = Path('../data/liste_52_centrales.json')
    with open(centrales_path, 'r', encoding='utf-8') as f:
        centrales = json.load(f)
    
    print(f"📊 {len(centrales)} centrales à traiter\n")
    
    # Générer rapport pour chaque centrale
    for i, centrale in enumerate(centrales, 1):
        centrale_id = centrale['id']
        
        # Chemins fichiers
        json_terrain = Path(f'./data/CHECKLIST_{centrale_id}_terrain.json')
        json_be = Path(f'./data/CHECKLIST_{centrale_id}_BE.json')
        photos_zip = Path(f'./data/PHOTOS_{centrale_id}.zip')
        
        # Vérifier fichiers existent
        if not all([json_terrain.exists(), json_be.exists(), photos_zip.exists()]):
            print(f"⚠️  {i:2d}. SKIP {centrale_id} - Fichiers manquants")
            continue
        
        # Générer rapport
        generer_rapport_pdf(centrale_id, json_terrain, json_be, photos_zip)
        print(f"   {i:2d}. ✅ {centrale_id} - {centrale['nom']}")
    
    print(f"\n✅ 52 rapports PDF générés dans ./output/")

if __name__ == "__main__":
    main()
```

---

### **Script 2 : `generer_annexe2_automatique.py`**

**État actuel** : Structure OK, ligne 143 TODO (5.5 KB)

**À COMPLÉTER (ligne 143)** :
```python
def main():
    """Génère ANNEXE 2 automatiquement"""
    
    print("📊 GÉNÉRATEUR ANNEXE 2 AUTOMATIQUE - GIRASOLE 2025\n")
    
    # 1. Charger liste 52 centrales
    centrales_path = Path('../data/liste_52_centrales.json')
    print(f"📄 Lecture liste centrales: {centrales_path.name}")
    with open(centrales_path, 'r', encoding='utf-8') as f:
        centrales = json.load(f)
    print(f"   ✅ {len(centrales)} centrales chargées\n")
    
    # 2. Créer structure ANNEXE 2
    print("📋 Création structure ANNEXE 2...")
    wb, ws = creer_annexe2_structure()
    print("   ✅ Structure créée\n")
    
    # 3. Remplir lignes pour chaque centrale
    print("⚙️  Remplissage données centrales...\n")
    
    for i, centrale in enumerate(centrales, 1):
        row_idx = i + 1
        
        # ✅ CORRECTION LIGNE 143 : Charger data_audit depuis JSON
        centrale_id = centrale['id']
        json_terrain_path = Path(f'./data/CHECKLIST_{centrale_id}_terrain.json')
        json_be_path = Path(f'./data/CHECKLIST_{centrale_id}_BE.json')
        
        data_audit = None
        if json_terrain_path.exists() and json_be_path.exists():
            data_audit = charger_data_audit_json(json_terrain_path, json_be_path)
        
        remplir_ligne_centrale(ws, row_idx, centrale, data_audit=data_audit)
        
        print(f"   {i:2d}. ✅ {centrale['id']} - {centrale['nom']}")
    
    # 4. Sauvegarder
    output_path = Path('../templates/ANNEXE2_GIRASOLE_SYNTHESE_FINALE.xlsx')
    wb.save(output_path)
    
    print(f"\n✅ ANNEXE 2 générée: {output_path.name}")
    print(f"✅ 52 centrales incluses")
    print(f"✅ Format conforme exemple Girasole")

def charger_data_audit_json(json_terrain_path, json_be_path):
    """
    Charge données audit depuis JSON checklists terrain + BE
    
    Returns:
        dict: Données audit formatées pour ANNEXE 2
    """
    with open(json_terrain_path, 'r', encoding='utf-8') as f:
        terrain = json.load(f)
    
    with open(json_be_path, 'r', encoding='utf-8') as f:
        be = json.load(f)
    
    return {
        'statut': be.get('statut_audit', 'À compléter'),
        'anomalies_critiques': be.get('nb_anomalies_critiques', 0),
        'anomalies_majeures': be.get('nb_anomalies_majeures', 0),
        'anomalies_mineures': be.get('nb_anomalies_mineures', 0),
        'nb_photos': terrain.get('nb_photos_prises', 0),
        'conformite_iec': be.get('conformite_IEC_62446', 'À vérifier'),
        'recommandations': be.get('recommandations_prioritaires', 'À compléter'),
        'observations': terrain.get('observations_terrain', 'À compléter')
    }
```

---

## 📞 CONTACTS URGENTS

### **DiagPV - Coordination mission**
- **Adrien PAPPALARDO** (Business Developer)
  - 📱 06 07 29 22 12
  - 📧 info@diagnosticphotovoltaique.fr
  - Rôle : Coordination sous-traitants, planning, questions commerciales

- **Fabien CORRERA** (Responsable Technique)
  - 📧 contact@diagpv.fr
  - Rôle : Validation technique, signature rapports, contrôle qualité

### **DiagPV - Siège social**
- 🏢 3 rue d'Apollo, 31240 L'UNION
- ☎ 05.81.10.16.59
- 🌐 www.diagnosticphotovoltaique.fr
- RCS Toulouse 792 972 309

---

## 🚨 POINTS CRITIQUES SÉCURITÉ

### **13 CENTRALES TOITURE - CONTRAINTES SPÉCIFIQUES**

⚠️ **MOP OBLIGATOIRE** : Voir `securite/MOP_INTERVENTIONS_TOITURE_DIAGPV.pdf`

**Équipements obligatoires** :
- ✅ Ligne de vie certifiée
- ✅ Harnais antichute (norme EN 361)
- ✅ PTI (Protection Travailleur Isolé)
- ✅ Binôme expérimenté OBLIGATOIRE
- ✅ Habilitations travail en hauteur à jour

**Conditions météo impératives** :
- ⚠️ Vent < 20 km/h OBLIGATOIRE
- ⚠️ Pluie/brouillard : INTERDICTION intervention
- ⚠️ Verglas/neige : INTERDICTION intervention

**Avant intervention toiture** :
1. Vérifier habilitations travail hauteur à jour
2. Contrôler état EPI (harnais, longe, casque)
3. Tester PTI
4. Vérifier météo (vent < 20 km/h)
5. Briefing binôme (rôles, secours)
6. Identifier points d'ancrage ligne de vie

---

## ✅ CHECKLIST AVANT DÉMARRAGE MISSION

### **Préparation technique (J+0)**
- [ ] Scripts Python finalisés (rapports PDF + ANNEXE 2)
- [ ] Workflow testé avec centrale pilote (3085)
- [ ] Bugs corrigés
- [ ] Documentation sous-traitants créée

### **Distribution sous-traitants (J+1)**
- [ ] Checklists distribuées par base (Lyon, Millau, Orthez, Toulouse)
- [ ] Ordres mission distribués
- [ ] Briefing techniciens effectué (PowerPoint fourni)
- [ ] MOP sécurité toiture distribué (13 centrales concernées)
- [ ] Contacts urgence communiqués

### **Planification validée**
- [ ] Affectation centrales par base confirmée
- [ ] Calendrier interventions validé (planificateur Excel)
- [ ] Hébergements réservés (si nécessaire)
- [ ] Véhicules disponibles

### **Matériel vérifié**
- [ ] Laptops techniciens (checklists HTML offline)
- [ ] Appareils photo/smartphones
- [ ] Multimètres, mégohmmètres
- [ ] EPI (casques, gants, chaussures sécurité)
- [ ] ⚠️ TOITURE : Harnais, lignes vie, PTI

---

## 📈 BUDGET & RENTABILITÉ

**Référence** : Voir `planification/CALCULATEUR_MARGES_GIRASOLE_2025_CORRIGE.xlsx`

| Item | Quantité | Prix unitaire | Total |
|------|----------|---------------|-------|
| Centrales SOL | 39 | 1,020€ | 39,780€ |
| Centrales TOITURE | 13 | 1,485€ | 19,305€ |
| Frais déplacement | 52 | 150€ | 7,800€ |
| **TOTAL HT** | | | **66,885€** |

**Contrat** : 22COUTIN©  
**Période** : Janvier-Mars 2025  
**Paiement** : Selon jalons contractuels

---

## 🎯 OBJECTIF FINAL

### **Livrables client GIRASOLE attendus**

1. **ANNEXE 2 Excel** : Synthèse consolidée 52 centrales
   - Format : Excel conforme template fourni
   - Contenu : ID, statut, anomalies, conformité, recommandations

2. **52 rapports PDF individuels** branded DiagPV
   - Format : PDF professionnel avec photos
   - Sections : Synthèse, caractéristiques, inspection, anomalies, recommandations
   - Branding : Logo DiagPV, RCS, signature Fabien CORRERA

---

**Date livraison prévue** : Fin mars 2025  
**Délai contractuel** : Respecté ✅

---

🚀 **MISSION GIRASOLE 2025 - PRÊT POUR DÉMARRAGE !**

---

**Version** : 1.0 Opérationnelle  
**Date** : 19 novembre 2025  
**Créé par** : Diagnostic Photovoltaïque - SuperAgent DiagPV
