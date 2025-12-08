# 📊 EXPORT CSV - ATTRIBUTIONS CENTRALES GIRASOLE 2025

**Date**: 8 décembre 2025  
**Version**: v2.6.1  
**Statut**: ✅ Déployé en production

---

## 🎯 OBJECTIF

Créer des fichiers CSV exportables avec toutes les centrales et leurs attributions pour faciliter le partage avec Fabien et chaque sous-traitant.

---

## 📁 FICHIERS CRÉÉS

### **Fichier Complet (ANNEXE 1)**
- **`ANNEXE1_COMPLETE_ATTRIBUTIONS.csv`**
  - **52 centrales** avec toutes les données
  - Colonnes: ID, Nom, Sous-traitant, Type, Puissance, Localisation, Contacts, etc.
  - Taille: 20 Ko

### **Fichiers par Sous-traitant**
| Fichier | Sous-traitant | Nb Centrales | Départements |
|---------|---------------|--------------|--------------|
| `ATTRIBUTION_ARTEMIS.csv` | ARTEMIS | 24 | 03, 07, 19, 23, 26, 38, 42, 71, 89 |
| `ATTRIBUTION_DIAGPV___Adrien_&_Fabien.csv` | DIAGPV | 14 | 11, 31, 34, 47 |
| `ATTRIBUTION_EDOUARD___Martial.csv` | EDOUARD - Martial | 7 | 17, 37, 44, 79 |
| `ATTRIBUTION_CADENET.csv` | CADENET | 4 | 03, 15, 46 |
| `ATTRIBUTION_DRONE_AVEYRON_SERVICE.csv` | DRONE AVEYRON | 2 | 12 |
| `ATTRIBUTION_COURTIADE_DISTRIB.csv` | COURTIADE | 1 | 32 |

---

## 📋 COLONNES INCLUSES

1. **ID** - Identifiant centrale
2. **Nom centrale** - Nom complet
3. **Sous-traitant** - Attribution actuelle
4. **Type** - Type centrale (SOL, Toiture, etc.)
5. **Puissance (kWc)** - Puissance installée
6. **Département** - Code département
7. **Localisation** - Adresse simplifiée
8. **Adresse complète** - Adresse détaillée
9. **ID Référent** - ID référence externe
10. **SPV** - Référence SPV
11. **Latitude** - Coordonnée GPS
12. **Longitude** - Coordonnée GPS
13. **Type centrale** - Type détaillé (Toiture existante, Bâtiment neuf, etc.)
14. **Installateur** - Entreprise installatrice
15. **Date MES** - Date mise en service
16. **SI** - Système d'information
17. **Panneaux** - Modèle panneaux
18. **Contact Exploitation** - Nom contact exploitation
19. **Tel Exploitation** - Téléphone exploitation
20. **Contact Gestion** - Nom contact gestion
21. **Tel Gestion** - Téléphone gestion
22. **Audit toiture** - Présence audit toiture (X ou vide)
23. **Audit hors toiture** - Présence audit hors toiture (X ou vide)
24. **Ratio PR** - Ratio performance réel/théorique
25. **Date prév audit** - Date prévisionnelle audit
26. **Mission ID** - ID mission ordre
27. **Statut mission** - PLANIFIE / TERMINE
28. **Date mission** - Date mission prévue
29. **Technicien** - Technicien affecté

---

## 🌐 ACCÈS EN LIGNE

### **Page de téléchargement**
**URL**: https://girasole-diagpv.pages.dev/documents-export

Interface graphique avec :
- ✅ Bouton téléchargement fichier complet
- ✅ Cartes individuelles par sous-traitant
- ✅ Design responsive et moderne
- ✅ Compteurs missions par sous-traitant
- ✅ Liste départements couverts

### **Accès direct aux fichiers**
Base URL: `https://girasole-diagpv.pages.dev/documents/csv/`

**Fichiers disponibles:**
- `ANNEXE1_COMPLETE_ATTRIBUTIONS.csv` (Fichier complet)
- `ATTRIBUTION_ARTEMIS.csv`
- `ATTRIBUTION_DIAGPV___Adrien_&_Fabien.csv`
- `ATTRIBUTION_EDOUARD___Martial.csv`
- `ATTRIBUTION_CADENET.csv`
- `ATTRIBUTION_DRONE_AVEYRON_SERVICE.csv`
- `ATTRIBUTION_COURTIADE_DISTRIB.csv`

---

## 💻 FORMAT TECHNIQUE

- **Encodage**: UTF-8 avec BOM (compatibilité Excel)
- **Séparateur**: Point-virgule (`;`)
- **Format**: Standard CSV
- **Compatible**: Excel, LibreOffice, Google Sheets, Power BI

---

## 📧 PARTAGE

### **Pour Fabien (accès complet)**
Envoyer le lien : https://girasole-diagpv.pages.dev/documents-export

Il peut télécharger :
- Le fichier complet (ANNEXE1)
- Tous les fichiers individuels par sous-traitant

### **Pour chaque sous-traitant**
Envoyer le lien direct vers leur fichier :

**ARTEMIS:**
```
https://girasole-diagpv.pages.dev/documents/csv/ATTRIBUTION_ARTEMIS.csv
```

**DIAGPV:**
```
https://girasole-diagpv.pages.dev/documents/csv/ATTRIBUTION_DIAGPV___Adrien_&_Fabien.csv
```

**EDOUARD:**
```
https://girasole-diagpv.pages.dev/documents/csv/ATTRIBUTION_EDOUARD___Martial.csv
```

**CADENET:**
```
https://girasole-diagpv.pages.dev/documents/csv/ATTRIBUTION_CADENET.csv
```

**DRONE AVEYRON:**
```
https://girasole-diagpv.pages.dev/documents/csv/ATTRIBUTION_DRONE_AVEYRON_SERVICE.csv
```

**COURTIADE:**
```
https://girasole-diagpv.pages.dev/documents/csv/ATTRIBUTION_COURTIADE_DISTRIB.csv
```

---

## 🔄 MISE À JOUR

Les fichiers CSV sont automatiquement générés à partir de la base de données D1 Cloudflare.

**Pour régénérer les fichiers:**
```bash
cd /home/user/webapp
python3 generate_csv.py
npm run build
npx wrangler pages deploy dist --project-name girasole-diagpv
```

---

## 📊 STATISTIQUES

| Sous-traitant | Centrales | Puissance totale | % |
|---------------|-----------|------------------|---|
| ARTEMIS | 24 | ~8,029 kWc | 46% |
| DIAGPV | 14 | ~3,561 kWc | 27% |
| EDOUARD | 7 | ~1,902 kWc | 13% |
| CADENET | 4 | ~879 kWc | 8% |
| DRONE AVEYRON | 2 | ~628 kWc | 4% |
| COURTIADE | 1 | ~218 kWc | 2% |
| **TOTAL** | **52** | **~15,217 kWc** | **100%** |

---

## ✅ VALIDATION

- ✅ 52/52 centrales exportées
- ✅ Toutes les attributions incluses
- ✅ Données techniques complètes
- ✅ Contacts exploitation/gestion présents
- ✅ Compatible Excel/Google Sheets
- ✅ Encodage UTF-8 avec BOM
- ✅ Page web déployée et accessible
- ✅ Fichiers testés et téléchargeables

---

## 🚀 DÉPLOIEMENT

**URL Production**: https://girasole-diagpv.pages.dev  
**URL Dernière version**: https://4ca82e5d.girasole-diagpv.pages.dev  
**Page Export**: https://girasole-diagpv.pages.dev/documents-export

**Build size**: 372.51 kB  
**Temps build**: 841ms  
**Status**: ✅ 100% opérationnel

---

**Diagnostic Photovoltaïque - GIRASOLE 2025**  
© 2025 - Tous droits réservés
