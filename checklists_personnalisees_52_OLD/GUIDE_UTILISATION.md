# 📋 GUIDE UTILISATION - CHECKLISTS TERRAIN GIRASOLE 2025

## 🎯 OBJECTIF

Ce package contient **52 checklists personnalisées** pour les audits terrain des centrales photovoltaïques GIRASOLE 2025.

**Chaque checklist est unique** et correspond à **une centrale spécifique** avec ses informations propres (nom, puissance, adresse).

---

## 📦 CONTENU DU PACKAGE

```
GIRASOLE_2025_CHECKLISTS_TERRAIN/
├── CHECKLIST_3085_Hangar_Maxime_Bayle.html
├── CHECKLIST_3251_SCI_KILJOR.html
├── ... (50 autres checklists)
├── GUIDE_UTILISATION.md           ← Ce fichier
├── EXEMPLE_EXPORT_JSON.json       ← Exemple format export
└── CONTACT_SUPPORT.txt            ← Support technique
```

---

## 🔆 DEUX TYPES D'AUDITS

### ☀️ **AUDIT VISUEL SEUL** (39 centrales SOL)
**Fichiers :** 26 KB  
**Sections :**
1. ✅ Préparation site
2. ✅ Inspection modules
3. ✅ Inspection onduleurs
4. ✅ Thermographie IR
5. ✅ Boîtiers protection/strings
6. ✅ Suivi production

**Durée estimée :** 2-3 heures + 20-30 photos

---

### 🏠 **AUDIT VISUEL + TOITURE** (13 centrales TOITURE)
**Fichiers :** 29 KB  
**Sections :** Identiques + **section supplémentaire OBLIGATOIRE**

**7. 🏠 INSPECTION TOITURE** (9 points sécurité)
- ⚠️ **EPI COMPLET OBLIGATOIRE** : Harnais + ligne vie + casque
- ⚠️ **MOP interventions toiture** respectée
- Étanchéité toiture (absence infiltrations)
- Fixations structures conformes
- Lestage bacs OK (vent/neige)
- Passages câbles étanches
- Éléments toiture (tuiles, faîtage)
- Accès sécurisés vérifiés
- Zones fragiles identifiées/balisées

**Durée estimée :** 3-4 heures + 25-35 photos

---

## 📱 UTILISATION TERRAIN (ÉTAPE PAR ÉTAPE)

### **1. PRÉPARATION**
```bash
✅ Identifier votre centrale assignée (ex: 3085 - Hangar Maxime Bayle)
✅ Ouvrir le fichier HTML correspondant dans votre navigateur
✅ Vérifier les informations centrale affichées (nom, puissance, adresse)
```

**Navigation :**
- **Sur PC** : Double-clic sur `CHECKLIST_XXXX_Nom_Centrale.html`
- **Sur tablette/smartphone** : Ouvrir avec Chrome/Firefox/Safari

---

### **2. REMPLISSAGE CHECKLIST**

**Informations générales :**
```
📅 Date audit        → Sélecteur calendrier
👤 Nom auditeur      → Votre nom complet
🌤️ Conditions météo  → Ensoleillé/Nuageux/Pluie
🌡️ Température       → °C relevée sur site
```

**Points de contrôle :**
```
☐ Cliquer sur chaque point pour cocher ✅
☐ Ajouter commentaires si nécessaire (défauts détectés)
☐ Progression automatique en % (barre verte en haut)
```

**📌 IMPORTANT :**
- ✅ La checklist **sauvegarde automatiquement** toutes les 10 secondes
- ✅ Les données restent **dans votre navigateur** (LocalStorage)
- ✅ Vous pouvez **fermer et rouvrir** sans perdre vos données

---

### **3. UPLOAD PHOTOS** 📸

**Zone upload centrale :**
```
┌─────────────────────────────────────────┐
│  📸 UPLOADER PHOTOS (20-30 recommandé)  │
│  [Choisir fichiers]                     │
└─────────────────────────────────────────┘
```

**Formats acceptés :**
- ✅ JPG/JPEG (recommandé)
- ✅ PNG
- ✅ WEBP

**Taille recommandée :** 200-500 KB/photo (compression automatique conseillée)

**Nomenclature GIRASOLE :**
```
GEN_   → Vues générales centrale
ELEC_  → Équipements électriques (onduleurs, boîtiers, câblage)
TOIT_  → Inspection toiture (TOITURE uniquement)
BP_    → Boîtes de protection AC/DC
MP_    → Modules PV (défauts, hotspots)
DOC_   → Documents (plaques signalétiques, schémas)
```

**Exemples noms photos :**
```
GEN_vue_ensemble_nord.jpg
ELEC_onduleur_huawei_1.jpg
MP_hotspot_string_3.jpg
TOIT_etancheite_passage_cables.jpg
```

**📌 IMPORTANT :**
- Photos converties automatiquement en **Base64** (intégrées au JSON)
- Preview temps réel avec **statistiques** (nombre, taille totale)
- Pas de limite nombre, mais **recommandé 20-30 photos/centrale**

---

### **4. EXPORT JSON** 💾

**Une fois audit terminé :**
```
1. Vérifier progression 100% ✅
2. Cliquer bouton "📥 EXPORTER JSON"
3. Fichier téléchargé automatiquement :
   → centrale_XXXX_audit_2025-11-19.json
```

**Contenu JSON :**
```json
{
  "centrale_id": "3085",
  "centrale_nom": "Hangar Maxime Bayle",
  "audit_toiture": false,
  "date_audit": "2025-11-19T15:30:00.000Z",
  "auditeur": "Jean Dupont",
  "photos": [
    {
      "nom": "GEN_vue_ensemble.jpg",
      "data": "data:image/jpeg;base64,/9j/4AAQSkZJ...",
      "taille": 245678,
      "type": "image/jpeg"
    }
  ],
  "progression": {
    "preparation": 100,
    "modules": 100,
    "onduleurs": 100,
    "thermographie": 100,
    "toiture": 100
  }
}
```

**Taille fichier JSON attendue :**
- **Sans photos :** ~5-10 KB
- **Avec 25 photos (300 KB/photo) :** ~7-10 MB

---

### **5. ENVOI RÉSULTATS** 📧

**Envoyer le fichier JSON par email à :**
```
📧 info@diagnosticphotovoltaique.fr
📧 a.pappalardo@diagpv.fr

Objet: [GIRASOLE 2025] Audit Centrale XXXX - Nom Centrale
Pièce jointe: centrale_XXXX_audit_2025-11-19.json
```

**Contenu email :**
```
Bonjour,

Veuillez trouver ci-joint l'audit terrain de la centrale :
- ID: XXXX
- Nom: Hangar Maxime Bayle
- Type: Audit visuel [+ toiture]
- Date: 19/11/2025
- Auditeur: Jean Dupont
- Photos: 25

Cordialement,
[Votre nom]
```

---

## ⚠️ POINTS CRITIQUES - SÉCURITÉ TOITURE

**Pour les 13 centrales TOITURE uniquement :**

### **AVANT MONTÉE TOITURE**
```
❌ NE JAMAIS monter sans :
   ✅ Harnais + ligne de vie installée
   ✅ Casque + chaussures sécurité
   ✅ MOP interventions toiture signée
   ✅ Conditions météo favorables (vent < 50 km/h)
```

### **SUR TOITURE**
```
✅ Rester attaché en permanence
✅ Identifier zones fragiles AVANT déplacement
✅ Ne jamais travailler seul
✅ Téléphone chargé + contact urgence
```

### **EN CAS DE DOUTE**
```
🚨 ARRÊTER L'INTERVENTION
📞 Contacter responsable mission
📧 info@diagnosticphotovoltaique.fr
📱 06 07 29 22 12 (Adrien PAPPALARDO)
```

---

## 🛠️ DÉPANNAGE

### **Problème : Checklist ne charge pas**
```
✅ Vérifier navigateur à jour (Chrome/Firefox/Safari)
✅ Autoriser JavaScript
✅ Effacer cache navigateur
```

### **Problème : Photos ne s'uploadent pas**
```
✅ Vérifier taille photos < 5 MB/photo
✅ Format JPG/PNG/WEBP uniquement
✅ Tester avec 1 photo d'abord
```

### **Problème : Export JSON échoue**
```
✅ Vérifier progression 100% toutes sections
✅ Autoriser téléchargements navigateur
✅ Espace disque suffisant (10 MB minimum)
```

### **Problème : Données perdues après fermeture**
```
✅ Vérifier LocalStorage activé (paramètres navigateur)
✅ Ne pas utiliser mode "Navigation privée"
✅ Rouvrir MÊME fichier HTML (pas copie)
```

---

## 📊 STATISTIQUES MISSION GIRASOLE 2025

```
📦 52 centrales au total
☀️ 39 audits visuels SOL (6 sections)
🏠 13 audits visuels + TOITURE (7 sections)
📸 ~1300 photos attendues (25/centrale moyenne)
💾 ~400 MB données JSON totales
⏱️ ~150 heures terrain (3h/centrale moyenne)
```

**Départements couverts :** 11, 31, 32, 34, 66, 81, 82

---

## 📞 SUPPORT TECHNIQUE

**En cas de problème technique ou question :**

```
🏢 Diagnostic Photovoltaïque
📧 info@diagnosticphotovoltaique.fr
📧 a.pappalardo@diagpv.fr
📱 06 07 29 22 12 (Adrien PAPPALARDO)
🌐 www.diagnosticphotovoltaique.fr

📍 3 rue d'Apollo, 31240 L'Union
📞 05.81.10.16.59
```

**Horaires support :** Lundi-Vendredi 9h-18h

---

## ✅ CHECKLIST AVANT DÉPART TERRAIN

```
☐ Matériel audit (caméra thermique, multimètre, EPI)
☐ Fichier HTML checklist téléchargé sur appareil
☐ Batterie tablette/ordinateur chargée
☐ Photos test (vérifier upload fonctionne)
☐ Contact urgence enregistré
☐ MOP/PPSPS lus et signés (TOITURE)
☐ Conditions météo vérifiées
```

---

## 🎯 NORMES & RÉFÉRENCES

**Audits conformes aux normes :**
- IEC 62446-1 : Commissioning systèmes PV
- IEC 62446-3 : Thermographie IR
- IEC TS 63049 : Inspection thermographique
- NF C 15-100 : Installations électriques BT
- DIN EN 62446-3 : Thermographie drone/sol

**Positionnement DiagPV :**
- ✅ Expertise indépendante depuis 2012
- ✅ +500 interventions
- ✅ Neutralité technique garantie
- ✅ Rapports < 5 jours ouvrés

---

**🔆 Bonne mission terrain ! 🔆**

---

*Document généré le 2025-11-19 | Version 1.0*  
*RCS 792972309 | Diagnostic Photovoltaïque*
