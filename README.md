# 🌞 GIRASOLE 2025 - Interface Web Professionnelle

Interface web professionnelle pour la gestion de la mission GIRASOLE 2025 : audit de 52 centrales photovoltaïques (39 SOL + 13 TOITURE).

## 🎯 Objectifs du Projet

- **Gestion centralisée** des 52 centrales photovoltaïques
- **Suivi en temps réel** de l'avancement des audits
- **Dashboard statistiques** avec visualisations Chart.js
- **Upload et validation** des retours JSON V4 techniciens
- **Monitoring volumétrie** et backup automatisés

## 🚀 URLs et Accès

### **Environnement de Développement (Sandbox)**
- **Interface Web**: https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev
- **API Health**: https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/api/stats
- **Status**: ✅ Opérationnel

### **Repository GitHub**
- **URL**: https://github.com/pappalardoadrien-design/Girasole25
- **Branche principale**: main
- **GitHub Pages**: https://pappalardoadrien-design.github.io/Girasole25/

### **Cloudflare Pages (Production)**
- **URL Production**: À déployer
- **Status**: ⏳ En attente déploiement

## 📊 Fonctionnalités Principales

### 1. **Dashboard Mission** 📈
- Vue d'ensemble 52 centrales (SOL + TOITURE)
- Statistiques temps réel : Total / Auditées / Validées / Photos
- Graphiques interactifs (Chart.js) : Répartition par statut et type
- Monitoring volumétrie (JSON, Photos, Heures terrain)

### 2. **Gestion Centrales** 📋
- Liste complète des 52 centrales avec filtres
- Changement de statut : À Auditer → En Cours → Terminé → Validé
- Détails par centrale : Retours JSON, photos, timeline
- Recherche par type (SOL/TOITURE) et statut

### 3. **Upload Retours JSON V4** 📥
- Formulaire d'enregistrement métadonnées retours techniciens
- Validation : Nom fichier, taille MB, nombre photos, technicien
- Mise à jour automatique statut centrale
- Historique complet des retours

### 4. **Documentation Intégrée** 📚
- Checklist V4 (54 points CDC)
- Workflow 5 phases détaillé
- Tableau volumétrie mission complète
- Stratégie backup 3-2-1
- Timeline estimée (360h terrain)

## 🗄️ Architecture Base de Données

### **Cloudflare D1 SQLite**
- **centrales** : 52 centrales avec statuts, types, puissance, dates
- **retours_json** : Métadonnées retours techniciens (nom fichier, taille, photos)
- **stats_mission** : Historique statistiques globales

### **Schema Principal**
```sql
centrales (52 rows)
├── SOL (39 centrales)
└── TOITURE (13 centrales)

Statuts possibles:
- A_AUDITER (initial)
- EN_COURS (audit en cours)
- TERMINE (retour JSON reçu)
- VALIDE (validation Adrien)
```

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
│   └── 0001_init_schema.sql   # Schema D1 initial (52 centrales)
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
- **SOL** (39) : 6h30 terrain + traitement
- **TOITURE** (13) : 8h10 terrain + traitement

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
- ✅ API `/api/stats` : 52 centrales, 39 SOL, 13 TOITURE
- ✅ API `/api/centrales` : Liste complète avec filtres
- ✅ Dashboard frontend : Charts + statistiques
- ✅ Upload form : Enregistrement retours JSON
- ✅ Database D1 locale : Migrations appliquées
- ✅ PM2 process : Serveur stable et accessible
- ✅ GitHub sync : Code pushé avec succès

### **Statut Final**
- **Sandbox** : ✅ 100% Opérationnel
- **GitHub** : ✅ Synchronisé
- **Production** : ⏳ Prêt pour déploiement

## 👨‍💼 Contact et Support

**Projet** : GIRASOLE 2025 - Mission 52 Centrales Photovoltaïques  
**Responsable** : Adrien Pappalardo - Diagnostic Photovoltaïque  
**GitHub** : https://github.com/pappalardoadrien-design/Girasole25  
**Documentation** : Voir dossier `/home/user/` pour guides complets

---

## 📄 Licence

© 2025 Diagnostic Photovoltaïque - Adrien Pappalardo  
Tous droits réservés - Usage interne mission GIRASOLE 2025
