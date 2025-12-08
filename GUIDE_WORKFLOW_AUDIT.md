# 📋 GUIDE WORKFLOW AUDIT COMPLET - GIRASOLE 2025

**Date** : 2025-12-08  
**Plateforme** : https://girasole-diagpv.pages.dev

---

## 🎯 WORKFLOW UTILISATEUR

### **Étape 1 : Accès à la mission**
1. ✅ Aller sur **Dashboard** : https://girasole-diagpv.pages.dev/
2. ✅ Cliquer sur onglet **"Missions"**
3. ✅ Trouver la mission (ex: Mission 18 - Hangar Fabrice COMBY)
4. ✅ Cliquer sur **"📝 Checklist"** → Ouvre `/audit/18`

---

### **Étape 2 : Remplissage checklist**

#### **A. Checklist 40 points (tous les audits)**
Pour chaque item :
1. ✅ **Sélectionner statut** : CONFORME / NON_CONFORME / N/A
2. ✅ **Ajouter commentaire** (obligatoire si NON_CONFORME)
3. ✅ **Upload photos** (min 2 si NON_CONFORME)
4. ✅ **Sauvegarde automatique** à chaque modification

#### **B. Checklist 14 points toiture (si applicable)**
Pour missions avec `audit_toiture = 'X'` :
- Même processus que checklist sol
- Section "AUDIT EN TOITURE" s'affiche automatiquement
- 14 points spécifiques toiture

#### **C. Commentaire final mission**
1. ✅ Descendre en bas de page
2. ✅ Section "Commentaire Final Mission"
3. ✅ Rédiger synthèse globale audit
4. ✅ Clic "Sauvegarder" → Enregistrement automatique

---

### **Étape 3 : Génération du rapport**

#### **Méthode 1 : Depuis Dashboard**
1. ✅ Retour sur Dashboard : https://girasole-diagpv.pages.dev/
2. ✅ Onglet "Missions"
3. ✅ Trouver la mission
4. ✅ Cliquer sur bouton **"📄 Rapport"**
5. ✅ → Génère et ouvre rapport HTML dans nouvel onglet

#### **Méthode 2 : Via API directe**
**API Endpoint** : `POST /api/rapports/generer/:mission_id`

**Test avec curl** :
```bash
curl -X POST https://girasole-diagpv.pages.dev/api/rapports/generer/18
```

**Réponse attendue** :
```json
{
  "success": true,
  "rapport_id": "xxx",
  "message": "Rapport généré avec succès"
}
```

**Accès rapport** : `https://girasole-diagpv.pages.dev/rapport/{rapport_id}`

---

## 🧪 TEST COMPLET - MISSION 18 (ARTEMIS)

### **Mission de test recommandée** :
- **ID** : 18
- **Centrale** : Hangar Fabrice COMBY
- **Sous-traitant** : ARTEMIS
- **Type** : Avec toiture (40 points + 14 points)
- **URL Checklist** : https://girasole-diagpv.pages.dev/audit/18

### **Checklist test** :
1. ✅ **Accéder** : https://girasole-diagpv.pages.dev/audit/18
2. ✅ **Vérifier** : Section "AUDIT EN TOITURE" présente (14 items)
3. ✅ **Remplir 2-3 items** :
   - Item 1 : Statut CONFORME + commentaire + 1 photo
   - Item 2 : Statut NON_CONFORME + commentaire détaillé + 2 photos
   - Item 3 : Statut N/A + commentaire
4. ✅ **Commentaire final** : "Test audit mission 18 - Vérification workflow complet"
5. ✅ **Générer rapport** :
   - Retour dashboard
   - Clic "📄 Rapport" sur mission 18
   - Vérifier ouverture rapport HTML

---

## 📊 CONTENU RAPPORT GÉNÉRÉ

### **Sections rapport HTML** :
1. ✅ **En-tête** : Nom centrale, puissance, localisation
2. ✅ **Informations mission** : Date, technicien, statut
3. ✅ **Checklist sol** : 40 points avec statuts/commentaires/photos
4. ✅ **Checklist toiture** (si applicable) : 14 points
5. ✅ **Statistiques** :
   - Nb conformes / non-conformes / N/A
   - Taux de conformité global
6. ✅ **Photos générales** : Toutes les photos uploadées
7. ✅ **Commentaire final** : Synthèse technicien
8. ✅ **Conclusion** : Conformité globale installation

---

## 🔧 FONCTIONNALITÉS AVANCÉES

### **Upload photos**
- **Format accepté** : JPG, PNG, JPEG
- **Taille max** : 5 MB par photo
- **Nombre max** : 5 photos par item
- **Stockage** : Base64 dans table `ordres_mission_item_photos`

### **Sauvegarde automatique**
- **Déclenchement** : À chaque modification (statut, commentaire, photo)
- **API** : `POST /api/checklist/:mission_id/item/:item_id`
- **Mode offline** : LocalStorage + sync auto dès connexion

### **Export rapport**
- **Format** : HTML (consultation web)
- **Fonctionnalité future** : PDF (via impression navigateur)
- **Stockage** : Table `rapports_factuel` en base D1

---

## ⚠️ POINTS DE VIGILANCE

### **Avant génération rapport** :
1. ✅ Vérifier **tous les items renseignés** (statut != NON_VERIFIE)
2. ✅ Items NON_CONFORME : **Commentaire + 2 photos minimum**
3. ✅ **Commentaire final mission** : Obligatoire
4. ✅ **Photos générales** : Min 20 photos par centrale (recommandé)

### **Si erreur génération rapport** :
1. Ouvrir console navigateur (F12)
2. Relever message d'erreur
3. Vérifier que checklist est complète
4. Tester API directement : `POST /api/rapports/generer/18`

---

## 🔗 LIENS UTILES

### **URLs de test** :
- **Dashboard** : https://girasole-diagpv.pages.dev/
- **Mission 18 (audit)** : https://girasole-diagpv.pages.dev/audit/18
- **API checklist** : https://girasole-diagpv.pages.dev/api/checklist-toiture/18
- **Génération rapport API** : `POST https://girasole-diagpv.pages.dev/api/rapports/generer/18`

### **Documentation** :
- CDC GIRASOLE §2 : Cahier des charges audits
- Normes : IEC 62446-1, NF C 15-100, DTU 40.35

---

## 🎯 PROCHAINES ÉTAPES APRÈS TEST

1. ✅ Valider workflow complet sur mission 18
2. ✅ Si problème : M'indiquer l'étape bloquante + message d'erreur
3. ✅ Si OK : Répliquer sur autres missions ARTEMIS
4. ✅ Former sous-traitants sur plateforme
5. ✅ Lancer audits terrain

---

**Guide créé** : 2025-12-08  
**Plateforme** : https://girasole-diagpv.pages.dev  
**Statut** : ✅ **WORKFLOW COMPLET DOCUMENTÉ - PRÊT POUR TEST**
