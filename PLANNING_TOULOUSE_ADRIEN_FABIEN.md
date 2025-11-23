# 📅 Planning Toulouse - Adrien & Fabien

**Date** : 2025-01-21  
**Objectif** : Planifier les 26 centrales base Toulouse pour Adrien et Fabien

---

## 👥 ÉQUIPE TOULOUSE

### **Sous-Traitant** : DiagPV Solutions (ID 1)

**Techniciens** :
- 🔵 **Adrien Pappalardon** (ID 1) - Business Developer + Audits terrain
- 🔵 **Fabien COLLABORATEUR** (ID 2) - Technicien terrain

---

## 📊 CENTRALES BASE TOULOUSE (26)

### **Tri par distance croissante depuis Toulouse**

| # | ID | Centrale | Dept | Distance | Type | kWc |
|---|----|---------| -----|----------|------|-----|
| 1 | 98563 | **TOURNIER** | 31 | 41.2 km | TOITURE | 197.9 |
| 2 | 3085 | Hangar Maxime Bayle | 11 | 60.9 km | SOL | 324.9 |
| 3 | 95592 | GFA LASCOMBES | 11 | 68.6 km | SOL | 277.1 |
| 4 | 95918 | Hangar Frédéric CASTET | 31 | 78.2 km | SOL | 309.4 |
| 5 | 99373 | Hangar Yannick CLEMENT | 31 | 78.2 km | SOL | 331.2 |
| 6 | 95919 | Hangar Frédéric CASTET | 31 | 78.2 km | TOITURE | 268.7 |
| 7 | 97565 | Commune De Pomas | 11 | 87.8 km | SOL | 254.8 |
| 8 | 30489 | Hangar Pierre MOURGUES | 46 | 89.5 km | SOL | 222.5 |
| 9 | 28173 | Burgat Et Fils Tp | 11 | 89.6 km | TOITURE | 113.0 |
| 10 | 33559 | Hangar Christophe CARRERE n°2 | 47 | 100.1 km | SOL | 278.0 |
| 11 | 22147 | HANGAR Christian MIGNARD | 11 | 104.4 km | SOL | 97.1 |
| 12 | ... | (14 autres centrales) | ... | ... | ... | ... |

---

## 🗓️ SUGGESTION PLANNING

### **Semaine 1** (27-31 Janvier 2025)

**Lundi 27/01** - Adrien :
- TOURNIER (31) - 41.2 km - 7h - TOITURE 197.9 kWc

**Mardi 28/01** - Fabien :
- Hangar Maxime Bayle (11) - 60.9 km - 7h - SOL 324.9 kWc

**Mercredi 29/01** - Adrien :
- GFA LASCOMBES (11) - 68.6 km - 7h - SOL 277.1 kWc

**Jeudi 30/01** - Fabien :
- Hangar Frédéric CASTET (31) - 78.2 km - 7h - SOL 309.4 kWc

**Vendredi 31/01** - Adrien :
- Hangar Yannick CLEMENT (31) - 78.2 km - 7h - SOL 331.2 kWc

### **Semaine 2** (3-7 Février 2025)

**Lundi 03/02** - Fabien :
- Hangar Frédéric CASTET (31) - 78.2 km - 7h - TOITURE 268.7 kWc

**Mardi 04/02** - Adrien :
- Commune De Pomas (11) - 87.8 km - 7h - SOL 254.8 kWc

... (continuer sur 4-5 semaines)

---

## ⚡ PROCÉDURE D'ATTRIBUTION DANS PLANNING MANAGER

### **1. Mettre à jour les techniciens (FAIT)** ✅

Les techniciens ont été préparés :
- ID 1 : Adrien Pappalardon
- ID 2 : Fabien COLLABORATEUR

### **2. Attribuer dans Planning Manager**

**Pour chaque centrale base Toulouse** :

1. Ouvre Planning Manager
2. Trouve la centrale dans le tableau
3. **Sous-Traitant** : DiagPV Solutions
4. **Technicien** : Adrien (ID 1) ou Fabien (ID 2)
5. **Date** : Selon planning suggéré ci-dessus
6. ✅ **Auto-save** + Badge vert ✓ 54/54

### **3. Répartition suggérée**

**Adrien** : 13 centrales
- Mix SOL/TOITURE
- Centrales techniques importantes
- Départements 31, 11, 46, 47

**Fabien** : 13 centrales
- Majoritairement SOL
- Centrales standard
- Départements 11, 31, 82

---

## 📋 CENTRALES TOULOUSE COMPLÈTES

Liste exhaustive des 26 centrales :

```
ID      | Centrale                          | Dept | Distance | Type     | kWc
--------|-----------------------------------|------|----------|----------|-------
98563   | TOURNIER                          | 31   | 41.2     | TOITURE  | 197.9
3085    | Hangar Maxime Bayle               | 11   | 60.9     | SOL      | 324.9
95592   | GFA LASCOMBES                     | 11   | 68.6     | SOL      | 277.1
95918   | Hangar Frédéric CASTET            | 31   | 78.2     | SOL      | 309.4
99373   | Hangar Yannick CLEMENT            | 31   | 78.2     | SOL      | 331.2
95919   | Hangar Frédéric CASTET            | 31   | 78.2     | TOITURE  | 268.7
97565   | Commune De Pomas                  | 11   | 87.8     | SOL      | 254.8
30489   | Hangar Pierre MOURGUES            | 46   | 89.5     | SOL      | 222.5
28173   | Burgat Et Fils Tp                 | 11   | 89.6     | TOITURE  | 113.0
33559   | Hangar Christophe CARRERE n°2     | 47   | 100.1    | SOL      | 278.0
22147   | HANGAR Christian MIGNARD          | 11   | 104.4    | SOL      | 97.1
... (+ 15 autres)
```

---

## 🚀 WORKFLOW DEMAIN MATIN

### **Étape 1** : Exécuter update SQL (Optionnel)
```bash
cd /home/user/webapp
npx wrangler d1 execute girasole-db-production --local --file=./update_techniciens_diagpv.sql
```

### **Étape 2** : Vérifier techniciens dans Planning Manager
- Ouvre Planning Manager
- Vérifie dropdowns "Technicien" → Adrien et Fabien visibles

### **Étape 3** : Attribuer les 26 centrales Toulouse
- Filtre mental sur base "Toulouse" (badge bleu)
- Attribue Adrien ou Fabien selon planning suggéré
- Dates : 27/01 → 28/02 (5 semaines)

### **Étape 4** : Exporter ANNEXE 1 enrichie
- Bouton VIOLET "Exporter ANNEXE 1 Enrichie"
- Télécharger CSV
- Vérifier colonnes planning

### **Étape 5** : Envoyer GIRASOLE
- Ouvrir Excel
- Vérifier données
- Envoyer email GIRASOLE

---

## 💡 TIPS RÉPARTITION

### **Critères attribution** :

**Adrien** :
- Installations complexes (TOITURE)
- Centrales > 250 kWc
- Nouveaux clients importants
- Départements prioritaires (31, 46, 47)

**Fabien** :
- Installations standard (SOL)
- Centrales < 250 kWc
- Clients récurrents
- Départements secondaires (11, 82)

### **Optimisation tournées** :

1. **Regrouper par département** (31, 11, 46, 47, 82)
2. **Planifier par distance croissante**
3. **Alterner SOL/TOITURE** pour variété
4. **1 centrale/jour** (7h audit + déplacement)

---

## 📊 STATS PRÉVUES

**26 centrales Toulouse** :
- Durée totale : **182 heures terrain** (26 × 7h)
- Avec Adrien + Fabien : **~3 semaines** (13 jours chacun)
- Dates : **27 Janvier → 21 Février 2025**

**Reste 26 centrales Lyon** :
- À planifier avec autres techniciens
- Base Lyon (badge rouge)

---

## ✅ CHECKLIST AVANT ENVOI GIRASOLE

- [ ] 26 centrales Toulouse attribuées (Adrien + Fabien)
- [ ] Dates réparties sur 5 semaines
- [ ] Badge vert ✓ 54/54 pour toutes
- [ ] Export ANNEXE 1 enrichie téléchargé
- [ ] Colonne "Technicien" remplie (Adrien/Fabien)
- [ ] Colonne "Date Audit" remplie
- [ ] Colonne "Checklist" = "PRÊT (54/54)"
- [ ] Fichier ouvert dans Excel sans erreur
- [ ] Email GIRASOLE envoyé ✅

---

**Version** : 1.0  
**Date** : 2025-01-21  
**Statut** : ✅ READY

**Prêt à planifier Toulouse avec Adrien & Fabien ! 🚀**
