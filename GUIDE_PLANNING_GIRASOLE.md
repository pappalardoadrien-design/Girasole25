# 🚀 GUIDE RAPIDE - Planning GIRASOLE (Deadline 14h00)

**Date**: 2025-01-21  
**Objectif**: Planifier 52 centrales photovoltaïques et livrer planning à GIRASOLE avant 14h00

---

## 🎯 URL PLANNING MANAGER

### **Interface Principale** :
👉 **https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/planning-manager**

### **Dashboard** (stats globales) :
👉 **https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/**

---

## ✅ NOUVEAU SYSTÈME - Checklist Auto-Attribuée

### **Workflow Automatique** :
```
Sélectionne ST + Technicien + Date
         ↓
   AUTO-SAVE (flash vert)
         ↓
Checklist 54 points créée automatiquement
         ↓
   Badge vert ✓ 54/54 affiché
         ↓
     PRÊT POUR GIRASOLE !
```

### **Badges Checklist** :
- 🟢 **✓ 54/54** = Checklist complète (PRÊT)
- 🟡 **⏰ X/54** = En cours
- ⚪ **⊖ Non init** = Pas encore attribuée

---

## 📋 PROCÉDURE EXPRESS (15 MINUTES)

### **ÉTAPE 1** - Ouvrir Planning Manager
1. Clique sur le lien ci-dessus
2. La page affiche **52 centrales** triées par distance

### **ÉTAPE 2** - Attribuer les Centrales (1 par 1)

Pour chaque ligne du tableau :

**Colonne "Sous-traitant"** :
- Dropdown avec 2 ST disponibles :
  - 🏢 **DiagPV Solutions** (ID 1)
  - 🏢 **SolarTech Audits** (ID 2)

**Colonne "Technicien"** (filtré automatiquement) :
- DiagPV Solutions :
  - Jean Dupont
  - Sophie Lambert
- SolarTech Audits :
  - Thomas Bernard
  - Claire Moreau

**Colonne "Date mission"** :
- Choisis la date d'audit souhaitée

**Confirmation Auto** :
- ✅ Flash vert (1 seconde) = Sauvegardé
- ✅ Badge vert "✓ 54/54" apparaît dans colonne Checklist
- ✅ Notification "Sauvegardé + Checklist 54 points créée !"

### **ÉTAPE 3** - Vérifier Stats en Haut

**Stats affichées** :
```
Total Centrales: 52
Assignées: X
Non assignées: Y
Planifiées: Z (X ✓)  ← X = nombre avec checklist complète
```

### **ÉTAPE 4** - Export Excel

**Bouton vert "Exporter Excel"** en haut à droite :
- Format : CSV UTF-8 (compatible Excel)
- Nom fichier : `planning_girasole_2025-01-21.csv`

**Colonnes incluses** :
```
ID | ID_REF | Centrale | Type | Puissance (kWc) | Localisation | 
Département | Distance (km) | Base | Date Mission | Sous-Traitant | 
Technicien | Contact ST | Tél Technicien | Checklist Status
```

### **ÉTAPE 5** - Livrer à GIRASOLE

1. Ouvre le CSV dans Excel
2. Vérifie visuellement :
   - ✅ Toutes les centrales ont ST + Technicien + Date
   - ✅ Colonne Checklist affiche "PRET"
3. Envoie par email à GIRASOLE avant 14h00 ✅

---

## 🎨 FONCTIONNALITÉS INTERFACE

### **Tableau Planning**

**Colonnes** :
- ☑️ Checkbox sélection multiple (futures fonctionnalités batch)
- **#** : Numéro ordre
- **Centrale** : Nom + localisation courte
- **kWc** : Puissance installation
- **Dist** : Distance en km (Toulouse ou Lyon)
- **Base** : Badge bleu (Toulouse) / rouge (Lyon)
- **Sous-traitant** : Dropdown ou nom si attribué
- **Technicien** : Dropdown ou nom si attribué
- **Date mission** : Date picker ou date si planifié
- **Checklist** : Badge statut (vert/jaune/gris)
- **Statut** : Badge mission (Planifié / En cours / À auditer)
- **Actions** : Retirer attribution si besoin

### **Filtres & Tri**

**Tri automatique par distance** :
- Centrales les plus proches en premier
- Centrales sans GPS en fin de liste

**Couleurs lignes** :
- ⚪ Blanc : Non attribuée
- 🟢 Vert clair : Attribuée (ST + Technicien + Date remplis)

---

## 📊 DONNÉES DISPONIBLES

### **52 Centrales** :
- ✅ 47 avec GPS (distances calculées)
- ✅ 5 sans GPS (affichées en fin)

### **Sous-Traitants** :
- **DiagPV Solutions** (2 techniciens)
- **SolarTech Audits** (2 techniciens)

### **Types Installations** :
- SOL : Centrales au sol
- TOITURE : Installations toiture
- OMBRIERE : Ombrières parking

### **Départements couverts** :
31, 32, 33, 34, 40, 46, 47, 64, 65, 81, 82, etc.

---

## 🔧 FONCTIONS AVANCÉES (OPTIONNEL)

### **Attribution Automatique Batch** (section orange)

Si tu veux gagner du temps :

1. **Max centrales** : Nombre à attribuer automatiquement
2. **Date début** : Date première mission
3. **ST Toulouse** : ST pour centrales base Toulouse
4. **ST Lyon** : ST pour centrales base Lyon
5. Clique **"Attribuer automatiquement"**

⚠️ **Note** : Vérifie quand même le résultat après attribution auto !

### **Génération Missions** (bouton orange - OPTIONNEL)

- **Avant** : Fallait cliquer "Générer ordres de mission" séparément
- **Maintenant** : AUTOMATIQUE lors de l'attribution !
- Ce bouton reste disponible si besoin de re-générer

---

## 📱 APRÈS PLANNING : Envoi Missions aux Techniciens

Une fois le planning validé, tu peux envoyer les missions :

### **URL Audit par Centrale** :
```
https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/audit/:mission_id
```

**Exemple** :
- Mission ID 4 (TOURNIER) : `/audit/4`
- Mission ID 6 (EARL CADOT) : `/audit/6`

### **Email Template** :

```
Objet : Ordre de Mission - Audit [NOM_CENTRALE] - [DATE]

Bonjour [PRENOM_TECHNICIEN],

Mission d'audit confirmée :

📍 Centrale : [NOM_CENTRALE]
🏢 Type : [TYPE] - [PUISSANCE] kWc
📅 Date : [DATE_MISSION] à 08h00
⏱️ Durée estimée : 7 heures
📍 Adresse : [LOCALISATION]

🔗 Lien checklist audit (54 points) :
https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/audit/[MISSION_ID]

✅ Checklist mobile avec capture photos intégrées
✅ Sauvegarde automatique en temps réel
✅ 7 catégories : DOC, ELEC, TABLEAUX, CABLAGE, MODULES, STRUCTURES, TOITURE

Merci de compléter la checklist sur site avec photos.

Cordialement,
Adrien Pappalardon
Diagnostic Photovoltaïque
```

---

## 🎯 CHECKLIST 54 POINTS (Détail)

### **1. DOC (8 points)** :
- Plaques signalétiques modules
- Plan installation (as-built)
- Schémas électriques (DC/AC)
- Attestation Consuel
- Certificats conformité onduleurs
- Rapport mise en service
- Contrat maintenance O&M
- Notice technique modules

### **2. ELEC (12 points)** :
- Mesure tension Voc strings (à vide)
- Mesure courant Isc strings (court-circuit)
- Test isolement DC (> 1 MΩ)
- Mesure continuité terres
- Polarité strings (+ et -)
- Protection différentielle 30mA
- Disjoncteurs calibrage correct
- Parafoudres DC/AC état
- Test fonctionnel onduleurs
- Monitoring production réel vs théorique
- Équilibrage phases AC
- Cos φ (facteur puissance)

### **3. TABLEAUX (8 points)** :
- État général coffrets DC
- Étanchéité IP65 boîtiers
- Serrage bornes électriques
- Signalétique circuits
- Ventilation coffrets
- Absence corrosion/oxydation
- Échauffement anormal (thermographie)
- Accessibilité maintenance

### **4. CABLAGE (7 points)** :
- Connecteurs MC4 serrés/étanches
- Gaines ICTA/IRL état
- Chemins câbles fixations
- Protection UV câbles DC
- Rayon courbure respecté
- Absence points chauds (thermographie)
- Marquage câbles positif/négatif

### **5. MODULES (10 points)** :
- État visuel face avant (fissures/casse)
- État cadres (corrosion/déformation)
- Boîtiers jonction étanches
- Diodes by-pass fonctionnelles
- Hotspots thermographie (ΔT > 10°C)
- Délamination/bulles
- Snail trails (traces escargot)
- Salissures importantes
- Ombres portées permanentes
- PID (Potential Induced Degradation)

### **6. STRUCTURES (5 points)** :
- Fixations modules (boulons/clips)
- État rails (corrosion/déformation)
- Fondations/lestage stable
- Mise à la terre structures
- Espacement inter-rangées ventilation

### **7. TOITURE (4 points)** :
- Étanchéité traversées toiture
- État couverture (tuiles/bac acier)
- Écrans sous-toiture intacts
- Zinguerie/gouttières fonctionnelles

---

## 🐛 TROUBLESHOOTING

### **Problème** : Badge checklist reste gris "⊖ Non init"
**Solution** : Vérifie que les 3 champs sont remplis (ST + Technicien + Date)

### **Problème** : Flash vert ne s'affiche pas
**Solution** : Attends 1 seconde après saisie date, puis rafraîchis la page

### **Problème** : Dropdown technicien vide
**Solution** : Sélectionne d'abord le sous-traitant, les techniciens se filtrent automatiquement

### **Problème** : Export Excel caractères bizarres
**Solution** : Le fichier est en UTF-8 BOM, Excel devrait l'ouvrir correctement. Sinon, utilise "Importer des données" dans Excel

### **Problème** : Stats ne se mettent pas à jour
**Solution** : Rafraîchis la page (F5) pour recharger les dernières données

---

## 📞 SUPPORT

**En cas de problème technique** :
- Rafraîchis la page (F5)
- Vérifie console navigateur (F12) pour erreurs
- Contacte support technique DiagPV

---

## ✅ CHECKLIST FINALE AVANT ENVOI GIRASOLE

- [ ] **52 centrales attribuées** (ST + Technicien + Date)
- [ ] **Badges verts ✓ 54/54** affichés pour toutes
- [ ] **Stats planning** : "Planifiées: 52 (52 ✓)"
- [ ] **Export Excel** téléchargé et vérifié
- [ ] **Email envoyé à GIRASOLE** avant 14h00
- [ ] **Confirmation réception** client

---

## 🎉 APRÈS LIVRAISON

**Phase suivante** : Exécution terrain
- Techniciens reçoivent URLs audit
- Complètent checklist 54 points + photos
- Retours auto-sauvegardés en base
- DiagPV valide et génère rapports finaux

---

**Document créé le** : 2025-01-21  
**Version système** : v2.0 - Checklist Auto-Attribuée  
**Statut** : ✅ PRODUCTION READY

**Bon courage Adrien ! Tu as 52 centrales à planifier ! 💪🚀**
