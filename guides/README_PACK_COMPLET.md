# 📦 PACK FUSION ULTIME - MISSION GIRASOLE 2025

**Diagnostic Photovoltaïque - Expertise indépendante depuis 2012**

---

## 🎯 CONTENU DU PACK

### 📁 01_PLANIFICATION

**Outils organisation mission 52 centrales**

| Fichier | Description |
|---------|-------------|
| `PLANIFICATEUR_TOURNEES_GIRASOLE_2025_V2.xlsx` | Planificateur tournées 4 bases sous-traitants (Lyon, Millau, Orthez, Toulouse) |
| `CALCULATEUR_MARGES_GIRASOLE_2025_CORRIGE.xlsx` | Suivi rentabilité PAR CENTRALE (52 lignes individuelles) |
| `BRIEFING_TECHNICIENS_GIRASOLE_2025.pptx` | Présentation mission/méthodologie pour techniciens (14 slides) |

---

### 📁 02_CHECKLISTS_TERRAIN_52

**52 checklists terrain V2 individuelles personnalisées**

- **Format**: HTML responsive (mobile/tablette optimisé)
- **Contenu**: 20 sections, 174 items vérification
- **Fonctionnalités**:
  - ✅ Upload photos intégré par section
  - ✅ Export JSON données + ZIP photos
  - ✅ Infos centrale pré-remplies (code, nom, GPS, puissance)
  - ✅ Section 19 spécialisée toiture
  - ✅ Conformité IEC 62446-3, IEC TS 63049

**Exemple**: `CHECKLIST_3085_Hangar_Maxime_Bayle.html`

**Usage**:
1. Ouvrir fichier HTML dans navigateur
2. Compléter checklist terrain (cocher items, ajouter photos)
3. Exporter JSON + ZIP photos
4. JSON alimente automatiquement ANNEXE 2 + Rapports

---

### 📁 03_CHECKLIST_BE

**Checklist Bureau d'Études V2**

| Fichier | Description |
|---------|-------------|
| `TEMPLATE_CHECKLIST_BE_V2.html` | Analyse documentaire (6 sections) |

**Fonctionnalités**:
- Import automatique JSON terrain
- Croisement données terrain/documents
- Export Excel synthèse

---

### 📁 04_ORDRES_MISSION_52

**52 ordres de mission individuels HTML**

- Ordre de mission personnalisé par centrale
- Infos centrale, dates, périmètre intervention
- Signature DiagPV

**Exemple**: `OM_3085_Hangar_Maxime_Bayle.html`

---

### 📁 05_PREVENTION_SECURITE

**Plans prévention et sécurité toiture**

| Fichier | Description |
|---------|-------------|
| `MOP_INTERVENTIONS_TOITURE_DIAGPV.pdf` | Mode opératoire interventions toiture |
| Plans prévention | Documents sécurité spécifiques |

**Normes**: IEC 62446-3, IEC TS 63049, NF C 15-100

---

### 📁 06_SCRIPTS_AUTOMATISATION

**Scripts Python automatisation workflow**

| Script | Fonction |
|--------|----------|
| `generer_52_checklists_v2.py` | Génère 52 checklists V2 depuis template |
| `generer_annexe2_automatique.py` | Génère ANNEXE 2 depuis JSON checklists |
| `generer_rapport_individuel_centrale.py` | Génère rapport PDF avec photos |

**Prérequis**: Python 3.7+, openpyxl

---

### 📁 07_TEMPLATES_LIVRABLES

**Templates et données sources**

| Fichier | Description |
|---------|-------------|
| `TEMPLATE_CHECKLIST_TERRAIN_V2.html` | Template checklist V2 (20 sections, 174 items) |
| `ANNEXE2_GIRASOLE_SYNTHESE_AUTO.xlsx` | ANNEXE 2 pré-remplie 52 centrales |
| `RAPPORT_EXEMPLE_3085_Hangar_Maxime_Bayle.html` | Exemple rapport avec photos |
| `liste_52_centrales.json` | Liste complète 52 centrales (données ANNEXE 1) |

---

### 📁 08_GUIDE_UTILISATION

**Ce guide et documentation**

---

## 🔄 WORKFLOW COMPLET

### Phase 1: TERRAIN

```
Technicien sur site
   ↓
Ouvre CHECKLIST_{CODE}_{NOM}.html
   ↓
Complète 20 sections + upload photos
   ↓
Exporte JSON + ZIP photos
   ↓
Upload fichiers serveur DiagPV
```

### Phase 2: GÉNÉRATION LIVRABLES

```
JSON checklists + ZIP photos
   ↓
Script generer_annexe2_automatique.py
   ↓
ANNEXE 2 GIRASOLE (Excel) ✅
   ↓
Script generer_rapport_individuel_centrale.py
   ↓
52 Rapports PDF avec photos ✅
```

### Phase 3: LIVRAISON CLIENT

```
LIVRABLES GIRASOLE:
├── ANNEXE 2 (synthèse 52 centrales)
└── 52 Rapports individuels PDF avec photos
```

---

## 🎯 LIVRABLES GIRASOLE ATTENDUS

### 📋 ANNEXE 2 - Fichier de synthèse

**Format**: Excel  
**Contenu**: 52 centrales avec:
- ID, nom, puissance, type, département
- Date audit, auditeur, statut
- Anomalies (critiques, majeures, mineures)
- Nombre photos, conformité IEC 62446-3
- Recommandations prioritaires

**Génération**: Automatique depuis JSON checklists terrain

---

### 📸 52 Rapports individuels avec photos

**Format**: PDF professionnel  
**Contenu par centrale**:
- En-tête DiagPV (logo, RCS, coordonnées)
- Infos centrale (code, nom, GPS, puissance, type)
- Photos terrain (max 20 photos clés)
- Anomalies détectées (criticité, localisation)
- Recommandations
- Signature Fabien CORRERA
- Disclaimer conformité IEC

**Génération**: Automatique depuis JSON + ZIP photos

---

## 🚀 DÉMARRAGE RAPIDE

### 1. Distribution checklists terrain

```bash
# Envoyer fichiers HTML individuels aux techniciens
# Ex: Lyon → 14 checklists centrales Lyon
# Ex: Millau → 13 checklists centrales Millau
```

### 2. Collecte données terrain

```bash
# Récupérer de chaque technicien:
# - Fichier JSON export checklist
# - Fichier ZIP photos
# Centraliser dans dossier serveur
```

### 3. Génération ANNEXE 2

```bash
python3 06_SCRIPTS_AUTOMATISATION/generer_annexe2_automatique.py
# Output: ANNEXE2_GIRASOLE_SYNTHESE_AUTO.xlsx
```

### 4. Génération 52 rapports PDF

```bash
python3 06_SCRIPTS_AUTOMATISATION/generer_rapport_individuel_centrale.py
# Output: 52 fichiers RAPPORT_{CODE}_{NOM}.pdf
```

### 5. Livraison Girasole

```bash
# Envoyer:
# - ANNEXE 2 (Excel)
# - Dossier 52 Rapports PDF
```

---

## 📊 BUDGET MISSION

| Item | Quantité | Prix unitaire | Total |
|------|----------|---------------|-------|
| Centrales SOL | 39 | 1,020€ | 39,780€ |
| Centrales TOITURE | 13 | 1,485€ | 19,305€ |
| Frais déplacement | 52 | 150€ | 7,800€ |
| **TOTAL HT** | | | **66,885€** |

**Contrat**: 22COUTIN©  
**Période**: Janvier-Mars 2025

---

## 🔧 SUPPORT TECHNIQUE

**Questions urgentes**:  
📱 Adrien PAPPALARDO: 06 07 29 22 12  
📧 info@diagnosticphotovoltaique.fr

**Diagnostic Photovoltaïque**  
3 rue d'Apollo, 31240 L'UNION  
☎ 05.81.10.16.59  
🌐 www.diagnosticphotovoltaique.fr  
RCS Toulouse: 792 972 309

---

## ✅ CHECKLIST AVANT DÉMARRAGE

- [ ] Distribution 52 checklists terrain aux 4 bases
- [ ] Briefing techniciens (PowerPoint fourni)
- [ ] Test checklist HTML sur mobile/tablette
- [ ] Vérification export JSON fonctionne
- [ ] Planification tournées validée
- [ ] Plans prévention sécurité distribués
- [ ] Contact urgence terrain communiqué

---

**Version Pack**: FUSION ULTIME v1.0  
**Date création**: 19 novembre 2025  
**Créé par**: Diagnostic Photovoltaïque - SuperAgent DiagPV

---

🚀 **Prêt pour mission GIRASOLE 2025 !**
