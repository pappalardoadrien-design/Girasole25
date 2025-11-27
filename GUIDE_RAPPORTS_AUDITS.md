# 📊 GUIDE SYSTÈME RAPPORTS AUDITS - GIRASOLE 2025

**Date:** 26 novembre 2025  
**Accès:** Adrien Pappalardo + Fabien  
**Objectif:** Générer rapports factuels courts et précis item par item (40 pts SOL + 11 pts TOITURE si applicable)

---

## 🎯 PRINCIPE DU SYSTÈME

### Philosophie : **AUCUNE INVENTION, UNIQUEMENT LES FAITS**

Le système génère des rapports d'audit qui suivent **exactement la checklist terrain** :
- ✅ 1 item checklist = 1 section rapport
- 📸 Photos de l'item avec leurs commentaires
- 💬 Commentaire terrain si présent
- ❌ **AUCUN** calcul d'économies, pertes de rendement, ou autres inventions
- 📝 Rapport court, précis, factuel

---

## 📁 STRUCTURE D'UN RAPPORT

```
RAPPORT AUDIT QUALITÉ - [NOM CENTRALE]

1. EN-TÊTE
   - Nom centrale, Type (SOL/TOITURE), Puissance (kWc)
   - Adresse, Localisation
   - Date audit, Auditeur
   - Stats conformité (Nb conformes / non-conformes / N/A)

2. CHECKLIST AUDIT VISUEL & MÉCANIQUE (40 points)
   Pour chaque item :
   - N° + Libellé point de contrôle
   - Catégorie (DOCUMENTATION, INSTALL_ELEC, NORMES_ELEC, etc.)
   - Statut : ✅ Conforme / ❌ Non conforme / ⚠️ N/A
   - 💬 Commentaire terrain (si présent)
   - 📸 Photos (si présentes) avec commentaires

3. CHECKLIST AUDIT EN TOITURE (11 points - si applicable)
   Même structure que checklist SOL
   Points spécifiques : démontage panneaux, DTU 40.35, MC4, etc.

4. SYNTHÈSE GÉNÉRALE
   - Commentaire final de l'auditeur
   - Photos générales (vue d'ensemble, contexte)

5. COMPLÉMENTS POST-AUDIT (Section ajoutée par Adrien/Fabien)
   - Photos additionnelles
   - Commentaires/observations supplémentaires
```

---

## 🚀 UTILISATION DU SYSTÈME

### 1️⃣ **Accéder aux Rapports**

**URL :** `https://0da64170.girasole-diagpv.pages.dev/rapports`

Vous verrez :
- Liste de tous les rapports générés
- Stats globales (rapports terminés, en cours, non-conformités, audits toiture)
- Filtres par statut/centrale

---

### 2️⃣ **Générer un Rapport pour une Mission**

**Méthode 1 : Via API (automatique après audit terrain)**

```bash
# Générer rapport pour mission ID 24
curl -X POST http://localhost:3000/api/rapports/generer/24
```

**Résultat :**
- Rapport créé dans la base de données
- Contient tous les items checklist (SOL + TOITURE si applicable)
- Photos et commentaires intégrés
- Statut : "TERMINE"

**Méthode 2 : Automatique lors de "Terminer l'audit" sur mobile**
- Quand l'auditeur clique sur "Terminer" dans la checklist mobile
- Le système synchronise les données (items + photos + commentaires)
- Un rapport est automatiquement généré (TODO: à implémenter)

---

### 3️⃣ **Consulter un Rapport**

1. Aller sur `/rapports`
2. Cliquer sur une carte de rapport
3. Vous verrez :
   - **En-tête** avec infos centrale + stats conformité
   - **Checklist SOL** (40 items) item par item
   - **Checklist TOITURE** (11 items) si audit toiture
   - **Synthèse générale** avec commentaire final + photos générales

**Exemple :**
```
Item 12 : Présence autocollants dangers électriques
Catégorie : DOCUMENTATION
Statut : ❌ Non conforme
💬 Commentaire : "Autocollants absents sur onduleur et AGCP"
📸 Photos : [photo1.jpg, photo2.jpg]
```

---

### 4️⃣ **Ajouter Photos/Commentaires Post-Audit (Adrien + Fabien)**

**Scénario :** Après avoir reçu le rapport du sous-traitant, Adrien/Fabien veulent ajouter :
- Photos complémentaires iPhone (avec GPS)
- Observations supplémentaires
- Notes de validation

**Méthode :**

1. Ouvrir le rapport : `/rapports/:rapport_id`
2. Cliquer sur boutons en bas de page :
   - 📸 **"Ajouter une photo"** : Upload photo + titre + description
   - 💬 **"Ajouter un commentaire"** : Texte libre

3. Les compléments apparaissent dans section **"COMPLÉMENTS POST-AUDIT"**
   - Horodatés
   - Avec auteur (Adrien / Fabien)
   - Liés au rapport

**Exemple :**
```
COMPLÉMENTS POST-AUDIT
---
📸 Photo - Vue d'ensemble AGCP
Par Adrien • 27/11/2025
[Photo affichée]
Description : "Photo prise lors visite de contrôle, angle manquant dans audit"

💬 Commentaire - Validation technique
Par Fabien • 27/11/2025
"Point 12 validé après correction sous-traitant. Autocollants installés."
```

---

### 5️⃣ **Imprimer / Télécharger le Rapport**

1. Ouvrir le rapport
2. Cliquer sur **"Imprimer"** (bouton vert en haut à droite)
3. Le rapport s'affiche en format imprimable :
   - Mise en page adaptée
   - Saut de page automatique
   - Photos intégrées
   - Boutons de navigation masqués

4. **Sauvegarder en PDF** : Ctrl+P → "Enregistrer en PDF"

**Note :** La génération PDF native sera ajoutée ultérieurement avec bibliothèque pdfkit.

---

## 📋 WORKFLOW COMPLET

```
1. Audit Terrain (Mobile)
   ↓
   Auditeur remplit checklist 40 pts SOL
   + 11 pts TOITURE (si applicable)
   + Photos + Commentaires
   + Commentaire final
   + Photos générales
   ↓
2. Synchronisation
   ↓
   Données envoyées au serveur
   Stockage en DB (checklist_items, ordres_mission_item_photos, etc.)
   ↓
3. Génération Rapport (Automatique ou Manuel)
   ↓
   API /api/rapports/generer/:mission_id
   Création rapport factuel item par item
   Statut : TERMINE
   ↓
4. Consultation Rapport (Webapp)
   ↓
   Adrien/Fabien accèdent à /rapports
   Visualisation rapport complet
   ↓
5. Ajout Compléments (Si nécessaire)
   ↓
   Adrien/Fabien ajoutent photos/commentaires additionnels
   ↓
6. Validation Finale
   ↓
   Changement statut : TERMINE → VALIDE
   ↓
7. Export PDF / Envoi Client
   ↓
   Impression PDF
   Envoi à GIRASOLE
```

---

## 🔧 APIs DISPONIBLES

### **GET /api/rapports**
Liste tous les rapports

**Réponse :**
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "centrale_id": 24,
      "titre": "Rapport Audit Hangar Christophe CARRERE n°2",
      "type_rapport": "AUDIT_QUALITE",
      "statut": "TERMINE",
      "date_audit": "2025-11-26",
      "auditeur": "Fabien Martin",
      "nb_items_conformes": 35,
      "nb_items_non_conformes": 3,
      "nb_items_na": 2
    }
  ]
}
```

---

### **POST /api/rapports/generer/:mission_id**
Génère un rapport pour une mission

**Exemple :**
```bash
curl -X POST http://localhost:3000/api/rapports/generer/24
```

**Réponse :**
```json
{
  "success": true,
  "rapport_id": 1,
  "message": "Rapport généré avec succès (données factuelles uniquement)"
}
```

---

### **GET /api/rapports/:rapport_id**
Détail d'un rapport avec données complètes

**Réponse :**
```json
{
  "success": true,
  "rapport": {
    "id": 1,
    "centrale_nom": "Hangar Christophe CARRERE n°2",
    "donnees_rapport": {
      "mission": {...},
      "checklist_sol": {
        "items": [
          {
            "numero": 1,
            "libelle": "Présence autocollants dangers électriques",
            "statut": "CONFORME",
            "commentaire": "Autocollants présents et conformes",
            "photos": [...]
          }
        ],
        "stats": {
          "conformes": 35,
          "non_conformes": 3,
          "na": 2,
          "total": 40
        }
      },
      "checklist_toiture": null,
      "synthese": {...}
    },
    "complements": [...]
  }
}
```

---

### **POST /api/rapports/:rapport_id/complements**
Ajouter photo/commentaire post-audit

**Body :**
```json
{
  "type": "PHOTO" | "COMMENTAIRE" | "OBSERVATION" | "NOTE",
  "contenu": "base64..." | "texte commentaire",
  "titre": "Titre optionnel",
  "description": "Description optionnelle",
  "auteur": "Adrien" | "Fabien",
  "section_rapport": "Item 12" | "Synthèse" (optionnel)
}
```

**Exemple :**
```bash
curl -X POST http://localhost:3000/api/rapports/1/complements \
  -H "Content-Type: application/json" \
  -d '{
    "type": "COMMENTAIRE",
    "contenu": "Point validé après correction",
    "titre": "Validation technique",
    "auteur": "Adrien"
  }'
```

---

## 📊 BASE DE DONNÉES

### **Table `rapports_audits`**
Stockage principal des rapports

**Colonnes clés :**
- `id` : ID unique rapport
- `centrale_id` : Lien avec centrale
- `ordre_mission_id` : Lien avec mission terrain
- `type_rapport` : AUDIT_QUALITE | AUDIT_TOITURE | AUDIT_COMPLET
- `statut` : BROUILLON | EN_COURS | TERMINE | VALIDE
- `donnees_rapport` : JSON complet (mission, checklists, synthèse)
- `nb_items_conformes`, `nb_items_non_conformes`, `nb_items_na` : Stats
- `auditeur`, `date_audit`
- `auteur`, `collaborateurs` : Gestion accès

---

### **Table `rapports_complements`**
Photos/commentaires post-audit (Adrien/Fabien)

**Colonnes clés :**
- `id` : ID unique complément
- `rapport_id` : Lien avec rapport
- `type` : PHOTO | COMMENTAIRE | OBSERVATION | NOTE
- `contenu` : base64 (photo) ou texte (commentaire)
- `titre`, `description`
- `auteur` : Adrien | Fabien
- `section_rapport` : Lien avec section (ex: "Item 12")
- `ordre_affichage` : Ordre dans le rapport

---

## ✅ CE QUI EST FAIT

✅ Migration DB (tables `rapports_audits` + `rapports_complements`)  
✅ API génération rapport factuel item par item  
✅ API consultation rapports (liste + détail)  
✅ API ajout compléments post-audit  
✅ Interface web `/rapports` (liste + stats)  
✅ Interface détail rapport `/rapports/:id` (affichage complet)  
✅ Bouton ajout photos/commentaires (Adrien/Fabien)  
✅ Impression PDF (Ctrl+P)  
✅ Aucune invention dans rapports (100% factuel)  
✅ Support checklist TOITURE (11 pts) si audit toiture requis  

---

## ⏳ À FAIRE

⏳ Déclencher génération rapport automatique lors "Terminer audit" mobile  
⏳ Tests avec audits terrain réels (missions 24, 44, 20, 7)  
⏳ Export PDF natif (bouton téléchargement direct)  
⏳ Gestion photos iPhone avec GPS (annexe automatique)  
⏳ Authentification Adrien/Fabien (système auteur)  
⏳ Notification email après génération rapport  
⏳ Versionning rapports (brouillon → validé)  

---

## 🆘 SUPPORT

**Contact :** Adrien Pappalardo  
**Email :** a.pappalardo@diagnosticphotovoltaique.fr  
**Webapp :** https://0da64170.girasole-diagpv.pages.dev  
**Date création guide :** 26 novembre 2025  

---

## 📝 NOTES IMPORTANTES

1. **Données terrain** : Les données d'audit (items, photos, commentaires) sont d'abord stockées en `localStorage` mobile, puis synchronisées au serveur. Le rapport ne peut être généré qu'après synchronisation.

2. **Pas d'inventions** : Le système se limite strictement aux constats terrain. Aucun calcul d'économies, pertes de rendement, ou autres métriques dérivées.

3. **Structure fixe** : Le rapport suit exactement la structure checklist :
   - 40 items SOL (DOCUMENTATION → INSPECTIONS_VISUELLES)
   - 11 items TOITURE si audit toiture requis
   - 1 synthèse générale

4. **Accès partagé** : Adrien et Fabien ont accès simultané aux rapports. Les compléments sont horodatés et signés (auteur).

5. **Stockage photos** : Photos stockées en base64 dans DB (colonnes `photo_base64` pour items, `contenu` pour compléments).

6. **Performance** : Pour rapports lourds (nombreuses photos), prévoir pagination ou lazy loading.

---

**FIN DU GUIDE**
