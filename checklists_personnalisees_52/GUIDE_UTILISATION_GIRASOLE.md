# 📋 GUIDE UTILISATION - CHECKLISTS TERRAIN GIRASOLE 2025

## 🎯 OBJECTIF

Ce package contient **52 checklists personnalisées** pour les audits qualité terrain des centrales photovoltaïques GIRASOLE 2025, conformément au **CDC PERF-CDC-001**.

**Chaque checklist est unique** et correspond à **une centrale spécifique** avec ses informations propres (ID, nom, puissance, adresse, installateur).

---

## 📦 CONTENU DU PACKAGE

```
GIRASOLE_2025_CHECKLISTS_TERRAIN_FINAL/
├── CHECKLIST_31971_Antunez_-_SCI_ANAUJA.html
├── CHECKLIST_89219_EARL_CADOT.html (TOITURE)
├── ... (50 autres checklists)
├── GUIDE_UTILISATION_GIRASOLE.md        ← Ce fichier
├── CDC_PERF-CDC-001.pdf                 ← Cahier des charges officiel
├── CONTACT_SUPPORT.txt                  ← Support technique
└── EXEMPLE_EXPORT_JSON.json             ← Format export attendu
```

---

## 🔆 DEUX TYPES D'AUDITS (CDC §2.2)

### ☀️ **AUDIT ÉLECTRIQUE VISUEL SEUL** (39 centrales)
**Fichiers :** 43 KB  
**Sections :**
1. ✅ Préparation intervention (plan prévention, habilitations, documents)
2. ⚡ Conformité NF C 15-100 (inspection VISUELLE électrique BT)
3. 🔌 Conformité UTE C 15-712 (inspection VISUELLE spécifique PV)
4. 🛠️ Bonnes/Mauvaises pratiques (CDC §2.5 - liste exhaustive)
5. 📋 Prescriptions GIRASOLE (autocontrôle, PV réception, CR visite, tranchées)

**⚠️ IMPORTANT : PAS de mesures électriques** (multimètre, testeur isolement)  
**Audit VISUEL uniquement** (conformité apparente, état équipements, repérage, etc.)

**Durée estimée :** 3-4 heures + 30-40 photos

---

### 🏠 **AUDIT ÉLECTRIQUE + TOITURE** (13 centrales)
**Fichiers :** 60 KB  
**Sections :** Identiques + **section supplémentaire OBLIGATOIRE**

**6. 🏠 INSPECTION TOITURE (DTU 40.35 + ETN + Notice - Démontage 25 panneaux)**

**⚠️ SÉCURITÉ PRÉALABLE (MOP DiagPV) :**
- EPI anti-chute complet porté (harnais EN361, longes EN354/355, casque EN397)
- Ligne vie/point ancrage identifié OU nacelle positionnée stable
- Conditions météo (vent <40 km/h, pas pluie, toiture sèche)
- **INTERDIT ABSOLU** : Marcher sur panneaux PV (CDC §2.6)

**🔧 DÉMONTAGE MINIMUM 25 PANNEAUX (CDC §2.2) :**
- 1er + dernier panneau String 1, String 2, String 3 (6 panneaux)
- Zones critiques (bord toiture vent, près exutoire/faîtage, angle)
- Suspicions visuelles (décollement, connecteurs exposés)
- **Remontage sans atteindre intégrité panneaux/supports**

**🔩 FIXATIONS DTU 40.35 :**
- Boulonnerie inox A4/A2, serrage couple-mètre si possible
- Étanchéité percements (Kalzips/bac acier intacts, joints EPDM présents)
- Fixations panneaux (mid-clamp/end-clamp conformes notice)
- Étanchéité sous panneaux (couverture OK, plots EPDM en place)

**📜 CONFORMITÉ ETN + NOTICE MONTAGE :**
- Respect prescriptions ETN système intégration utilisé
- Respect notice montage panneau (nombre fixations, espacements)
- **Si non-respect pour raison conception initiale → signaler immédiatement**

**Durée estimée :** 6-8 heures + 35-50 photos

---

## 📱 UTILISATION TERRAIN (ÉTAPE PAR ÉTAPE)

### **1. PRÉPARATION (J-1)**

**Documents à consulter :**
```
✅ Plan prévention GIRASOLE lu et signé
✅ Plans électriques TCQ (fournis par GIRASOLE)
✅ PV réception lot PV (si existant)
✅ CR visite chantier lot PV (si existants)
✅ Autocontrôle installateur (si existant)
✅ Attestation DRE bureau contrôle
✅ CDC tranchées bailleur
✅ ETN système intégration (si audit toiture)
✅ Notice montage panneau (si audit toiture)
```

**Matériel obligatoire :**
```
✅ Appareil photo haute résolution (>12 Mpx) + batterie chargée
✅ Carte SD vide 32 Go minimum
✅ EPI complets (casque, gants isolants, chaussures sécurité)
✅ Habilitations électriques valides (B2V, BR, BC)
✅ Pour toiture : Nacelle/harnais + ligne vie + habilitations hauteur
✅ Tablette/PC portable avec checklist HTML
✅ Mètre ruban, niveau laser
```

---

### **2. SUR SITE (Jour J)**

**Ouvrir la checklist HTML :**
```
1. Double-clic sur CHECKLIST_XXXXX_Nom_Centrale.html
2. Vérifier infos centrale affichées (ID, nom, puissance, adresse, installateur)
3. Remplir informations générales (date, auditeur, météo, température)
```

**Remplissage sections :**
```
☐ Section 1 : Préparation (7 points) - 15 min
☐ Section 2 : NF C 15-100 (14 points) - 60 min
☐ Section 3 : UTE C 15-712 (17 points) - 60 min
☐ Section 4 : BP/MP (12 points) - 45 min
☐ Section 5 : Prescriptions GIRASOLE (12 points) - 30 min
☐ Section 6 : Toiture (si concerné) (38 points) - 180 min
```

**⚠️ AUDIT VISUEL UNIQUEMENT :**
- **PAS de mesures électriques** (multimètre, pince ampèremétrique, testeur isolement)
- Inspection **VISUELLE** conformité apparente
- Vérification repérage, étiquetage, état équipements
- Constatation écarts normatifs VISUELS (câbles abîmés, IP insuffisant, etc.)

---

### **3. UPLOAD PHOTOS** 📸

**Nomenclature GIRASOLE obligatoire :**
```
GEN_   → Vues générales centrale (4 vues cardinales, panneau signalétique)
ELEC_  → Équipements électriques (AGCP, onduleurs, boîtiers, câblage)
TOIT_  → Inspection toiture (fixations, étanchéité, démontage)
BP_    → Boîtes protection AC/DC
MP_    → Modules PV (état, alignement)
DOC_   → Documents (autocontrôle, PV réception, plans TCQ)
```

**Exemples noms photos :**
```
GEN_vue_ensemble_nord.jpg
ELEC_AGCP_reglages_calibres.jpg
MP_alignement_modules_string1.jpg
TOIT_fixation_SI_boulonnerie_inox.jpg
DOC_autocontrole_installateur_page1.jpg
```

**Nombre photos minimum (CDC §2.7) :**
- **Audit électrique seul** : 30-40 photos
- **Audit électrique + toiture** : 35-50 photos

**Upload dans checklist :**
```
1. Cliquer "Choisir fichiers" dans zone upload
2. Sélectionner photos (conversion Base64 automatique)
3. Preview temps réel avec statistiques (nombre, taille totale)
4. Auto-save toutes les 10 secondes
```

---

### **4. EXPORT JSON** 💾

**Une fois audit terminé :**
```
1. Vérifier progression 100% toutes sections ✅
2. Cliquer bouton "📥 EXPORTER JSON"
3. Fichier téléchargé automatiquement :
   → centrale_XXXXX_audit_2025-11-20.json (~7-10 MB)
```

**Contenu JSON :**
```json
{
  "centrale_id": "31971",
  "centrale_nom": "Antunez - SCI ANAUJA",
  "audit_toiture": false,
  "date_audit": "2025-11-20T09:30:00.000Z",
  "auditeur": "Adrien PAPPALARDO",
  "photos": [
    {
      "nom": "GEN_vue_ensemble.jpg",
      "data": "data:image/jpeg;base64,/9j/4AAQSkZJ...",
      "taille": 245678,
      "type": "image/jpeg"
    }
  ],
  "sections": {
    "nfc15100": {
      "progression": 100,
      "ecarts_constates": ["AGCP: Calibre disjoncteur 32A vs 25A plan TCQ"],
      "commentaires": "Écart mineur, fonctionnement OK"
    }
  }
}
```

---

### **5. LIVRABLES À REMETTRE** (CDC §2.7)

**Format attendu par GIRASOLE :**

**1. Rapport d'audit PDF par centrale (52 rapports)**
- Synthèse exécutive (1 page)
- Conformité NF C 15-100 (écarts O/N + descriptions)
- Conformité UTE C 15-712 (écarts O/N + descriptions)
- Conformité DTU 40.35 (si toiture - écarts O/N + descriptions)
- Conformité ETN + Notice (si toiture - écarts O/N + descriptions)
- Bonnes pratiques constatées (O/N/NC + descriptions)
- Mauvaises pratiques constatées (O/N/NC + descriptions)
- Prescriptions GIRASOLE (autocontrôle, PV réception, CR visite, tranchées)
- Reportage photo (lien constat écrit ↔ photo)

**2. Fichier Excel synthèse (format ANNEXE 2 adapté)**
Colonnes obligatoires :
- ID centrale, Nom, Installateur, Bureau contrôle
- NF C 15-100 (O/N) + Description écarts
- UTE C 15-712 (O/N) + Description écarts
- DTU 40.35 (O/N) + Description écarts (si toiture)
- Respect ETN (O/N) + Description (si toiture)
- Respect Notice montage (O/N) + Description (si toiture)
- Bonnes pratiques (O/N/NC) + Description
- Mauvaises pratiques (O/N/NC) + Description
- Autocontrôle présent (O/N) + Complet (O/N) + Description
- PV réception présent (O/N) + Correct (O/N) + Description
- CR visite présent (O/N)
- Tranchées conformes CDC (O/N) + Description
- Écarts signalés dans documents GIRASOLE (O/N)

**3. Reportage photo (nommage/numérotation facilitant rapprochement)**
- Hyperliens Excel → photos
- Numérotation cohérente écarts ↔ photos
- Organisation par centrale (dossiers séparés)

**4. Rapport synthèse général**
- Principaux écarts constatés (par norme, par gravité)
- Bonnes pratiques à prescrire (recommandations GIRASOLE)
- Mauvaises pratiques à proscrire (actions correctives)
- Synthèse globale par installateur (classement qualité)
- Synthèse globale par bureau contrôle (efficacité DRE)

---

## ⚠️ POINTS CRITIQUES - SÉCURITÉ TOITURE (13 centrales)

**AVANT MONTÉE TOITURE :**
```
❌ NE JAMAIS monter sans :
   ✅ Harnais + ligne vie installée (charge >12 kN)
   ✅ Casque + chaussures sécurité
   ✅ Conditions météo favorables (vent < 40 km/h, toiture sèche)
   ✅ Nacelle positionnée stable (si utilisée)
   ✅ Plan prévention GIRASOLE signé
```

**SUR TOITURE :**
```
✅ Rester attaché en permanence (ligne vie)
✅ Identifier zones fragiles AVANT déplacement
✅ NE JAMAIS travailler seul (binôme obligatoire)
✅ Téléphone chargé + contact urgence
✅ **INTERDIT ABSOLU** : Marcher sur panneaux PV
```

**DÉMONTAGE 25 PANNEAUX :**
```
✅ Échantillonnage pertinent (1er/dernier strings + zones critiques)
✅ Remontage sans atteindre intégrité panneaux/supports
✅ Respect notice montage (si non-respect conception → signaler IMMÉDIATEMENT)
✅ Photos AVANT/PENDANT/APRÈS démontage
```

**EN CAS DE DOUTE OU DANGER :**
```
🚨 ARRÊTER IMMÉDIATEMENT L'INTERVENTION
📞 Contacter : info@diagnosticphotovoltaique.fr
📱 Adrien PAPPALARDO : 06 07 29 22 12

Urgences :
- SAMU : 15
- Pompiers : 18
- Urgences européen : 112
```

---

## 🛠️ DÉPANNAGE

**Problème : Checklist ne charge pas**
```
✅ Vérifier navigateur à jour (Chrome/Firefox/Safari)
✅ Autoriser JavaScript
✅ Effacer cache navigateur
```

**Problème : Photos ne s'uploadent pas**
```
✅ Vérifier taille photos < 5 MB/photo
✅ Format JPG/PNG/WEBP uniquement
✅ Tester avec 1 photo d'abord
```

**Problème : Export JSON échoue**
```
✅ Vérifier progression 100% toutes sections
✅ Autoriser téléchargements navigateur
✅ Espace disque suffisant (10 MB minimum)
```

**Problème : Données perdues après fermeture**
```
✅ Vérifier LocalStorage activé (paramètres navigateur)
✅ Ne pas utiliser mode "Navigation privée"
✅ Rouvrir MÊME fichier HTML (pas copie)
```

---

## 📊 STATISTIQUES MISSION GIRASOLE 2025

**Données CDC PERF-CDC-001 :**
- **52 centrales** au total (53 dans ANNEXE 1 mais 52 dans votre liste)
- **39 audits électriques** (inspection visuelle NF C 15-100 + UTE C 15-712)
- **13 audits électriques + toiture** (+ DTU 40.35 + ETN + Notice + démontage 25 panneaux)
- **Départements :** 11, 12, 15, 17, 23, 26, 31, 32, 34, 38, 42, 44, 46, 47, 71, 79, 89
- **Puissance totale :** ~16 MWc

**Installateurs principaux :**
- LE TRIANGLE, 3C instal, Acrom, PROSUNFRANCE, OFT, Eiffage, SOLARTIS, NEOXOM, KEVEL, Yama Energies, INNOVA

**Bureaux contrôle :**
- SOCOTEC POWER SERVICES (majoritaire)
- BUREAU VERITAS

**Volumétrie photos attendue :**
- 30-50 photos/centrale × 52 centrales = **1560-2600 photos**
- Taille moyenne photo : 200-300 KB
- Taille JSON par centrale : **7-10 MB** (Base64)
- **Total mission : ~360-520 MB** de données JSON

---

## 📞 SUPPORT TECHNIQUE

**Diagnostic Photovoltaïque :**
```
👤 Adrien PAPPALARDO (Business Developer)
📱 06 07 29 22 12
📧 a.pappalardo@diagpv.fr
📧 info@diagnosticphotovoltaique.fr

📍 3 rue d'Apollo, 31240 L'Union
📞 05.81.10.16.59
🌐 www.diagnosticphotovoltaique.fr
⏰ Lundi-Vendredi 9h-18h
```

**GIRASOLE Energies :**
```
📧 Contact mission (via plan prévention)
🌐 www.girasole-energies.com
```

---

## 🔐 NORMES & CONFORMITÉ

**Audits conformes aux normes (CDC §2.2) :**
- ✅ **NF C 15-100** : Installations électriques basse tension
- ✅ **UTE C 15-712** : Installations photovoltaïques (guide spécifique)
- ✅ **DTU 40.35** : Couverture par éléments métalliques en feuilles et longues feuilles en zinc (étanchéité toiture)
- ✅ **ETN** : Enquête de Technique Nouvelle (système intégration toiture)
- ✅ **Notice montage panneau** : Conformité procédures fabricant

**Prescriptions GIRASOLE (CDC §2.4) :**
- ✅ Autocontrôle installateur correctement renseigné
- ✅ PV réception lot PV signé GIRASOLE + installateur
- ✅ Au moins 1 CR visite chantier lot PV rédigé par GIRASOLE
- ✅ Respect cahier des charges tranchées fourni au bailleur

**Positionnement DiagPV :**
- ✅ Expertise indépendante depuis 2012
- ✅ +500 interventions PV
- ✅ Neutralité technique garantie
- ✅ Rapports < 5 jours ouvrés
- ✅ RCS 792972309

---

## ✅ CHECKLIST AVANT DÉPART TERRAIN

```
☐ Plan prévention GIRASOLE signé
☐ Habilitations électriques valides (B2V, BR, BC)
☐ EPI complets (casque, gants, chaussures sécurité)
☐ Appareil photo chargé + carte SD vide 32 Go
☐ Tablette/PC avec checklist HTML téléchargée
☐ Documents GIRASOLE consultés (plans TCQ, PV réception, autocontrôle)
☐ Contact site GIRASOLE prévenu (accès clés)
☐ Conditions météo vérifiées

Pour audit TOITURE en complément :
☐ Nacelle/harnais + ligne vie
☐ Habilitations travail hauteur valides
☐ ETN système intégration consulté
☐ Notice montage panneau consultée
☐ Conditions météo TOITURE (vent <40 km/h, sec)
☐ MOP interventions toiture lue
```

---

**🔆 Bonne mission terrain GIRASOLE 2025 ! 🔆**

---

*Document généré le 2025-11-20 | Version 2.0 (Conforme CDC PERF-CDC-001)*  
*RCS 792972309 | Diagnostic Photovoltaïque*  
*Mission GIRASOLE 2025 - 52 centrales PV*
