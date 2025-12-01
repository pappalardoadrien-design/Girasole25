# 📋 Checklist Toiture GIRASOLE - Version 2.5.2

**Date** : 01/12/2025  
**Action** : Nettoyage checklist toiture - Focus terrain uniquement  
**Statut** : ✅ Appliqué en PROD

---

## 🎯 Objectif

Simplifier la checklist toiture pour les techniciens terrain en **supprimant tous les points Bureau d'Études et documentation**, ne garder **que les contrôles visuels terrain**.

---

## 📊 Structure Finale (31 items)

### **Items 1-11 : Base AUDIT_TOITURE** (existants)
1. Démontage/remontage ~25 panneaux pertinents
2. Conformité DTU 40.35
3. Qualité montage/serrage SI sur support
4. Qualité montage/serrage panneaux sur SI
5. Fixation cheminement câbles (supports, étanchéité)
6. Compatibilité/serrage/étanchéité connecteurs MC4
7. Qualité cheminement câbles DC dans chemins de câbles
8. Cheminement câbles (pas directement sur couverture)
9. Raccordements terres
10. Étiquettes réglementaires tension DC
11. Respect notices montage / Interdiction marcher sur panneaux

### **Items 12-20 : DEPOSE_PANNEAUX** (9 items - Nouveau)
12. Nombre panneaux déposés (min 25)
13. Zone dépose : 1er panneau chaînes
14. Zone dépose : Dernier panneau chaînes
15. Zone dépose : Rives
16. Zone dépose : Angles
17. Zone dépose : Zones suspicion écarts
18. Constats sous panneaux (fixations, étanchéité, câbles, raccordements)
19. Photos dessous panneaux (min 5 photos)
20. Repose panneaux sans atteinte intégrité

### **Items 21-28 : CONFORMITE_DTU** (8 items - Nouveau)
21. Installation conforme DTU 40.35
22. DTU : Fixations sur appuis pannes (PAS en fond nervure)
23. DTU : Rondelles étanchéité présentes
24. DTU : Traversées avec collerettes + joints
25. DTU : Pas d'infiltrations visibles
26. DTU : Pente ≥ 5% (2,86°)
27. DTU : Pas de déformations importantes structure
28. DTU : Pas de corrosion avancée

### **Items 29-31 : PRATIQUES_TERRAIN** (3 items - Nouveau)
29. Bonnes pratiques identifiées (impactent positivement)
30. Mauvaises pratiques identifiées (impactent négativement)
31. Photos bonnes/mauvaises pratiques

---

## ❌ Items Supprimés (Bureau d'Études / Documentation)

### **Migration 0018 : Suppression 13 items BE/docs**
- **Items 29-34** : Conformité ETN (6 items) → Vérification Bureau d'Études
- **Items 35-37** : Conformité notices montage (3 items) → Revue documentaire
- **Items 38-41** : Prescriptions GIRASOLE (4 items) → Documents administratifs

### **Migration 0019 : Suppression 3 doublons**
- **Item 12 ancien** : Présence de film anticondensation (redondant)
- **Item 13 ancien** : Présence de limaille sous modules (redondant)
- **Item 14 ancien** : Mesurer distance Modules > Rives (redondant)

**Total supprimé** : 16 items

---

## 🔧 Migrations Appliquées

### **Migration 0018** : `0018_nettoyage_items_toiture_terrain_only.sql`
```sql
-- Suppression items 29-41 (ETN, Notices, GIRASOLE docs)
DELETE FROM checklist_toiture_template WHERE item_numero BETWEEN 29 AND 41;

-- Renommage items 42-44 en 29-31
UPDATE checklist_toiture_template SET item_numero = 29 WHERE item_numero = 42;
UPDATE checklist_toiture_template SET item_numero = 30 WHERE item_numero = 43;
UPDATE checklist_toiture_template SET item_numero = 31 WHERE item_numero = 44;
```

### **Migration 0019** : `0019_suppression_doublons_items_12_14.sql`
```sql
-- Suppression 3 anciens items 12-14 (doublons catégorie AUDIT_TOITURE)
DELETE FROM checklist_toiture_template 
WHERE item_numero IN (12, 13, 14) AND categorie = 'AUDIT_TOITURE';
```

---

## ✅ Garanties

### **Données Missions Existantes**
- ✅ **ZÉRO modification** des checklists en cours ou terminées
- ✅ Template uniquement modifié (table `checklist_toiture_template`)
- ✅ Nouvelles missions TOITURE utiliseront automatiquement 31 items

### **Structure Validée**
```
Total items   : 31
Items uniques : 31 (aucun doublon)
Catégories    : 4 (AUDIT_TOITURE, DEPOSE_PANNEAUX, CONFORMITE_DTU, PRATIQUES_TERRAIN)
```

---

## 📦 Prochaines Étapes

### **Pour nouvelles missions TOITURE**
1. Création mission type "AUDIT_TOITURE"
2. Génération automatique 31 items depuis template
3. Technicien terrain remplit uniquement contrôles visuels
4. Validation + photos + commentaires

### **Points d'attention techniciens**
- **Dépose min 25 panneaux** (items 12-20)
- **Photos obligatoires** : min 5 photos dessous panneaux (item 19)
- **DTU 40.35** : vérifications visuelles uniquement (items 21-28)
- **Bonnes/mauvaises pratiques** : documentation photos (items 29-31)

---

## 🔗 Fichiers Associés

- `migrations/0018_nettoyage_items_toiture_terrain_only.sql`
- `migrations/0019_suppression_doublons_items_12_14.sql`
- `migrations/0017_ajout_items_toiture_depose_conformite.sql` (référence)

---

## 📝 Notes Développement

**Commandes SQL utiles** :
```sql
-- Compter items par catégorie
SELECT categorie, COUNT(*) FROM checklist_toiture_template GROUP BY categorie;

-- Lister tous items
SELECT item_numero, libelle, categorie FROM checklist_toiture_template ORDER BY item_numero;

-- Vérifier doublons
SELECT item_numero, COUNT(*) FROM checklist_toiture_template GROUP BY item_numero HAVING COUNT(*) > 1;
```

**Version** : v2.5.2  
**Statut PROD** : ✅ Déployé  
**Date application** : 01/12/2025
