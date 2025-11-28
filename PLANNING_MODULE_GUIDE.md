# 📋 Guide Module Planning - GIRASOLE 2025

## 🎯 Vue d'Ensemble

Le module Planning permet la gestion complète des sous-traitants, techniciens, et l'attribution des 52 centrales photovoltaïques aux équipes terrain avec génération automatique des ordres de mission PDF.

---

## 🏗️ Architecture Système

### **Base de Données (Cloudflare D1)**

#### Tables Créées (Migration 0002)

```sql
sous_traitants (5-6 entreprises)
├── id, nom_entreprise, email_contact, telephone
├── adresse, siret, contact_principal
└── statut (ACTIF, INACTIF, SUSPENDU)

techniciens (~10 personnes)
├── id, sous_traitant_id (FK)
├── prenom, nom, email, telephone
└── statut (DISPONIBLE, OCCUPE, INDISPONIBLE, CONGE)

ordres_mission (52 max pour GIRASOLE)
├── id, centrale_id (FK), technicien_id (FK), sous_traitant_id (FK)
├── date_mission, heure_debut, heure_fin, duree_estimee_heures
├── statut (PLANIFIE, CONFIRME, EN_COURS, TERMINE, VALIDE, ANNULE, REPORTE)
└── checklist_generee, ordre_mission_pdf, commentaires

planning_events (vue calendrier)
├── id, ordre_mission_id (FK)
├── centrale_id, technicien_id, sous_traitant_id
├── date_debut, date_fin, titre, description
└── couleur, statut
```

#### Contraintes Importantes
- **UNIQUE centrale_id** dans ordres_mission → Une centrale = un seul ordre actif
- **Cascade DELETE** → Suppression sous-traitant supprime techniciens/missions
- **CHECK statut** → Valeurs contrôlées pour cohérence

---

## 🔌 API Endpoints

### **Sous-Traitants**

```bash
# Liste tous sous-traitants avec stats
GET /api/sous-traitants
Response: [{id, nom_entreprise, nb_techniciens, nb_missions, ...}]

# Créer nouveau sous-traitant
POST /api/sous-traitants
Body: {nom_entreprise*, email_contact, telephone, adresse, siret, contact_principal}

# Modifier sous-traitant
PUT /api/sous-traitants/:id
Body: {nom_entreprise, email_contact, ..., statut}
```

### **Techniciens**

```bash
# Liste tous techniciens avec entreprise
GET /api/techniciens
Response: [{id, prenom, nom, nom_entreprise, nb_missions_actives, ...}]

# Créer nouveau technicien
POST /api/techniciens
Body: {sous_traitant_id*, prenom*, nom*, email, telephone}

# Modifier technicien
PUT /api/techniciens/:id
Body: {sous_traitant_id, prenom, nom, email, telephone, statut}
```

### **Ordres de Mission**

```bash
# Liste tous ordres avec détails complets
GET /api/ordres-mission
Response: [{id, centrale_nom, technicien_prenom, technicien_nom, nom_entreprise, date_mission, statut, ...}]

# Créer ordre de mission (attribution centrale)
POST /api/ordres-mission
Body: {
  centrale_id*,
  technicien_id*,
  sous_traitant_id*,
  date_mission*,
  heure_debut,
  duree_estimee_heures,
  commentaires
}

# Changer statut mission
PUT /api/ordres-mission/:id/statut
Body: {statut*, raison_annulation}

# Générer document ordre de mission PDF
GET /api/ordres-mission/:id/document
Response: HTML page (print to PDF with Ctrl+P)
```

### **Planning & Stats**

```bash
# Événements planning calendrier
GET /api/planning?start=2025-01-20&end=2025-01-31
Response: [{id, centrale_nom, technicien_nom, date_debut, date_fin, ...}]

# Stats planning globales
GET /api/stats/planning
Response: {
  centrales_non_attribuees,
  techniciens_disponibles,
  missions_par_statut: [{statut, count}],
  missions_par_sous_traitant: [{nom_entreprise, nb_missions, missions_actives}]
}
```

---

## 🎨 Interface Web

### **Onglet Planning (5 sections)**

#### **1. Dashboard KPI (4 cartes)**
- 🟠 Centrales Non Attribuées (51/52)
- 🔵 Missions Planifiées (1)
- 🟢 Techniciens Disponibles (4)
- 🟣 Sous-Traitants Actifs (2)

#### **2. Actions Rapides (3 boutons)**
- 🏢 **Ajouter Sous-Traitant** → Modal formulaire entreprise
- 👤 **Ajouter Technicien** → Modal formulaire + sélection entreprise
- 📋 **Créer Ordre de Mission** → Modal attribution centrale → technicien + date

#### **3. Sous-onglet "Ordres de Mission"**
- Liste groupée par statut (PLANIFIE, CONFIRME, EN_COURS, TERMINE, VALIDE)
- Cartes mission avec infos complètes
- 3 boutons actions :
  - 📄 **PDF** (bleu) : Ouvre ordre de mission complet
  - ✅ **Checklist** (violet) : Même fonction (alias)
  - ✏️ **Modifier** (vert) : Éditer mission
  - ❌ **Annuler** (rouge) : Si PLANIFIE uniquement

#### **4. Sous-onglet "Techniciens"**
- Table complète tous techniciens
- Colonnes : Nom, Entreprise, Contact, Statut, Missions actives
- Actions : Éditer, Assigner mission

#### **5. Sous-onglet "Sous-Traitants"**
- Cartes entreprises avec détails
- Affichage : Nb techniciens, nb missions, contact
- Actions : Éditer

#### **6. Sous-onglet "Calendrier"**
- Placeholder pour développement futur
- Vue jour/semaine/mois
- Drag & drop missions

---

## 📄 Document Ordre de Mission

### **Contenu Généré**

#### En-tête
```
📋 ORDRE DE MISSION
Mission GIRASOLE 2025 - Diagnostic Photovoltaïque
Ordre n°0001 - Créé le 20/01/2025
```

#### Section 1 : Centrale
- Nom installation
- Type (SOL/TOITURE)
- Puissance installée (kWc)
- Localisation complète

#### Section 2 : Technicien
- Nom complet
- Entreprise sous-traitante
- Email et téléphone

#### Section 3 : Planification
- Date mission (format long)
- Heure début
- Durée estimée
- Statut
- Commentaires

#### Section 4 : Checklist V4 (54 points)

**📄 DOCUMENTATION (8 pts)**
- Plaques signalétiques modules
- Plaque onduleur(s)
- Schéma électrique unifilaire
- Plan implantation modules
- Attestation Consuel
- Contrat de raccordement
- Garanties constructeurs
- Rapports maintenance existants

**⚡ CONTRÔLES ÉLECTRIQUES (12 pts)**
- Tension Voc à vide (strings)
- Courant Isc court-circuit
- Courbes I-V production
- Courbes I-V sombres
- Test isolement (≥1 MΩ)
- Continuité terre/masses
- Polarité connexions DC
- Serrage bornes (couple)
- État connecteurs MC4
- Protection surtensions
- Fonctionnement onduleur(s)
- Production instantanée

**🔌 TABLEAUX & PROTECTIONS (8 pts)**
- État tableau AC
- État tableau DC (boîtes jonction)
- Calibrage disjoncteurs
- Parafoudres opérationnels
- Étiquetage circuits
- Ventilation locaux techniques
- Signalétique sécurité
- Accès/consignation

**🔧 CÂBLAGE & CHEMINEMENTS (7 pts)**
- État câbles DC (UV, rongeurs)
- Fixations chemins câbles
- Passages traversées étanches
- Rayon courbure respecté
- Protection mécanique adéquate
- Tranchées/enterrés conformes
- Distance sécurité respectée

**☀️ MODULES PHOTOVOLTAÏQUES (10 pts)**
- Inspection visuelle (fissures, délamination)
- Encrassement/salissures
- Points chauds (si thermographie)
- Diodes bypass fonctionnelles
- Boîtiers jonction modules
- État cadres/joints
- Fixations/clips
- Mise à la terre modules
- Ombrage(s) identifié(s)
- Homogénéité installation

**🏗️ STRUCTURES & ANCRAGE (5 pts)**
- Corrosion structures
- Boulonnerie/serrage
- Niveau/alignement
- Ancrage toiture/sol
- Drainage eaux pluviales

**🏠 SUPPORT TOITURE (4 pts)**
- État couverture (tuiles, bac acier)
- Étanchéité traversées
- Charpente/structure porteuse
- Infiltrations eau

#### Section 5 : QR Code
- Image QR Code avec données mission
- Mission ID formaté
- Scannable terrain

#### Footer
- Branding Diagnostic Photovoltaïque
- Coordinateur Mission GIRASOLE
- Date génération

### **Format & Style**
- **Taille** : A4 (21cm largeur max)
- **Marges** : 1cm toutes pages
- **Police** : Segoe UI (14-16px corps)
- **Couleurs** : Bleu #2563eb (mission), Vert (validé), Orange (attente)
- **Impression** : Bouton masqué auto, Ctrl+P pour PDF

---

## 🔄 Workflow Complet

### **Étape 1 : Créer Sous-Traitants**

1. Onglet Planning
2. Bouton "🏢 Ajouter Sous-Traitant"
3. Remplir formulaire :
   - Nom entreprise*
   - Contact principal
   - Téléphone
   - Email
   - Adresse
   - SIRET
4. Enregistrer

**Exemple** :
```
Nom: "DiagPV Aquitaine"
Contact: "Pierre Martin"
Tel: "+33 6 12 34 56 78"
Email: "contact@diagpv-aquitaine.fr"
```

### **Étape 2 : Ajouter Techniciens**

1. Bouton "👤 Ajouter Technicien"
2. Sélectionner sous-traitant (liste déroulante)
3. Remplir :
   - Prénom*
   - Nom*
   - Email
   - Téléphone
4. Enregistrer

**Le technicien apparaît** :
- Statut "DISPONIBLE" par défaut
- Rattaché à l'entreprise
- 0 missions actives

### **Étape 3 : Créer Ordre de Mission**

1. Bouton "📋 Créer Ordre de Mission"
2. Formulaire modal :
   - **Centrale*** : Sélection parmi 51 disponibles
   - **Sous-Traitant*** : Choix entreprise
   - **Technicien*** : Auto-filtré par sous-traitant
   - **Date mission*** : Calendrier
   - **Heure début** : 08:00 par défaut
   - **Durée estimée** : 7.0h par défaut
   - **Commentaires** : Optionnel
3. Valider

**Système fait automatiquement** :
- Vérifie centrale pas déjà attribuée
- Crée ordre de mission (statut PLANIFIE)
- Crée événement planning
- **Met à jour centrale** : A_AUDITER → EN_COURS
- Mise à jour stats dashboard

### **Étape 4 : Générer PDF Ordre**

1. Sous-onglet "Ordres de Mission"
2. Trouver mission dans liste PLANIFIE
3. Clic bouton 📄 (PDF) bleu
4. Nouvelle fenêtre avec document HTML
5. **Ctrl+P** (ou bouton en haut à droite)
6. Choisir "Enregistrer au format PDF"
7. Nom suggéré : `OM-0001-Antunez-Jean-Dupont.pdf`

### **Étape 5 : Envoyer au Technicien**

1. Email au technicien avec PDF attaché
2. Objet : "Mission GIRASOLE - Centrale Antunez - 25/01/2025"
3. Technicien imprime document
4. Technicien va sur terrain avec checklist papier

### **Étape 6 : Audit Terrain**

1. Technicien remplit checklist manuellement
2. Coche les cases au fur et à mesure
3. Prend photos selon catégories V4
4. Scanne QR Code si besoin infos rapides

### **Étape 7 : Retour JSON**

1. Technicien exporte JSON V4 depuis app terrain
2. Upload via onglet "Upload JSON" (déjà existant)
3. **Système met à jour automatiquement** :
   - Statut mission : PLANIFIE → TERMINE
   - Statut centrale : EN_COURS → TERMINE

### **Étape 8 : Validation Adrien**

1. Onglet Planning → Ordres de Mission
2. Mission apparaît dans section TERMINE
3. Vérification retour JSON
4. Clic bouton ✏️ Modifier statut
5. Changer statut : TERMINE → VALIDE
6. **Système met à jour** :
   - Statut mission : VALIDE
   - Statut centrale : VALIDE
   - Date validation enregistrée

---

## 📊 Scénarios d'Usage

### **Scénario 1 : Mission Simple**

**Contexte** : Centrale "Antunez" → Technicien Jean Dupont → 25/01/2025

```
1. Créer ordre mission (2 min)
2. Générer PDF (30 sec)
3. Envoyer email technicien (1 min)
4. Audit terrain (7h)
5. Upload retour JSON (5 min)
6. Validation Adrien (10 min)
Total: 7h20 environ
```

### **Scénario 2 : Attribution Massive**

**Contexte** : Attribuer 52 centrales à 4 techniciens sur 3 semaines

**Stratégie** :
- Semaine 1 : 20 centrales (5 par technicien)
- Semaine 2 : 20 centrales
- Semaine 3 : 12 centrales

**Process** :
1. Créer tous ordres mission en batch (1h)
2. Générer tous PDF (30 min)
3. Envoyer emails groupés techniciens (30 min)
4. Suivi quotidien statuts missions
5. Validation au fil de l'eau

### **Scénario 3 : Annulation Mission**

**Contexte** : Météo défavorable, centrale "Azemar" reportée

```
1. Onglet Planning → Ordres de Mission
2. Trouver mission "Azemar" (PLANIFIE)
3. Clic bouton ❌ Annuler (rouge)
4. Confirmer annulation
5. Système fait :
   - Statut mission : ANNULE
   - Centrale redevient disponible (A_AUDITER)
   - Stats mises à jour
6. Créer nouvelle mission avec nouvelle date
```

### **Scénario 4 : Remplacement Technicien**

**Contexte** : Jean Dupont malade, remplacer par Sophie Lambert

```
1. Option A (Annuler + Recréer) :
   - Annuler mission Jean Dupont
   - Créer nouvelle mission Sophie Lambert
   - Générer nouveau PDF
   
2. Option B (Modifier - future feature) :
   - Éditer mission existante
   - Changer technicien_id
   - Régénérer PDF
```

---

## 🔧 Configuration & Personnalisation

### **Durées Estimées par Type**

```javascript
// Configurable dans code frontend
const DUREES_ESTIMEES = {
  'SOL': 6.5,           // 6h30 terrain
  'TOITURE': 8.0,       // 8h terrain
  'SOL_COMPLEXE': 9.0   // Si > 500 kWc
}
```

### **Statuts Mission Disponibles**

```javascript
const STATUTS_MISSION = {
  PLANIFIE: {
    label: 'Planifié',
    color: '#3b82f6', // Bleu
    icon: '📅',
    editable: true,
    cancelable: true
  },
  CONFIRME: {
    label: 'Confirmé',
    color: '#10b981', // Vert
    icon: '✅',
    editable: true,
    cancelable: false
  },
  EN_COURS: {
    label: 'En Cours',
    color: '#f59e0b', // Orange
    icon: '⚡',
    editable: false,
    cancelable: false
  },
  TERMINE: {
    label: 'Terminé',
    color: '#8b5cf6', // Violet
    icon: '🏁',
    editable: false,
    cancelable: false
  },
  VALIDE: {
    label: 'Validé',
    color: '#6b7280', // Gris
    icon: '⭐',
    editable: false,
    cancelable: false
  },
  ANNULE: {
    label: 'Annulé',
    color: '#ef4444', // Rouge
    icon: '❌',
    editable: false,
    cancelable: false
  },
  REPORTE: {
    label: 'Reporté',
    color: '#f97316', // Orange foncé
    icon: '🔄',
    editable: true,
    cancelable: true
  }
}
```

### **Email Templates (future)**

```javascript
// Template email technicien
const EMAIL_TEMPLATE = {
  subject: "Mission GIRASOLE - ${centrale_nom} - ${date_mission}",
  body: `
Bonjour ${technicien_prenom},

Nouvelle mission d'audit photovoltaïque :

📍 Centrale : ${centrale_nom}
📅 Date : ${date_mission_formatted}
⏰ Heure : ${heure_debut}
⏱️ Durée estimée : ${duree_estimee_heures}h
📍 Adresse : ${localisation}

Veuillez trouver en pièce jointe l'ordre de mission complet avec checklist V4.

Cordialement,
Coordinateur Mission GIRASOLE
Diagnostic Photovoltaïque
  `
}
```

---

## 📈 KPI & Reporting

### **Métriques Suivies**

#### Centrales
- Total : 52
- Non attribuées : 51
- En cours : 1
- Terminées : 0
- Validées : 0

#### Missions
- Planifiées : 1
- Confirmées : 0
- En cours : 0
- Terminées : 0
- Validées : 0
- Annulées : 0

#### Techniciens
- Total : 4
- Disponibles : 4
- Occupés : 0
- Indisponibles : 0

#### Sous-Traitants
- Actifs : 2
- Missions attribuées : 1
- Charge moyenne : 0.5 mission/entreprise

### **Export Données (future)**

```bash
# Export CSV planning complet
GET /api/export/planning.csv

# Export Excel suivi missions
GET /api/export/missions.xlsx

# Export iCal calendrier techniciens
GET /api/export/planning.ics
```

---

## 🐛 Troubleshooting

### **Problème : Centrale déjà attribuée**

**Erreur** : "Cette centrale a déjà un ordre de mission actif"

**Cause** : Une centrale ne peut avoir qu'un seul ordre actif

**Solution** :
1. Vérifier ordres existants pour cette centrale
2. Si ancien ordre : Annuler ou Valider
3. Recréer nouvel ordre

### **Problème : Technicien non disponible**

**Symptôme** : Technicien n'apparaît pas dans liste déroulante

**Causes possibles** :
- Statut technicien = INDISPONIBLE
- Technicien supprimé
- Mauvais sous-traitant sélectionné

**Solution** :
1. Vérifier statut technicien (onglet Techniciens)
2. Changer statut → DISPONIBLE si besoin
3. Vérifier filtrage par sous-traitant correct

### **Problème : PDF ne se génère pas**

**Symptôme** : Erreur 404 ou page blanche

**Causes** :
- Ordre de mission inexistant (ID invalide)
- Problème base de données
- Service wrangler arrêté

**Solution** :
1. Vérifier ID ordre mission existe : `curl /api/ordres-mission`
2. Vérifier service PM2 : `pm2 list`
3. Restart si nécessaire : `pm2 restart girasole-webapp`

### **Problème : Stats planning incorrectes**

**Symptôme** : Chiffres dashboard incohérents

**Cause** : Cache ou état transitoire

**Solution** :
1. Rafraîchir page (F5)
2. Vérifier données sources : `curl /api/stats/planning`
3. Si persistant : Rebuild projet

---

## 🚀 Roadmap Améliorations

### **Phase 1 : Fonctionnel (✅ Terminé)**
- ✅ Gestion sous-traitants
- ✅ Gestion techniciens
- ✅ Attribution missions
- ✅ Génération PDF ordres
- ✅ Checklist V4 complète
- ✅ QR Codes missions
- ✅ Stats dashboard

### **Phase 2 : UX Enhanced (En cours)**
- 🔄 Vue calendrier interactive
- 🔄 Drag & drop missions
- 🔄 Détection conflits dates
- 🔄 Notifications temps réel
- 🔄 Édition inline missions

### **Phase 3 : Automatisation**
- ⏳ Email automatique techniciens
- ⏳ Rappels J-1 avant mission
- ⏳ Suivi GPS terrain (optionnel)
- ⏳ Upload photos direct terrain
- ⏳ Signature électronique ordres

### **Phase 4 : Analytics**
- ⏳ Rapports hebdomadaires
- ⏳ Performances techniciens
- ⏳ Temps moyens par centrale
- ⏳ Prévisions complétion
- ⏳ Export comptabilité

---

## 📞 Support & Contact

**Projet** : GIRASOLE 2025 - Mission 52 Centrales Photovoltaïques  
**Responsable** : Coordinateur Mission GIRASOLE  
**Entreprise** : Diagnostic Photovoltaïque  
**GitHub** : https://github.com/pappalardoadrien-design/Girasole25  

**URLs Production** :
- Interface : https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev
- Planning : https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev (onglet Planning)

---

**Version** : 2.0.0  
**Date** : 20 Janvier 2025  
**Status** : ✅ Production Ready

---

© 2025 Diagnostic Photovoltaïque - Tous droits réservés
