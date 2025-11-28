# 📊 ATTRIBUTION DES CENTRALES AUX SOUS-TRAITANTS

## 🎯 SITUATION ACTUELLE (28/11/2024)

### **7 Sous-traitants enregistrés**

| ID | Nom Entreprise | Contact Principal | Statut |
|----|----------------|-------------------|--------|
| 1 | DiagPV Solutions | Pierre Martin | ACTIF |
| 2 | SolarTech Audits | Marie Dubois | ACTIF |
| 3 | **ARTEMIS** | LOIC | ACTIF |
| 4 | CADENET | Contact CADENET | ACTIF |
| 5 | **DIAGPV - Adrien & Fabien** | Adrien | ACTIF |
| 6 | EDOUARD - Martial | Martial Edouard | ACTIF |
| 7 | COURTIADE DISTRIB | Courtiade | ACTIF |

---

## 📋 ATTRIBUTION ACTUELLE DES MISSIONS

### **🔴 PROBLÈME DÉTECTÉ : Toutes les missions sont attribuées à ARTEMIS**

**Répartition actuelle (table `ordres_mission`) :**
- **ARTEMIS (ID=3)** : **52 missions** (100%)
- Autres sous-traitants : **0 mission**

**Mais dans `centrales.sous_traitant_prevu` (colonne texte) :**
- ARTEMIS : ~22 centrales
- CADENET : ~11 centrales
- NULL : ~19 centrales (non renseigné)

**→ INCOHÉRENCE : Les 2 systèmes d'attribution ne correspondent PAS.**

---

## 📝 EXEMPLES D'INCOHÉRENCES

| Centrale ID | Nom | `sous_traitant_prevu` | `ordres_mission.sous_traitant_id` |
|-------------|-----|-----------------------|-----------------------------------|
| 2 | EARL CADOT | ARTEMIS | ARTEMIS ✅ |
| 5 | Hangar Laurent ROUX | **CADENET** | **ARTEMIS** ❌ |
| 6 | Hangar Bernard MAGE | **CADENET** | **ARTEMIS** ❌ |
| 14 | MARTEL 184 Construction | **CADENET** | **ARTEMIS** ❌ |
| 15 | BOUCHARDY 203 LOC | **CADENET** | **ARTEMIS** ❌ |

---

## ✅ SOLUTION PROPOSÉE : Interface Simple d'Attribution

### **Fonctionnalités :**

1. **Dans l'onglet Centrales** :
   - Ajouter une colonne "Sous-traitant attribué"
   - Dropdown (menu déroulant) pour sélectionner un sous-traitant
   - Sauvegarde automatique lors du changement

2. **Synchronisation automatique** :
   - Mise à jour de `ordres_mission.sous_traitant_id`
   - *(Optionnel)* Mise à jour de `centrales.sous_traitant_prevu` pour cohérence

3. **Sans module complexe** :
   - Pas de page dédiée
   - Pas de génération de mails
   - Juste un dropdown simple et efficace

---

## 🔧 MODIFICATIONS TECHNIQUES NÉCESSAIRES

### **1. Backend : Nouvel endpoint API**

```typescript
PUT /api/centrales/:centrale_id/sous-traitant
Body: { "sous_traitant_id": 4 }
```

**Actions :**
- Mettre à jour `ordres_mission.sous_traitant_id` pour cette centrale
- *(Optionnel)* Synchroniser `centrales.sous_traitant_prevu`

### **2. Frontend : Colonne dropdown dans tableau Centrales**

**Ajout dans la page `/centrales` :**
- Colonne "Sous-traitant"
- `<select>` avec liste déroulante
- `onchange` → appel API `PUT`

### **3. Sécurité des données**

✅ **AUCUNE PERTE DE DONNÉES** :
- Les checklists existantes restent intactes
- Les photos/commentaires sont préservés
- Les rapports générés restent accessibles
- Seule l'attribution mission/sous-traitant change

---

## 🎯 PROCHAINES ÉTAPES

1. **Confirmer l'approche** : Dropdown simple dans onglet Centrales
2. **Développer l'endpoint API** : `PUT /api/centrales/:id/sous-traitant`
3. **Ajouter la colonne** dans l'interface Centrales
4. **Tester** sur 2-3 centrales
5. **Déployer** en production

---

## 📞 QUESTIONS À VALIDER

1. ✅ **Pas de module dédié** : Juste un dropdown dans Centrales ?
2. ✅ **Pas de génération d'email** : Tu gères ça avec ton agent GenSpark ?
3. ❓ **Synchroniser ou supprimer `centrales.sous_traitant_prevu`** ?
4. ❓ **Afficher l'historique** des changements d'attribution ?

---

**📅 Dernière mise à jour** : 28/11/2024  
**Version** : 2.2  
**Statut** : ⏳ En attente validation approche
