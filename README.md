# 🌞 GIRASOLE 2025 - Interface Web Professionnelle

Interface web professionnelle pour la gestion de la mission GIRASOLE 2025 : audit de 52 centrales photovoltaïques (toutes classées SOL car audits toiture incluent systématiquement installations au sol).

## 🎯 Objectifs du Projet

- **Gestion centralisée** des 52 centrales photovoltaïques
- **Suivi en temps réel** de l'avancement des audits
- **Dashboard statistiques** avec visualisations Chart.js
- **Upload et validation** des retours JSON V4 techniciens
- **Monitoring volumétrie** et backup automatisés

## 🚀 URLs et Accès

### **Environnement de Production**
- **🔗 URL FIXE PRINCIPALE** (à communiquer aux sous-traitants) : **https://girasole-diagpv.pages.dev**
- **Dashboard**: https://girasole-diagpv.pages.dev/
- **Audit Mission :id**: https://girasole-diagpv.pages.dev/audit/:mission_id
- **API Checklist SOL**: https://girasole-diagpv.pages.dev/api/checklist/:mission_id
- **API Checklist TOITURE (14 items)**: https://girasole-diagpv.pages.dev/api/checklist-toiture/:mission_id
- **Rapports HTML**: https://girasole-diagpv.pages.dev/rapport/:rapport_id
- **Status**: ✅ Opérationnel (Cloudflare Pages)
- **Note**: Cette URL est **stable** et ne change jamais, idéale pour les sous-traitants

### **Dernière mise à jour**
- **Date**: 27/11/2024 17:00 CET
- **Version: 2.4 (27/11/2024)
- **Migrations**: 0014_ajout_statut_na.sql, 0015_fix_statut_na_toiture.sql
- **Bug fix**: Bouton "N/A" fonctionne maintenant (CHECK constraint corrigée)
- **URL STABLE**: https://girasole-diagpv.pages.dev (ne change plus)

### **Repository GitHub**
- **URL**: https://github.com/pappalardoadrien-design/Girasole25
- **Branche principale**: main
- **GitHub Pages**: https://pappalardoadrien-design.github.io/Girasole25/

### **Cloudflare Pages (Production)**
- **URL Production**: À déployer
- **Status**: ⏳ En attente déploiement

## 📊 Fonctionnalités Principales

### 1. **Planning Manager** 📅 **[NOUVEAU v2.0 - CHECKLIST AUTO]**
**URL** : `/planning-manager`

Interface complète pour attribution et planification des 52 centrales GIRASOLE avec **initialisation automatique checklist 54 points** :

#### **Affichage Planning Complet**
- ✅ Tableau des 52 centrales triées par distance (plus proche = Lyon/Toulouse)
- ✅ Colonnes : ID, Nom, Type, Puissance, Localisation, Distance (km), Département, Sous-traitant, Technicien, Date mission, **Checklist**, Statut
- ✅ **Colonne Checklist** : Badge visuel vert "✓ 54/54" (PRET) / jaune (PARTIEL) / gris (NON_INIT)
- ✅ Statut visuel : ligne verte si attribuée
- ✅ Statistiques temps réel : Total (52) / Attribués / Non attribués / Planifiés (X ✓ = avec checklist)

#### **Attribution Manuelle avec Auto-Save + Checklist** ⚡
- ✅ Dropdowns inline pour Sous-traitant et Technicien
- ✅ Input date pour Date de mission
- ✅ **Auto-save automatique** quand les 3 champs sont remplis
- ✅ **Checklist 54 points créée automatiquement** (7 catégories : DOC, ELEC, TABLEAUX, CABLAGE, MODULES, STRUCTURES, TOITURE)
- ✅ **Flash vert visuel** (1 seconde) + message "Sauvegardé + Checklist 54 points créée !"
- ✅ **Badge vert "✓ 54/54"** apparaît instantanément
- ✅ API : `POST /api/planning/save-attribution` (retourne `checklist_initialized: true`)

#### **Checklist 54 Points Normée** ✅
- ✅ Initialisée automatiquement lors de l'attribution
- ✅ 7 catégories : DOC (8), ELEC (12), TABLEAUX (8), CABLAGE (7), MODULES (10), STRUCTURES (5), TOITURE (4)
- ✅ Conforme normes IEC 62446-1
- ✅ Interface mobile audit : `/audit/:mission_id`
- ✅ Capture photos intégrée (base64)
- ✅ Auto-save temps réel terrain
- ✅ API : `GET /api/checklist/:mission_id`, `PUT /api/checklist/:id`

#### **Génération Ordres de Mission** 🎯
- ✅ **Bouton orange "Générer ordres de mission"** dans header (OPTIONNEL depuis v2.0)
- ✅ Génère/confirme tous les ordres pour centrales attribuées
- ✅ Dialog confirmation avant exécution
- ✅ Stats détaillées : Total traités / Créés / Mis à jour / Erreurs
- ✅ API : `POST /api/planning/generate-all-missions`

#### **Export Excel/CSV** 📊
- ✅ **Bouton vert "Export Excel"** dans header
- ✅ Télécharge CSV avec toutes données : Centrale, ST (nom+contact), Technicien (nom+tél), dates, distances, **statut checklist**
- ✅ Format UTF-8 avec BOM pour Excel
- ✅ Nom fichier : `planning_girasole_YYYY-MM-DD.csv`
- ✅ API : `GET /api/planning/export-data`

### 2. **Dashboard Mission** 📈
- Vue d'ensemble 48 centrales (toutes type SOL)
- Statistiques temps réel : Total / Auditées / Validées / Photos
- Graphiques interactifs (Chart.js) : Répartition par statut
- Monitoring volumétrie (JSON, Photos, Heures terrain)

### 3. **Gestion Centrales** 📋
- Liste complète des 48 centrales avec filtres
- Changement de statut : À Auditer → En Cours → Terminé → Validé
- Détails par centrale : Retours JSON, photos, timeline
- Recherche par nom, localisation et statut

### 4. **Upload Retours JSON V4** 📥
- Formulaire d'enregistrement métadonnées retours techniciens
- Validation : Nom fichier, taille MB, nombre photos, technicien
- Mise à jour automatique statut centrale
- Historique complet des retours

### 5. **Documentation Intégrée** 📚
- Checklist V4 (54 points CDC)
- Workflow 5 phases détaillé
- Tableau volumétrie mission complète
- Stratégie backup 3-2-1
- Timeline estimée (360h terrain)

## 🗄️ Architecture Base de Données

### **Cloudflare D1 SQLite**
- **centrales** : 52 centrales avec GPS, distances, statuts, puissance
- **ordres_mission** : Missions planifiées avec ST, technicien, dates
- **sous_traitants** : Liste des sous-traitants avec contacts
- **techniciens** : Liste des techniciens avec coordonnées
- **checklist_items** : 54 points checklist par mission (photo_base64, statut, conformité)
- **audit_photos** : Métadonnées photos audit (GPS, timestamps)
- **retours_json** : Métadonnées retours techniciens (nom fichier, taille, photos)
- **stats_mission** : Historique statistiques globales

### **Schema Principal**
```sql
centrales (48 rows) - Source: ANNEXE 1 Excel
├── Données GPS : latitude, longitude, distance_toulouse_km, distance_lyon_km
├── Métadonnées : id_ref, nom, type (SOL), puissance_kwc, localisation, dept
└── Statuts : A_AUDITER → EN_COURS → PLANIFIE → TERMINE

ordres_mission (missions planifiées)
├── FK centrale_id → centrales(id)
├── FK sous_traitant_id → sous_traitants(id)
├── FK technicien_id → techniciens(id)
└── date_mission, heure_debut, duree_estimee_heures, statut

sous_traitants (2 rows test)
└── nom_entreprise, contact_principal, telephone, email

techniciens (3 rows test)
└── prenom, nom, telephone, email
```

### **52 Centrales Complètes** ✅
L'Excel ANNEXE 1 v4 contient **52 centrales uniques** :
- ✅ 52 centrales chargées dans la base (noms dédoublonnés avec suffix ID)
- ✅ 47 centrales avec GPS (distances calculées Toulouse/Lyon via Haversine)
- ✅ 5 centrales sans GPS (affichées en fin de liste)
- ✅ 3 types supportés : SOL, TOITURE, OMBRIERE
- ✅ Toutes centrales affichées dans Planning Manager avec checklist auto

## 📦 Volumétrie Mission 52 Centrales

| Type Fichier | Taille Unitaire | 52 Centrales | Total |
|--------------|-----------------|--------------|-------|
| **JSON V4** | 18 MB | 52 | **~1 GB** |
| **Photos JPEG** | 150 MB | 52 | **7.8 GB** |
| **Rapports PDF** | 1.8 MB | 52 | **94 MB** |
| **TOTAL MISSION** | - | - | **~9.0 GB** |

## 🛠️ Stack Technique

### **Backend**
- **Hono** v4.7 - Framework web ultra-léger pour Cloudflare Workers
- **Cloudflare D1** - Base de données SQLite distribuée globalement
- **Wrangler** v3.97 - CLI Cloudflare pour développement et déploiement

### **Frontend**
- **TailwindCSS** (CDN) - Framework CSS utility-first
- **Chart.js** (CDN) - Visualisations graphiques interactives
- **FontAwesome** (CDN) - Icônes professionnelles
- **Axios** (CDN) - Client HTTP pour appels API

### **DevOps**
- **PM2** - Process manager pour développement sandbox
- **Vite** - Build tool et bundler moderne
- **TypeScript** - Type safety et meilleure DX

## 📂 Structure Projet

```
webapp/
├── src/
│   └── index.tsx              # Application Hono principale + API routes
├── public/
│   └── static/
│       ├── app.js             # Frontend JavaScript (dashboard, API calls)
│       └── styles.css         # Custom CSS styles
├── migrations/
│   └── 0001_init_centrales_reelles.sql   # Migration D1 avec 52 centrales réelles
├── dist/                      # Build output (généré par Vite)
├── .wrangler/                 # Wrangler state (D1 local, cache)
├── ecosystem.config.cjs       # Configuration PM2
├── vite.config.ts             # Configuration Vite + Cloudflare Pages
├── wrangler.jsonc             # Configuration Cloudflare (D1, compatibility)
├── tsconfig.json              # Configuration TypeScript
├── package.json               # Dependencies et scripts npm
├── .gitignore                 # Git ignore rules
└── README.md                  # Cette documentation
```

## 🚀 Installation et Développement

### **Prérequis**
- Node.js v18+
- npm v9+
- PM2 (pré-installé en sandbox)
- Wrangler CLI

### **Installation**
```bash
cd /home/user/webapp
npm install
```

### **Développement Local (Sandbox)**
```bash
# 1. Build le projet
npm run build

# 2. Créer/migrer la base de données locale
npm run db:migrate:local

# 3. Démarrer avec PM2
pm2 start ecosystem.config.cjs

# 4. Tester l'API
curl http://localhost:3000/api/stats

# 5. Obtenir URL publique
# Utiliser GetServiceUrl(port=3000)
```

### **Gestion PM2**
```bash
pm2 list                        # Liste services actifs
pm2 logs girasole-webapp --nostream  # Logs sans blocking
pm2 restart girasole-webapp     # Redémarrer
pm2 delete girasole-webapp      # Supprimer
pm2 monit                       # Monitoring temps réel
```

### **Database Management**
```bash
# Local development
npm run db:migrate:local        # Appliquer migrations en local
npm run db:console:local        # Console SQL locale

# Production (après déploiement)
npm run db:migrate:prod         # Appliquer migrations production
npm run db:console:prod         # Console SQL production
```

## 📡 API Endpoints

### **Planning Manager** 🆕
- `GET /api/planning/full` - Planning complet 52 centrales avec attributions + statut checklist
- `POST /api/planning/save-attribution` - Sauvegarder attribution + **init checklist 54 points auto**
- `POST /api/planning/generate-all-missions` - Générer/confirmer tous ordres de mission
- `GET /api/planning/export-data` - Export données complètes pour Excel/CSV

### **Checklist Audit Terrain** 🆕
- `POST /api/checklist/:mission_id/init` - Initialiser 54 points checklist (automatique depuis v2.0)
- `GET /api/checklist/:mission_id` - Récupérer checklist complète mission
- `PUT /api/checklist/:id` - Mettre à jour item checklist (statut, photo_base64, commentaire)
- `GET /audit/:mission_id` - Interface mobile PWA audit technicien

### **Sous-Traitants & Techniciens**
- `GET /api/sous-traitants` - Liste sous-traitants avec contacts
- `GET /api/techniciens` - Liste techniciens avec coordonnées

### **Centrales**
- `GET /api/centrales` - Liste toutes les centrales (avec statistiques)
- `GET /api/centrales/:id` - Détails centrale + retours JSON
- `POST /api/centrales` - Créer nouvelle centrale
- `PUT /api/centrales/:id/statut` - Mettre à jour statut

### **Retours JSON**
- `POST /api/retours` - Enregistrer métadonnées retour JSON V4

### **Statistiques**
- `GET /api/stats` - Statistiques mission globales
- `GET /api/stats/progression` - Progression temporelle (30 derniers jours)

### **Exemples Requêtes**

```bash
# Planning Manager - Obtenir planning complet
curl http://localhost:3000/api/planning/full | jq

# Planning Manager - Attribuer centrale
curl -X POST http://localhost:3000/api/planning/save-attribution \
  -H "Content-Type: application/json" \
  -d '{
    "centrale_id": 38,
    "sous_traitant_id": 1,
    "technicien_id": 1,
    "date_mission": "2025-12-01"
  }'

# Planning Manager - Générer ordres de mission
curl -X POST http://localhost:3000/api/planning/generate-all-missions | jq

# Planning Manager - Export données
curl http://localhost:3000/api/planning/export-data | jq

# Obtenir statistiques
curl http://localhost:3000/api/stats

# Lister centrales SOL
curl http://localhost:3000/api/centrales | jq '.data[] | select(.type=="SOL")'

# Enregistrer retour JSON
curl -X POST http://localhost:3000/api/retours \
  -H "Content-Type: application/json" \
  -d '{
    "centrale_id": 1,
    "nom_fichier": "SOL_01_2025-01-20_versionV4.json",
    "taille_mo": 18.5,
    "nombre_photos": 45,
    "technicien": "Jean Dupont"
  }'

# Changer statut centrale
curl -X PUT http://localhost:3000/api/centrales/1/statut \
  -H "Content-Type: application/json" \
  -d '{"statut": "EN_COURS"}'
```

## 🔒 Stratégie Backup & Sécurité

### **Backup 3-2-1**
- ✅ **3 copies** : Original + Backup local + Cloud/USB
- ✅ **2 médias** : Disque interne + Externe (USB/Google Drive)
- ✅ **1 offsite** : Synchronisation cloud automatique

### **Rétention Données**
- **JSON V4** : 5 ans (1825 jours)
- **Photos** : 2 ans (730 jours)
- **Rapports PDF** : Permanent

### **Automatisation**
- Backup quotidien : 2h00 (rotation 7 jours)
- Monitoring espace : Toutes les 6h
- Archivage mensuel : 1er du mois à 3h00

## 📅 Timeline Mission

### **Par Centrale**
- **SOL** (52) : 6h30-8h10 terrain + traitement selon configuration (toiture+sol ou sol uniquement)

### **Mission Complète**
- **360 heures** terrain avec 2-3 techniciens
- **Durée estimée** : 3-4 semaines intensives
- **Livraison** : Rapports PDF < 5 jours après validation

## 🔄 Workflow 5 Phases

1. **Préparation** : Génération checklist HTML vierge → Envoi technicien
2. **Audit Terrain** : Remplissage smartphone + photos (6h30 SOL, 8h10 TOITURE)
3. **Retour/Validation** : Export JSON V4 → Envoi Adrien → Vérification
4. **Traitement** : Extraction photos JPEG + Analyse données
5. **Livraison** : Génération rapport PDF + Envoi client (< 5 jours)

## 📝 Scripts NPM Disponibles

```bash
# Développement
npm run dev                   # Vite dev server
npm run dev:sandbox           # Wrangler pages dev (sans D1)
npm run dev:d1                # Wrangler pages dev (avec D1 local)

# Build & Deploy
npm run build                 # Build production avec Vite
npm run deploy                # Build + Deploy Cloudflare Pages
npm run deploy:prod           # Build + Deploy avec nom projet

# Database
npm run db:migrate:local      # Migrations D1 local
npm run db:migrate:prod       # Migrations D1 production
npm run db:console:local      # Console SQL locale
npm run db:console:prod       # Console SQL production

# Maintenance
npm run clean-port            # Libérer port 3000
npm run test                  # Test endpoint localhost
npm run cf-typegen            # Générer types Cloudflare

# Git
npm run git:init              # Init + commit initial
npm run git:commit            # Git add + commit rapide
npm run git:status            # Git status
npm run git:log               # Git log compact
```

## 🌐 Déploiement Cloudflare Pages

### **Étape 1 : Créer Database D1 Production**
```bash
# Créer database production
npx wrangler d1 create girasole-db-production

# Copier le database_id dans wrangler.jsonc
# Appliquer migrations
npm run db:migrate:prod
```

### **Étape 2 : Créer Projet Cloudflare Pages**
```bash
npx wrangler pages project create girasole-webapp \
  --production-branch main \
  --compatibility-date 2024-01-01
```

### **Étape 3 : Déployer**
```bash
npm run deploy:prod
```

### **URLs après Déploiement**
- Production : `https://girasole-webapp.pages.dev`
- Branche : `https://main.girasole-webapp.pages.dev`

## ✅ Tests et Validation

### **Tests Effectués**

#### **Planning Manager (Priorité 1)** ✅
- ✅ API `/api/planning/full` : 48 centrales avec distances GPS
- ✅ API `/api/planning/save-attribution` : Auto-save attribution testée (IDs 38, 50, 4)
- ✅ API `/api/planning/generate-all-missions` : Génération 3 ordres confirmée
- ✅ API `/api/planning/export-data` : Export CSV complet fonctionnel
- ✅ Frontend : Bouton "Générer ordres de mission" (orange) ajouté
- ✅ Frontend : Bouton "Export Excel" (vert) fonctionnel
- ✅ Frontend : Auto-save inline avec flash vert validé
- ✅ Workflow complet : Attribution → Génération → Export ✅

#### **Dashboard & Centrales**
- ✅ API `/api/stats` : 48 centrales SOL validées (Excel source = 48 uniques)
- ✅ API `/api/centrales` : Liste complète avec données ANNEXE 1
- ✅ Dashboard frontend : Charts + statistiques
- ✅ Upload form : Enregistrement retours JSON
- ✅ Database D1 locale : Migrations appliquées avec 48 centrales + GPS
- ✅ PM2 process : Serveur stable et accessible
- ✅ GitHub sync : Code pushé avec Planning Manager

### **Statut Final**
- **Sandbox** : ✅ 100% Opérationnel (Planning Manager prêt livraison GIRASOLE)
- **GitHub** : ✅ Synchronisé avec dernières fonctionnalités
- **Production** : ⏳ Prêt pour déploiement Cloudflare Pages

### **URL Planning Manager (PRIORITÉ GIRASOLE)** 🚨
🔗 **https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/planning-manager**

**Workflow Livraison GIRASOLE v2.0 (SIMPLIFIÉ)** :
1. Ouvrir Planning Manager
2. Assigner 52 centrales (ST + Technicien + Date)
   - ✅ **Checklist 54 points créée automatiquement**
   - ✅ Badge vert "✓ 54/54" confirme instantanément
3. ~~Cliquer "Générer ordres de mission"~~ → **AUTOMATIQUE depuis v2.0** ✨
4. Cliquer "Export Excel" (vert) → Télécharger CSV avec statut checklist
5. Envoyer fichier CSV à GIRASOLE avant 14h00

**Gain v2.0** : 0 clic supplémentaire, checklist auto-attribuée !

## 👨‍💼 Contact et Support

**Projet** : GIRASOLE 2025 - Mission 52 Centrales Photovoltaïques  
**Responsable** : Adrien Pappalardo - Diagnostic Photovoltaïque  
**GitHub** : https://github.com/pappalardoadrien-design/Girasole25  
**Documentation** : Voir dossier `/home/user/` pour guides complets

---

## 📄 Licence

© 2025 Diagnostic Photovoltaïque - Adrien Pappalardo  
Tous droits réservés - Usage interne mission GIRASOLE 2025
