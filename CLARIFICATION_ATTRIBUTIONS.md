# 🔍 CLARIFICATION ATTRIBUTIONS SOUS-TRAITANTS GIRASOLE 2025

## ✅ SOUS-TRAITANTS REELS DANS LA BASE DE DONNEES

**Date vérification** : 2025-12-08  
**Base de données** : `girasole-db-production` (REMOTE)  
**Total missions** : 52

---

## 📊 REPARTITION CONFIRMEE (Base D1 Production)

| Sous-traitant | Nb missions | % du total |
|---------------|-------------|------------|
| **ARTEMIS** | 25 | 48.1% |
| **DIAGPV - Adrien & Fabien** | 14 | 26.9% |
| **EDOUARD - Martial** | 7 | 13.5% |
| **CADENET** | 3 | 5.8% |
| **DRONE AVEYRON SERVICE** | 2 | 3.8% |
| **COURTIADE DISTRIB** | 1 | 1.9% |
| **TOTAL** | **52** | **100%** |

---

## ❌ REVAL ET NOCEA N'EXISTENT PAS

**ERREUR IDENTIFIEE** : Les fichiers CSV `ATTRIBUTION_REVAL.csv` et `ATTRIBUTION_NOCEA.csv` ont été créés par erreur lors de sessions précédentes.

**VERIFICATION** :
- ✅ Requête SQL sur base production : Seulement 6 sous-traitants actifs
- ❌ REVAL : **N'existe pas** dans la base
- ❌ NOCEA : **N'existe pas** dans la base

---

## ✅ COURTIADE DISTRIB ET DRONE AVEYRON SERVICE CONFIRMES

**Ces deux sous-traitants existent bien dans la base de données production :**

### **COURTIADE DISTRIB**
- **Missions attribuées** : 1 mission
- **Statut** : ✅ Actif dans base production
- **CSV généré** : `ATTRIBUTION_COURTIADE_DISTRIB.csv`

### **DRONE AVEYRON SERVICE**
- **Missions attribuées** : 2 missions
- **Statut** : ✅ Actif dans base production
- **CSV généré** : `ATTRIBUTION_DRONE_AVEYRON_SERVICE.csv`

---

## 🗂️ FICHIERS CSV EXISTANTS

### **CSV Valides (présents dans `/dist/documents/csv/`)** :
1. ✅ `ANNEXE1_COMPLETE_ATTRIBUTIONS.csv` (52 missions, tous sous-traitants)
2. ✅ `ATTRIBUTION_ARTEMIS.csv` (25 missions)
3. ✅ `ATTRIBUTION_DIAGPV___Adrien_&_Fabien.csv` (14 missions)
4. ✅ `ATTRIBUTION_EDOUARD___Martial.csv` (7 missions)
5. ✅ `ATTRIBUTION_CADENET.csv` (3 missions)
6. ✅ `ATTRIBUTION_DRONE_AVEYRON_SERVICE.csv` (2 missions)
7. ✅ `ATTRIBUTION_COURTIADE_DISTRIB.csv` (1 mission)

### **CSV Invalides (à supprimer ou ignorer)** :
8. ❌ `ATTRIBUTION_REVAL.csv` (sous-traitant inexistant)
9. ❌ `ATTRIBUTION_NOCEA.csv` (sous-traitant inexistant)

---

## 🔗 LIENS CSV CORRIGES - PRODUCTION

| Sous-traitant | Missions | URL CSV Production |
|---------------|----------|-------------------|
| **ANNEXE 1 COMPLETE** | 52 | https://girasole-diagpv.pages.dev/documents/csv/ANNEXE1_COMPLETE_ATTRIBUTIONS.csv |
| **ARTEMIS** | 25 | https://girasole-diagpv.pages.dev/documents/csv/ATTRIBUTION_ARTEMIS.csv |
| **DIAGPV** | 14 | https://girasole-diagpv.pages.dev/documents/csv/ATTRIBUTION_DIAGPV___Adrien_&_Fabien.csv |
| **EDOUARD** | 7 | https://girasole-diagpv.pages.dev/documents/csv/ATTRIBUTION_EDOUARD___Martial.csv |
| **CADENET** | 3 | https://girasole-diagpv.pages.dev/documents/csv/ATTRIBUTION_CADENET.csv |
| **DRONE AVEYRON SERVICE** | 2 | https://girasole-diagpv.pages.dev/documents/csv/ATTRIBUTION_DRONE_AVEYRON_SERVICE.csv |
| **COURTIADE DISTRIB** | 1 | https://girasole-diagpv.pages.dev/documents/csv/ATTRIBUTION_COURTIADE_DISTRIB.csv |

---

## 🎯 ACTIONS RECOMMANDEES

### **Court terme (immédiat)** :
1. ✅ Utiliser les 7 CSV valides listés ci-dessus
2. ❌ Ignorer les fichiers `ATTRIBUTION_REVAL.csv` et `ATTRIBUTION_NOCEA.csv`
3. ✅ Confirmer que COURTIADE DISTRIB et DRONE AVEYRON SERVICE sont bien actifs

### **Moyen terme (si nécessaire)** :
4. 🧹 Supprimer physiquement les fichiers CSV invalides (REVAL, NOCEA)
5. 📧 Créer emails pour COURTIADE DISTRIB (1 mission) et DRONE AVEYRON SERVICE (2 missions)
6. 📊 Mettre à jour la documentation pour refléter les 6 sous-traitants réels

---

## ✅ CONCLUSION

**6 sous-traitants actifs confirmés dans base production** :
1. ✅ ARTEMIS (25 missions)
2. ✅ DIAGPV - Adrien & Fabien (14 missions)
3. ✅ EDOUARD - Martial (7 missions)
4. ✅ CADENET (3 missions)
5. ✅ DRONE AVEYRON SERVICE (2 missions)
6. ✅ COURTIADE DISTRIB (1 mission)

**REVAL et NOCEA sont des erreurs** - Ces sous-traitants n'existent pas dans la base de données production.

---

**Rapport créé** : 2025-12-08  
**Source données** : Base D1 production `girasole-db-production` (REMOTE)  
**Vérification** : Requête SQL jointure `ordres_mission` × `sous_traitants`  
**Statut** : ✅ **CLARIFICATION COMPLETE - 6 SOUS-TRAITANTS CONFIRMES**
