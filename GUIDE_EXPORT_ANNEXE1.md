# 📊 Guide Export ANNEXE 1 Enrichie

**Date** : 2025-01-21  
**Objectif** : Enrichir l'ANNEXE 1 GIRASOLE avec les dates et planning des audits

---

## 🎯 NOUVEAU BOUTON DISPONIBLE

### **Dans Planning Manager** :

**👉 Bouton VIOLET** : "Exporter ANNEXE 1 Enrichie"

```
https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/planning-manager
```

---

## 📋 CONTENU EXPORT

### **Colonnes ANNEXE 1 Originales** (Préservées) :

1. **ID** (id_ref GIRASOLE)
2. **Centrale** (nom)
3. **Type** (SOL/TOITURE/OMBRIERE)
4. **Puissance (kWc)**
5. **Localisation** (adresse complète)
6. **Département**
7. **Latitude**
8. **Longitude**
9. **Distance Toulouse (km)**
10. **Distance Lyon (km)**
11. **Distance (km)** (minimum des 2)
12. **Base Proche** (Toulouse/Lyon)

### **Colonnes PLANNING Ajoutées** (Nouvelles) :

13. **Date Audit** (ex: 2025-01-25 ou "NON PLANIFIÉ")
14. **Heure Début** (ex: 08:00)
15. **Durée (h)** (ex: 7)
16. **Sous-Traitant** (ex: "DiagPV Solutions" ou "NON ATTRIBUÉ")
17. **Contact ST** (nom contact)
18. **Tél ST** (téléphone)
19. **Technicien** (ex: "Jean Dupont" ou "NON ATTRIBUÉ")
20. **Tél Technicien**
21. **Email Technicien**
22. **Statut Mission** (ex: "PLANIFIE" ou "NON CRÉÉ")
23. **Checklist** (ex: "PRÊT (54/54)" ou "NON ATTRIBUÉ")
24. **Statut Centrale** (ex: "A_AUDITER")

---

## ⚡ PROCÉDURE EXPRESS

### **1. Planifier les Audits**

Dans Planning Manager :
- Attribue ST + Technicien + Date pour les 52 centrales
- Badge vert ✓ 54/54 confirme checklist créée

### **2. Exporter ANNEXE 1 Enrichie**

**Clique sur bouton VIOLET** : "Exporter ANNEXE 1 Enrichie"

→ Télécharge automatiquement :
```
ANNEXE_1_ENRICHIE_GIRASOLE_2025-01-21.csv
```

### **3. Ouvrir dans Excel**

- Double-clique sur le fichier CSV
- Excel ouvre automatiquement (UTF-8 BOM)
- Toutes les colonnes sont correctement formatées

### **4. Envoyer à GIRASOLE**

- Vérifie les colonnes planning
- Sauvegarde en .xlsx si besoin
- Envoie par email à GIRASOLE

---

## 📊 STATUTS CHECKLIST

**Dans la colonne "Checklist"** :

- **"PRÊT (54/54)"** → Checklist complète, audit ready
- **"EN COURS (X/54)"** → Checklist partielle
- **"À INITIALISER"** → Mission créée, checklist à créer
- **"NON ATTRIBUÉ"** → Pas encore de mission

---

## 💡 EXEMPLE LIGNE PLANIFIÉE

```csv
98563,"TOURNIER",TOITURE,197.925,"548 Route de Marignac, 31430 Gratens, France",31,43.3172,1.12116,41.2,400.8,41.2,Toulouse,2025-01-20,08:00,7,"DiagPV Solutions","Pierre Martin",+33612345678,"Jean Dupont",+33611223344,jean.dupont@example.com,PLANIFIE,"PRÊT (54/54)",A_AUDITER
```

---

## 💡 EXEMPLE LIGNE NON PLANIFIÉE

```csv
15843,"Hangar Laurent ROUX",SOL,313.95,"10 Rue de Vareine 15260 Neuvéglise-sur-Truyère",15,44.92782,2.98992,191.9,171.6,171.6,Lyon,NON PLANIFIÉ,,,NON ATTRIBUÉ,,,NON ATTRIBUÉ,,,NON CRÉÉ,NON ATTRIBUÉ,A_AUDITER
```

---

## 🔍 DIFFÉRENCES AVEC "Export Excel" Standard

### **Bouton VERT "Export Excel"** :
- Export simple planning
- Colonnes condensées
- Pour suivi interne DiagPV

### **Bouton VIOLET "Exporter ANNEXE 1 Enrichie"** :
- Export complet ANNEXE 1 + Planning
- Toutes colonnes originales préservées
- **Pour livraison client GIRASOLE** ✅
- Format identique ANNEXE 1 source
- Tri par ID (id_ref) pour correspondance

---

## 📈 STATS AFFICHÉES APRÈS EXPORT

```
✅ ANNEXE 1 Enrichie exportée !

📊 Total : 52 centrales
📅 Planifiées : 3
✓ Avec checklist : 2

📁 Fichier : ANNEXE_1_ENRICHIE_GIRASOLE_2025-01-21.csv
```

---

## 🎯 ORDRE COLONNES EXACT

```
1.  ID
2.  Centrale
3.  Type
4.  Puissance (kWc)
5.  Localisation
6.  Département
7.  Latitude
8.  Longitude
9.  Distance Toulouse (km)
10. Distance Lyon (km)
11. Distance (km)
12. Base Proche
13. Date Audit                    ← PLANNING
14. Heure Début                   ← PLANNING
15. Durée (h)                     ← PLANNING
16. Sous-Traitant                 ← PLANNING
17. Contact ST                    ← PLANNING
18. Tél ST                        ← PLANNING
19. Technicien                    ← PLANNING
20. Tél Technicien                ← PLANNING
21. Email Technicien              ← PLANNING
22. Statut Mission                ← PLANNING
23. Checklist                     ← PLANNING
24. Statut Centrale               ← PLANNING
```

---

## ✅ CHECKLIST VALIDATION

Avant envoi GIRASOLE, vérifie :

- [ ] **52 lignes** dans le fichier CSV
- [ ] **Colonnes ANNEXE 1** toutes présentes et correctes
- [ ] **Colonnes Planning** ajoutées à droite
- [ ] **Date Audit** remplie pour centrales planifiées
- [ ] **Sous-Traitant** et **Technicien** remplis
- [ ] **Checklist** = "PRÊT (54/54)" pour centrales prêtes
- [ ] **Format Excel** correct (pas de caractères bizarres)
- [ ] **Nom fichier** avec date du jour

---

## 🔧 TROUBLESHOOTING

### **Problème** : Caractères bizarres dans Excel
**Solution** : Le fichier est en UTF-8 BOM, Excel devrait ouvrir automatiquement. Sinon :
1. Ouvre Excel vide
2. Données → Importer des données texte
3. Sélectionne le CSV
4. Encodage : UTF-8

### **Problème** : Colonnes pas alignées
**Solution** : Le CSV utilise des virgules. Si Excel français, utilise :
1. Ouvrir avec Notepad++
2. Remplacer `,` par `;` (chercher/remplacer)
3. Ouvrir dans Excel

### **Problème** : Manque des centrales
**Solution** : Vérifie que les 52 sont bien dans Planning Manager. Rafraîchis (F5) et ré-exporte.

---

## 📧 EMAIL TEMPLATE GIRASOLE

```
Objet : ANNEXE 1 Enrichie - Planning Audits 52 Centrales

Bonjour,

Veuillez trouver ci-joint l'ANNEXE 1 enrichie avec le planning complet des audits pour les 52 centrales photovoltaïques.

📊 Résumé :
- Total centrales : 52
- Planifiées : XX
- Avec checklist prête : XX

Les colonnes de planning ajoutées incluent :
✅ Date audit et horaires
✅ Sous-traitant et technicien attribués
✅ Statut checklist (54 points)
✅ Coordonnées complètes ST/Techniciens

Le fichier préserve toutes les colonnes originales de l'ANNEXE 1 (ID, localisation, GPS, distances, etc.).

Les audits débuteront selon le planning établi.

Cordialement,
Coordinateur Mission GIRASOLEn
Diagnostic Photovoltaïque
```

---

## 🎉 RÉSUMÉ

**Nouveau bouton VIOLET** dans Planning Manager :
→ **"Exporter ANNEXE 1 Enrichie"**

**Contenu** :
→ ANNEXE 1 complète + 12 colonnes planning

**Format** :
→ CSV UTF-8 BOM compatible Excel

**Nom fichier** :
→ `ANNEXE_1_ENRICHIE_GIRASOLE_YYYY-MM-DD.csv`

**Usage** :
→ Livraison client GIRASOLE avec planning complet

---

**Version** : 1.0  
**Date** : 2025-01-21  
**Statut** : ✅ OPÉRATIONNEL

**Prêt pour enrichir l'ANNEXE 1 demain ! 🚀**
