# 🔄 WORKFLOW COMPLET GIRASOLE - 52 Centrales Photovoltaïques

## 📋 Vue d'Ensemble

**Projet**: Audit de 52 centrales photovoltaïques pour client GIRASOLE  
**Acteurs**: DiagPV (toi), Sous-Traitants, Techniciens terrain  
**Outils**: Planning Manager + Module Audit Mobile + Export Excel

---

## 🎯 PHASE 1 : PLANIFICATION (URGENT - Deadline 14h)

### 🖥️ Interface Bureau : Planning Manager
**URL**: https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/planning-manager

### Étapes :

#### 1️⃣ Attribution Manuelle (52 centrales)
**Qui**: Adrien (toi)  
**Quand**: MAINTENANT (avant 14h00)

Pour **chaque ligne** du tableau :

```
[ID_REF] [Nom Centrale] [Dept] [Distance] [Base]
   ↓          ↓            ↓        ↓        ↓
98563    TOURNIER        31     41 km   Toulouse
```

**Actions** :
1. **Dropdown Sous-Traitant** → Sélectionner entreprise partenaire
   - Exemple : "EcoPV Solutions", "SolarTech Midi-Pyrénées"
   
2. **Dropdown Technicien** → Sélectionner technicien (filtré par ST)
   - Exemple : "Pierre Martin", "Jean Dupont"
   
3. **Input Date** → Choisir date mission
   - Exemple : 2025-01-15, 2025-01-20
   
4. **✅ Auto-save** → Flash vert automatique quand les 3 champs remplis

**Astuce Optimisation** :
- Trier par **Base proche** (Toulouse/Lyon)
- Trier par **Département** pour regrouper géographiquement
- Utiliser même ST pour plusieurs centrales proches

---

#### 2️⃣ Génération Ordres de Mission
**Qui**: Adrien  
**Quand**: Après avoir attribué les 52 centrales

**Actions** :
1. Cliquer bouton **"Générer ordres de mission"** (orange)
2. Confirmation popup
3. Système crée automatiquement :
   - 52 ordres de mission avec statut `PLANIFIE`
   - Numéros mission uniques
   - Dates/horaires/ST/Technicien pré-remplis

**Résultat** :
```
✅ Ordres de mission générés !

📊 Total traités : 52
✨ Créés : 52
🔄 Mis à jour : 0
❌ Erreurs : 0
```

---

#### 3️⃣ Export Excel pour Client GIRASOLE
**Qui**: Adrien  
**Quand**: Juste avant envoi client (avant 14h00)

**Actions** :
1. Cliquer bouton **"Exporter Excel"** (vert)
2. Fichier téléchargé : `planning_girasole_2025-11-21.csv`
3. Ouvrir dans Excel/LibreOffice
4. Vérifier données complètes

**Colonnes CSV** :
```
ID, ID_REF, Centrale, Type, Puissance (kWc), Localisation, Département,
Distance (km), Base, Date Mission, Sous-Traitant, Contact ST, Technicien, Tel Tech
```

**Envoi Client** :
- Email à GIRASOLE avec CSV joint
- ⏰ **DEADLINE : 14h00 aujourd'hui**

---

## 🚀 PHASE 2 : EXÉCUTION TERRAIN (Après Planification)

### 📱 Interface Mobile : Module Audit

#### 1️⃣ Accès Mission par Technicien
**Qui**: Technicien terrain  
**Quand**: Jour de la mission (selon planning)

**URL Format** :
```
https://[domaine]/audit/[MISSION_ID]
```

**Exemple** :
```
https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/audit/42
```

**Comment le technicien obtient l'URL** :
- **Option 1** : Email automatique avec lien direct
- **Option 2** : SMS avec lien court
- **Option 3** : Scan QR code sur ordre de mission papier
- **Option 4** : Portail technicien avec liste missions du jour

---

#### 2️⃣ Interface Audit Mobile (PWA)

**Affichage** :

```
╔═══════════════════════════════════════════════╗
║  📍 Audit TOURNIER (98563)                     ║
║  🏢 Toulouse (31) - 197.9 kWc                  ║
║  👷 Pierre Martin - EcoPV Solutions            ║
║                                                ║
║  [████████░░░░░░░░░░] 42% Complété            ║
╠═══════════════════════════════════════════════╣
║                                                ║
║  📸 CONTRÔLE VISUEL MODULES                    ║
║  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━  ║
║                                                ║
║  ✓ 1. État général modules                     ║
║     [✓ Conforme] [✗ Non-conforme] [N/A]       ║
║     📷 Photo : [IMG_001.jpg] ✓                 ║
║     💬 Commentaire : RAS, modules propres      ║
║                                                ║
║  □ 2. Absence fissures/microfissures           ║
║     [  Conforme] [Non-conforme] [N/A]          ║
║     📷 [Prendre photo] 📸                      ║
║     💬 Commentaire : _____                     ║
║                                                ║
║  □ 3. Absence points chauds (thermographie)    ║
║     [  Conforme] [Non-conforme] [N/A]          ║
║     📷 [Prendre photo] 📸                      ║
║     💬 Commentaire : _____                     ║
║                                                ║
╠═══════════════════════════════════════════════╣
║  📸 CONTRÔLE ÉLECTRIQUE                        ║
║  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━  ║
║                                                ║
║  □ 4. Tension string 1                         ║
║  □ 5. Courant string 1                         ║
║  □ 6. Onduleur fonctionnel                     ║
║  ...                                           ║
╠═══════════════════════════════════════════════╣
║                                                ║
║  [💾 Enregistrer] [✅ Terminer Audit]          ║
║                                                ║
╚═══════════════════════════════════════════════╝
```

---

#### 3️⃣ Checklist Complète par Catégorie

**Catégories disponibles** :

1. **📸 CONTRÔLE VISUEL MODULES**
   - État général modules
   - Absence fissures/microfissures
   - Absence points chauds (thermographie)
   - Propreté modules
   - Câblage visible correct
   - État connecteurs MC4
   - Photos obligatoires : Vue générale, Détails modules, Points chauds

2. **⚡ CONTRÔLE ÉLECTRIQUE**
   - Tension string (par string)
   - Courant string (par string)
   - Courbes IV (sombres + référence)
   - Résistance isolation
   - Onduleur fonctionnel
   - Monitoring actif
   - Photos : Multimètre, Onduleur, Boîtier

3. **🔧 CONTRÔLE MÉCANIQUE**
   - Fixations structures
   - État châssis
   - Étanchéité toiture (si TOITURE)
   - Ancrage sol (si SOL)
   - Chemins de câbles
   - Photos : Structures, Ancrages, Câblage

4. **🔥 SÉCURITÉ INCENDIE**
   - Accès pompiers
   - Coupure urgence accessible
   - Signalétique présente
   - Extincteurs (si applicable)
   - Photos : Panneaux, Accès, Coupure urgence

5. **📊 PERFORMANCE**
   - Production réelle vs attendue
   - Ratio Performance (PR)
   - Analyse monitoring
   - Détection ombrage
   - Photos : Courbes production, Historiques

---

#### 4️⃣ Workflow Technicien sur Site

**1. Arrivée sur site** (08h00)
```
→ Ouvrir URL mission sur smartphone/tablette
→ Vérifier informations centrale (puissance, adresse)
→ Initialiser checklist
→ Photo panoramique installation
```

**2. Audit terrain** (08h30 - 15h00)
```
→ Pour chaque point de contrôle :
   ✓ Effectuer mesure/inspection
   ✓ Prendre photo(s) obligatoire(s)
   ✓ Sélectionner statut : Conforme / Non-conforme / N/A
   ✓ Ajouter commentaire si anomalie
   ✓ Cliquer "Enregistrer" → Auto-save instantané
   
→ Barre progression mise à jour automatiquement
→ Sections sauvegardées en temps réel (hors-ligne OK)
```

**3. Fin d'audit** (15h30)
```
→ Vérifier 100% checklist complété
→ Cliquer "Terminer Audit"
→ Système génère automatiquement :
   ✓ Rapport PDF pré-rempli
   ✓ Upload photos vers serveur
   ✓ Notification à DiagPV
   ✓ Statut mission → "TERMINE"
```

---

## 📊 PHASE 3 : VALIDATION & RAPPORT (DiagPV)

### 🖥️ Interface Bureau : Dashboard

**URL**: https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/

#### 1️⃣ Suivi en Temps Réel

**Dashboard Statistiques** :
```
╔════════════════════════════════════════════════════╗
║  📊 TABLEAU DE BORD GIRASOLE 2025                   ║
╠════════════════════════════════════════════════════╣
║                                                     ║
║  [52] Centrales      [12] Auditées                 ║
║  [40] À auditer      [8] Validées                  ║
║                                                     ║
║  📈 Progression : [████░░░░] 23%                    ║
╠════════════════════════════════════════════════════╣
║  🏢 PAR TYPE                                        ║
║  SOL      : 38 (73%)  [██████████████░░░░]         ║
║  TOITURE  : 13 (25%)  [█████░░░░░░░░░░░░]         ║
║  OMBRIERE : 1  (2%)   [░░░░░░░░░░░░░░░░░]         ║
╠════════════════════════════════════════════════════╣
║  📍 PAR BASE                                        ║
║  Toulouse : 26 centrales                           ║
║  Lyon     : 26 centrales                           ║
╠════════════════════════════════════════════════════╣
║  ⚠️ ALERTES                                         ║
║  🔴 3 Centrales - Non-conformités critiques        ║
║  🟡 7 Centrales - Observations mineures            ║
║  🟢 2 Centrales - RAS (conformes)                  ║
╚════════════════════════════════════════════════════╝
```

---

#### 2️⃣ Validation Rapports

**Processus DiagPV** :

1. **Notification Audit Complété**
   - Email automatique : "✅ Audit TOURNIER terminé"
   - Dashboard mis à jour temps réel

2. **Consultation Rapport Terrain**
   - Accès URL : `/api/ordres-mission/[ID]/rapport-final`
   - Voir toutes photos + checklist
   - Commentaires technicien

3. **Analyse Technique DiagPV**
   ```
   → Vérifier conformité photos (qualité, angles)
   → Analyser anomalies détectées
   → Valider mesures électriques
   → Évaluer gravité non-conformités
   ```

4. **Décision** :
   - ✅ **VALIDE** → Statut `VALIDE` → Envoi rapport client
   - ❌ **REJET** → Retour technicien pour complément
   - ⚠️ **OBSERVATION** → Demande clarifications

---

#### 3️⃣ Génération Rapport Client Final

**Format Rapport DiagPV Normé** :

```
═══════════════════════════════════════════════════
  RAPPORT D'AUDIT PHOTOVOLTAÏQUE
  Diagnostic Photovoltaïque - Indépendant & Neutre
═══════════════════════════════════════════════════

CENTRALE : TOURNIER (ID 98563)
LOCALISATION : 548 Route de Marignac, 31430 Gratens
PUISSANCE : 197.925 kWc - Type TOITURE

DATE AUDIT : 15/01/2025
TECHNICIEN : Pierre Martin - EcoPV Solutions
DURÉE : 7h00

─────────────────────────────────────────────────

📋 RÉSUMÉ EXÉCUTIF

✅ Conformité Globale : 92%
⚠️ Observations : 3 mineures
🔴 Non-conformités : 1 majeure

SYNTHÈSE VERDICT : Installation majoritairement conforme
avec 1 point d'attention nécessitant intervention corrective.

─────────────────────────────────────────────────

📸 CONTRÔLE VISUEL MODULES

✅ État général modules : CONFORME
   → Modules propres, absence dégradation visible
   → Photos : IMG_001.jpg, IMG_002.jpg

⚠️ Absence fissures : OBSERVATION MINEURE
   → 2 microfissures détectées cellules modules B3-C5
   → Impact production estimé : -0.5%
   → Photos thermographie : IMG_003.jpg
   → Recommandation : Surveillance monitoring 6 mois

✅ Absence points chauds : CONFORME
   → Thermographie nocturne complète
   → Aucun hotspot détecté (ΔT < 10°C)
   → Photos : IMG_004.jpg, IMG_005.jpg

─────────────────────────────────────────────────

⚡ CONTRÔLE ÉLECTRIQUE

✅ Courbes IV : CONFORME
   → String 1 : Voc=485V, Isc=9.2A
   → String 2 : Voc=482V, Isc=9.1A
   → Matching < 2% (excellent)

🔴 Isolation : NON-CONFORME
   → Résistance isolation String 2 : 0.8 MΩ
   → Norme NF C 15-100 : > 1 MΩ requis
   → Action immédiate : Recherche défaut câblage
   → Photos : IMG_009.jpg

✅ Onduleur : CONFORME
   → Fronius Symo 200kW - Fonctionnel
   → Monitoring actif
   → Production J-30 : 98.5% attendu

─────────────────────────────────────────────────

📊 PERFORMANCE PRODUCTION

Production Réelle (12 derniers mois) : 245 MWh
Production Théorique : 255 MWh
Ratio Performance (PR) : 96.1%

✅ Performance : EXCELLENTE
   → PR > 95% (objectif atteint)
   → Pertes < 5% (normes respectées)

─────────────────────────────────────────────────

🔧 PRÉCONISATIONS HIÉRARCHISÉES

PRIORITÉ 1 - URGENT (< 1 mois)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. 🔴 Défaut isolation String 2
   → Impact : Sécurité + Production
   → Action : Recherche défaut câblage + Remplacement
   → Gain estimé : +2% production (4.9 MWh/an, 750 €/an)
   → Risque si non traité : Incendie potentiel

PRIORITÉ 2 - MOYEN TERME (3-6 mois)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
2. ⚠️ Surveillance microfissures
   → Impact : Production (-0.5% actuellement)
   → Action : Monitoring thermographie semestre
   → Coût : Inclus maintenance préventive

PRIORITÉ 3 - RECOMMANDATIONS (1 an)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
3. 🟢 Nettoyage modules
   → Impact : Optimisation (+1% production)
   → Action : Nettoyage annuel programmé

─────────────────────────────────────────────────

📎 ANNEXES

- 47 Photos HD (thermographie, détails, mesures)
- Courbes IV complètes (strings 1-2)
- Historique monitoring 12 mois
- Certificats conformité équipements

─────────────────────────────────────────────────

SIGNATURES

Technicien Terrain          Expert DiagPV
Pierre Martin               Coordinateur Mission GIRASOLE
EcoPV Solutions             Business Developer
Date : 15/01/2025           Date : 16/01/2025

═══════════════════════════════════════════════════
```

---

## 📤 PHASE 4 : LIVRAISON CLIENT (GIRASOLE)

### Format Livraison Finale

**Package Client GIRASOLE** :

```
📦 LIVRAISON_GIRASOLE_2025/
├── 📊 planning_final_52_centrales.xlsx
├── 📁 RAPPORTS_AUDITS/
│   ├── 98563_TOURNIER_Rapport_DiagPV.pdf
│   ├── 30516_LAMIOT_Rapport_DiagPV.pdf
│   ├── ... (52 rapports PDF)
│   └── index.html (navigation rapide)
│
├── 📁 SYNTHESE_GLOBALE/
│   ├── synthese_executive_52_centrales.pdf
│   ├── cartographie_anomalies.xlsx
│   ├── budget_corrections_prioritaires.xlsx
│   └── planning_interventions_recommandees.xlsx
│
└── 📁 ANNEXES_TECHNIQUES/
    ├── photos_thermographie.zip (52 centrales)
    ├── courbes_IV_completes.zip
    └── historiques_monitoring.xlsx
```

---

## 🔗 URLS SYSTÈME - Référence Rapide

### Interfaces Bureau (DiagPV)
```
Dashboard Général      : https://[domaine]/
Planning Manager       : https://[domaine]/planning-manager
Stats Temps Réel       : https://[domaine]/api/stats
Export Planning        : https://[domaine]/api/planning/export-data
```

### Interfaces Mobile (Techniciens)
```
Audit Mission          : https://[domaine]/audit/[MISSION_ID]
Checklist Centrale     : https://[domaine]/api/checklist/[MISSION_ID]
Upload Photos          : https://[domaine]/api/retours-json
```

### API Endpoints (Intégrations)
```
Liste Centrales        : GET /api/centrales
Stats Planning         : GET /api/stats/planning
Ordres Mission         : GET /api/ordres-mission
Sous-Traitants         : GET /api/sous-traitants
Techniciens            : GET /api/techniciens
Génération Batch       : POST /api/planning/generate-all-missions
```

---

## 📱 INSTALLATION APP MOBILE (PWA)

### Pour Techniciens

**Android** :
1. Ouvrir URL audit dans Chrome
2. Menu ⋮ → "Ajouter à l'écran d'accueil"
3. Icon "DiagPV Audit" créée
4. Fonctionne hors-ligne après 1ère visite

**iOS** :
1. Ouvrir URL audit dans Safari
2. Bouton Partage 📤 → "Sur l'écran d'accueil"
3. Icon "DiagPV Audit" créée
4. Fonctionne hors-ligne après 1ère visite

**Avantages PWA** :
- ✅ Pas d'installation App Store/Play Store
- ✅ Mise à jour automatique
- ✅ Fonctionne hors réseau (cache local)
- ✅ Photos sauvegardées localement puis sync
- ✅ Notifications push possibles

---

## 🎯 RÉCAPITULATIF ACTEURS & RÔLES

| Acteur | Phase | Interface | Actions Clés |
|--------|-------|-----------|--------------|
| **Adrien (DiagPV)** | Planification | Planning Manager | Attribution ST+Tech+Date, Génération missions, Export Excel client |
| **Sous-Traitant** | Coordination | Email/Portail | Réception ordres mission, Validation disponibilités techniciens |
| **Technicien** | Terrain | Audit Mobile | Checklist complète, Photos, Mesures, Upload données |
| **Adrien (DiagPV)** | Validation | Dashboard | Analyse rapports, Validation conformité, Rédaction synthèse |
| **Client GIRASOLE** | Réception | Email/Portail | Consultation rapports, Planning interventions, Suivi budget |

---

## ⏰ TIMELINE TYPE - 1 Centrale

```
J-7  : Attribution mission (Planning Manager)
J-5  : Email ordre mission → ST → Technicien
J-3  : Technicien télécharge checklist hors-ligne
J-1  : Technicien prépare matériel (thermographie, multimètre)

J DAY : 🚀 AUDIT TERRAIN
───────────────────────────
08h00 : Arrivée site + Photo panoramique
08h30 : Contrôle visuel modules (30 photos)
10h00 : Pause
10h15 : Thermographie nocturne si hotspots suspectés
12h00 : Pause déjeuner
13h00 : Mesures électriques (courbes IV, isolation)
14h30 : Contrôle mécanique structures
15h30 : Vérification monitoring + Performance
16h00 : Finalisation checklist + Upload
16h30 : Départ site

J+1 : ✅ Notification DiagPV "Audit terminé"
J+2 : 📊 Adrien valide rapport terrain
J+3 : 📝 Adrien rédige rapport final normé
J+4 : 📤 Envoi rapport client GIRASOLE

J+7 : 💬 Réunion client présentation résultats
```

---

## 🔧 TROUBLESHOOTING TERRAIN

### Problème : Pas de réseau sur site
**Solution** : PWA fonctionne hors-ligne
- Checklist chargée en cache
- Photos sauvegardées localement
- Sync auto dès retour réseau

### Problème : Batterie smartphone faible
**Solution** : Mode économie d'énergie
- Désactiver fond d'écran animé
- Réduire luminosité
- Powerbank 20000mAh recommandé

### Problème : Photo floue/illisible
**Solution** : Guides visuels intégrés
- Nettoyer objectif
- Stabiliser smartphone
- Zoom numérique si besoin
- Prendre 2-3 photos par point

### Problème : Mesure électrique incohérente
**Solution** : Répéter mesure
- Vérifier connexion multimètre
- Contrôler ensoleillement stable
- Prendre photo écran multimètre
- Noter conditions (nuage, T°C)

---

**🎉 WORKFLOW COMPLET OPÉRATIONNEL !**

📞 Support DiagPV : adrien@diagpv.fr  
📱 Hotline Techniciens : +33 6 XX XX XX XX  
🌐 Portail : https://girasole-webapp.pages.dev
