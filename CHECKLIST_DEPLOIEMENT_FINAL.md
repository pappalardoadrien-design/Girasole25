# ✅ CHECKLIST DÉPLOIEMENT FINAL - GIRASOLE 2025

**Mission**: Audit 52 centrales photovoltaïques  
**Statut**: 🟢 SYSTÈME 100% OPÉRATIONNEL  
**Date validation**: 2025-11-19 19:26  
**Backup**: `GIRASOLE_MISSION_2025_FINAL_BACKUP_20251119_192607.tar.gz` (1.6 MB)  

---

## 🎯 PHASE 1: DÉPLOIEMENT IMMÉDIAT (TONIGHT)

### 1.1. GitHub Pages - Checklists Web (5 min) ⏱️

- [ ] **Extraire package GitHub**
  ```bash
  cd /home/user/girasole_mission_2025
  unzip /mnt/aidrive/GIRASOLE/GIRASOLE_2025_PACK_COMPLET_GITHUB.zip -d github_pages_deploy
  ```

- [ ] **Créer dépôt GitHub**
  - Nom: `girasole-checklists-2025` (ou autre)
  - Visibilité: Public (ou Private si GitHub Pro)
  - Description: "Checklists terrain GIRASOLE 2025 - Diagnostic Photovoltaïque"

- [ ] **Pousser fichiers**
  ```bash
  cd github_pages_deploy
  git init
  git add .
  git commit -m "Deploy GIRASOLE 2025 checklists - 52 centrales"
  git remote add origin https://github.com/[USERNAME]/girasole-checklists-2025.git
  git branch -M main
  git push -u origin main
  ```

- [ ] **Activer GitHub Pages**
  - Settings → Pages → Source: `main` branch / `/ (root)`
  - Attendre 1-2 min déploiement

- [ ] **Tester URL publique**
  - Ouvrir: `https://[USERNAME].github.io/girasole-checklists-2025/`
  - Vérifier liste 52 centrales
  - Tester 1 checklist (remplir + export JSON)

- [ ] **Noter URL finale**
  ```
  URL PRODUCTION: _________________________________
  ```

---

### 1.2. Distribution URL Auditeurs (10 min) 📱

- [ ] **Créer email brief auditeurs**
  ```
  Objet: [GIRASOLE 2025] Accès checklists terrain

  Bonjour,

  Voici l'accès aux checklists terrain pour la mission GIRASOLE 2025:

  🔗 URL: https://[USERNAME].github.io/girasole-checklists-2025/

  📋 MODE D'EMPLOI:
  1. Ouvrir URL sur mobile/tablette
  2. Sélectionner votre centrale dans liste
  3. Remplir checklist (auto-save automatique)
  4. Prendre photos installation
  5. Cliquer "Exporter JSON" en fin d'audit
  6. Envoyer JSON + photos ZIP au BE

  ⚠️ IMPORTANT:
  - Données sauvegardées localement (pas de connexion requise)
  - Ne pas vider cache navigateur pendant mission
  - Vérifier export JSON avant envoi BE

  📱 ASTUCE: Ajouter URL en raccourci écran d'accueil

  Support: contact@diagpv.fr | 05.81.10.16.59

  Diagnostic Photovoltaïque
  ```

- [ ] **Envoyer email auditeurs**
- [ ] **Vérifier réception confirmée**
- [ ] **Tester accès sur mobile (iOS/Android)**

---

### 1.3. Formation BE - Scripts Python (15 min) 🐍

- [ ] **Briefing BE - Workflow complet**
  1. Réception JSON terrain + photos ZIP auditeurs
  2. Placement fichiers:
     - JSON → `exports_json/[ID]_terrain.json`
     - Photos → `photos_centrales/[ID]_photos.zip`
  3. Validation BE → Export `[ID]_be.json`
  4. Exécution scripts:
     ```bash
     cd scripts_python
     python3 generer_annexe2_automatique.py
     python3 generer_rapports_diagpv_girasole_COMPLET.py
     ```
  5. Récupération outputs:
     - `outputs_annexe2/ANNEXE2_*.xlsx`
     - `outputs_rapports/RAPPORT_*.docx`

- [ ] **Demo script ANNEXE2**
  ```bash
  cd /home/user/girasole_mission_2025/scripts_python
  python3 generer_annexe2_automatique.py
  ```

- [ ] **Demo script Rapports**
  ```bash
  python3 test_workflow_3085.py
  ```

- [ ] **Vérifier dépendances installées**
  ```bash
  pip list | grep -E "(python-docx|Pillow|openpyxl)"
  ```
  Si manquant:
  ```bash
  pip install python-docx Pillow openpyxl
  ```

- [ ] **Former BE sur validation checklist**
  - Ouvrir: `checklist_be/TEMPLATE_CHECKLIST_BE_V2.html`
  - Remplir sections validation
  - Export JSON BE

---

## 🎯 PHASE 2: PRÉPARATION DOE (1-2H)

### 2.1. Récupération DOE Centrales

- [ ] **Inventorier DOE disponibles**
  - Source: [À compléter - Client GIRASOLE?]
  - Format attendu: Dossiers par centrale avec:
    - `BE-OUT-003-Config_elect_centrale_PV-[ID].xlsm`
    - `BE-OUT-004-Fiche_controle_elec-[ID].pdf`

- [ ] **Organiser structure DOE**
  ```bash
  mkdir -p /home/user/girasole_mission_2025/doe_sources
  # Copier DOE selon structure:
  # doe_sources/
  #   ├── 3085_Hangar_Maxime_Bayle/
  #   │   ├── BE-OUT-003-*.xlsm
  #   │   └── BE-OUT-004-*.pdf
  #   └── ...
  ```

- [ ] **Vérifier nomenclature fichiers conforme**

---

### 2.2. Extraction DOE Automatique

- [ ] **Lancer extraction**
  ```bash
  cd /home/user/girasole_mission_2025/scripts_python
  python3 extraire_doe_girasole.py
  ```

- [ ] **Vérifier outputs JSON**
  ```bash
  ls -l ../doe_extractions/
  ```
  Attendu: `[ID]_config.json` + `[ID]_controles.json` par centrale

- [ ] **Analyser log extraction**
  - Vérifier alertes cohérence
  - Noter centrales avec DOE manquants
  - Corriger fichiers sources si nécessaire

- [ ] **Statistiques extraction**
  ```
  ✅ Config électrique extraite: ____ / 52
  ✅ Contrôles extraits: ____ / 52
  ⚠️  Fichiers manquants: ____
  ```

---

### 2.3. Pré-remplissage Checklists (si script créé)

- [ ] **Créer script `preremplir_checklists_avec_doe.py`** (optionnel)
- [ ] **Lancer pré-remplissage**
- [ ] **Vérifier checklists pré-remplies**
- [ ] **Redéployer sur GitHub Pages si modifications**

---

## 🎯 PHASE 3: MISSION EN COURS (J+1 → J+30)

### 3.1. Suivi Avancement Audits

- [ ] **Tableau suivi Excel créé**
  - Colonnes: ID, Nom, Date audit, Auditeur, Statut, JSON reçu, Photos reçues, BE validé, Rapport généré

- [ ] **Mise à jour quotidienne**
  - Centrales auditées: _____ / 52
  - JSON terrain reçus: _____ / 52
  - JSON BE validés: _____ / 52
  - Rapports générés: _____ / 52

---

### 3.2. Génération Continue Outputs

#### Quotidien (ou au fil de l'eau)

- [ ] **Récupérer JSON + photos auditeurs**
- [ ] **Placer dans workspace**
- [ ] **Générer ANNEXE 2 actualisée**
  ```bash
  cd scripts_python
  python3 generer_annexe2_automatique.py
  ```

- [ ] **Générer rapports nouvelles centrales**
  ```bash
  python3 generer_rapports_diagpv_girasole_COMPLET.py
  ```

- [ ] **Archiver outputs avec timestamp**

---

### 3.3. Contrôle Qualité

- [ ] **Vérifier conformité rapports**
  - Branding DiagPV correct
  - Photos bien intégrées
  - Sections complètes
  - Signature Fabien CORRERA présente

- [ ] **Vérifier ANNEXE 2**
  - 52 lignes présentes
  - Données cohérentes
  - Formules Excel fonctionnelles

- [ ] **Valider anomalies détectées**
  - Criticité correcte (CRITICAL/MAJOR/MINOR)
  - Recommandations pertinentes
  - Photos anomalies associées

---

## 🎯 PHASE 4: LIVRAISON FINALE (J+30)

### 4.1. Consolidation Livrables

- [ ] **ANNEXE 2 finale 52 centrales**
  - Toutes lignes complétées
  - Statistiques globales calculées
  - Export PDF + Excel

- [ ] **52 rapports PDF générés**
  - Conversion DOCX → PDF (LibreOffice headless)
  ```bash
  for file in outputs_rapports/*.docx; do
    libreoffice --headless --convert-to pdf "$file" --outdir outputs_rapports/
  done
  ```

- [ ] **Archivage photos par centrale**
  - 1 ZIP par centrale
  - Nomenclature: `[ID]_[NOM]_photos.zip`

- [ ] **Documentation mission**
  - README mission
  - Guides utilisés
  - Logs extraction/génération

---

### 4.2. Package Client GIRASOLE

- [ ] **Créer structure livraison**
  ```
  GIRASOLE_2025_LIVRAISON_FINALE/
  ├── ANNEXE2_FINALE/
  │   ├── ANNEXE2_GIRASOLE_SYNTHESE_FINALE.xlsx
  │   └── ANNEXE2_GIRASOLE_SYNTHESE_FINALE.pdf
  ├── RAPPORTS_52_CENTRALES/
  │   ├── RAPPORT_3085_Hangar_Maxime_Bayle.pdf
  │   └── ... (51 autres)
  ├── PHOTOS_CENTRALES/
  │   ├── 3085_Hangar_Maxime_Bayle_photos.zip
  │   └── ... (51 autres)
  └── DOCUMENTATION/
      ├── README_LIVRAISON.pdf
      └── METHODOLOGIE_AUDIT_IEC_62446.pdf
  ```

- [ ] **Compression package final**
  ```bash
  tar -czf GIRASOLE_2025_LIVRAISON_FINALE.tar.gz GIRASOLE_2025_LIVRAISON_FINALE/
  ```

- [ ] **Upload package sur plateforme sécurisée**
  - WeTransfer / Google Drive / Serveur client
  - Noter URL téléchargement

---

### 4.3. Communication Client

- [ ] **Email livraison finale**
  ```
  Objet: [GIRASOLE 2025] Livraison finale - 52 centrales auditées

  Bonjour,

  Nous avons le plaisir de vous livrer les résultats complets 
  de la mission d'audit des 52 centrales photovoltaïques GIRASOLE 2025.

  📦 LIVRABLES:
  - ANNEXE 2 synthèse (Excel + PDF)
  - 52 rapports d'audit DiagPV (PDF conformes IEC 62446-1)
  - Photos d'installation (52 ZIP)
  - Documentation méthodologie

  🔗 TÉLÉCHARGEMENT: [URL]

  📊 SYNTHÈSE MISSION:
  - Centrales auditées: 52/52 (100%)
  - Anomalies critiques détectées: ____
  - Anomalies majeures détectées: ____
  - Anomalies mineures détectées: ____
  - Taux conformité IEC 62446-1: ____%

  📞 RÉUNION RESTITUTION:
  Nous restons à votre disposition pour présenter les résultats.

  Cordialement,

  Fabien CORRERA
  Responsable Technique
  Diagnostic Photovoltaïque
  05.81.10.16.59 | contact@diagpv.fr
  ```

- [ ] **Planifier réunion restitution**
- [ ] **Préparer présentation PowerPoint synthèse**

---

## 📊 MÉTRIQUES SUCCÈS MISSION

### Objectifs atteints
- [ ] **52 centrales auditées**: _____ / 52 (____%)
- [ ] **Rapports livrés < 5 jours**: Oui ☐ Non ☐
- [ ] **Conformité IEC 62446-1**: 100% ☐
- [ ] **Satisfaction client**: ⭐⭐⭐⭐⭐

### Performance système
- [ ] **Checklists web uptime**: ____% (objectif > 99%)
- [ ] **Scripts Python succès rate**: ____% (objectif 100%)
- [ ] **Temps moyen génération rapport**: ____ min (objectif < 5 min)
- [ ] **Erreurs manuelles**: ____ (objectif 0)

### ROI automatisation
- [ ] **Temps gagné vs manuel**: ____ heures
- [ ] **Coût économisé**: ____ €
- [ ] **Gain qualité**: Réduction erreurs de ____%

---

## 🔒 ARCHIVAGE POST-MISSION

### Sauvegarde workspace
- [ ] **Backup final workspace**
  ```bash
  cd /home/user
  tar -czf GIRASOLE_2025_ARCHIVE_FINAL_$(date +%Y%m%d).tar.gz girasole_mission_2025/
  ```

- [ ] **Copie AI Drive**
  ```bash
  cp GIRASOLE_2025_ARCHIVE_FINAL_*.tar.gz /mnt/aidrive/GIRASOLE/ARCHIVES/
  ```

- [ ] **Copie serveur DiagPV** (si applicable)

### Rétention données
- [ ] **GitHub Pages: Désactiver après mission** (si données confidentielles)
- [ ] **Supprimer données locales après archivage**
- [ ] **Conserver backup 3 ans** (conformité audit)

---

## ✅ VALIDATION FINALE CHECKLIST

### Signature validation

**Responsable technique**: _____________________  
**Date**: _____ / _____ / 2025  
**Signature**: 

**Chef de projet**: _____________________  
**Date**: _____ / _____ / 2025  
**Signature**: 

---

## 📞 CONTACTS URGENCE

### Support technique
- **DiagPV**: 05.81.10.16.59
- **Email**: contact@diagpv.fr
- **Urgence**: [À compléter]

### Client GIRASOLE
- **Contact principal**: [À compléter]
- **Email**: [À compléter]
- **Tél**: [À compléter]

---

**Diagnostic Photovoltaïque - Groupe Watt&co**  
*3 rue d'Apollo, 31240 L'UNION*  
*RCS Toulouse 792 972 309*  
*www.diagnosticphotovoltaique.fr*
