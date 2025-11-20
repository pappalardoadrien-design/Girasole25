# 🚀 GUIDE DÉPLOIEMENT GITHUB PAGES - CHECKLISTS GIRASOLE 2025

**Diagnostic Photovoltaïque - Mission GIRASOLE 2025**  
**Temps de déploiement: 5 minutes**  
**Plateforme: GitHub Pages (gratuit, HTTPS, sans serveur)**

---

## 📋 PRÉREQUIS

✅ Compte GitHub (gratuit)  
✅ Package GIRASOLE_2025_PACK_COMPLET_GITHUB.zip (231 KB)  
✅ Navigateur web moderne

---

## 🎯 OBJECTIF

Déployer les 52 checklists terrain sur GitHub Pages pour:
- ✅ Accès web depuis n'importe quel appareil (PC, tablette, smartphone)
- ✅ HTTPS sécurisé automatique
- ✅ Sauvegarde automatique locale (LocalStorage)
- ✅ Photos embarquées en Base64 (pas de dépendances externes)
- ✅ Fonctionne hors-ligne après premier chargement
- ✅ URL publique partageable: `https://USERNAME.github.io/girasole-checklists/`

---

## 🚀 DÉPLOIEMENT EN 5 MINUTES

### ÉTAPE 1: Créer le dépôt GitHub (1 min)

1. **Connexion GitHub**: https://github.com
2. **Créer nouveau dépôt**:
   - Cliquer **"New repository"** (bouton vert)
   - **Nom du dépôt**: `girasole-checklists`
   - **Visibilité**: 
     - ✅ **Private** (recommandé - données client confidentielles)
     - ⚠️ Public uniquement si autorisé par GIRASOLE
   - **Options**: Ne PAS initialiser (pas de README, .gitignore, licence)
   - Cliquer **"Create repository"**

### ÉTAPE 2: Extraire et préparer les fichiers (1 min)

1. **Extraire le ZIP**:
   ```bash
   # Sur votre machine locale
   unzip GIRASOLE_2025_PACK_COMPLET_GITHUB.zip -d girasole-checklists/
   cd girasole-checklists/
   ```

2. **Structure attendue**:
   ```
   girasole-checklists/
   ├── index.html              # Page d'accueil avec liste 52 checklists
   ├── checklists/
   │   ├── 3085.html          # Checklist centrale 3085
   │   ├── 97565.html         # Checklist centrale 97565
   │   ├── ... (50 autres)
   │   └── 34481.html         # Checklist centrale 34481
   └── assets/
       ├── styles.css         # Styles personnalisés
       └── scripts.js         # Auto-save LocalStorage
   ```

### ÉTAPE 3: Initialiser Git et pousser (2 min)

1. **Initialiser dépôt Git local**:
   ```bash
   git init
   git add .
   git commit -m "🚀 Déploiement initial checklists GIRASOLE 2025"
   ```

2. **Connecter au dépôt GitHub**:
   ```bash
   # Remplacer USERNAME par votre nom d'utilisateur GitHub
   git remote add origin https://github.com/USERNAME/girasole-checklists.git
   git branch -M main
   git push -u origin main
   ```

3. **Entrer vos identifiants GitHub si demandé**

### ÉTAPE 4: Activer GitHub Pages (1 min)

1. **Aller dans paramètres du dépôt**:
   - Sur GitHub, cliquer **"Settings"** (onglet en haut)
   
2. **Activer Pages**:
   - Menu gauche → **"Pages"**
   - **Source**: Sélectionner `main` branch et `/root` folder
   - Cliquer **"Save"**
   
3. **Attendre 30 secondes** → GitHub build automatiquement

4. **URL disponible**:
   ```
   https://USERNAME.github.io/girasole-checklists/
   ```

### ÉTAPE 5: Tester l'accès (1 min)

1. **Ouvrir l'URL dans navigateur**
2. **Vérifier**:
   - ✅ Page d'accueil avec liste 52 centrales
   - ✅ Clic sur centrale → Checklist s'affiche
   - ✅ Remplir champs → Auto-save LocalStorage fonctionne
   - ✅ Bouton "Exporter JSON" génère fichier téléchargeable

---

## 🎨 FONCTIONNALITÉS CHECKLISTS WEB

### Sauvegarde Automatique (LocalStorage)

- ✅ **Auto-save chaque 5 secondes**
- ✅ **Persistance locale** (pas de serveur nécessaire)
- ✅ **Fonctionne hors-ligne** après premier chargement
- ✅ **Indicateur visuel**: "💾 Sauvegardé" en haut à droite

### Photos Embarquées (Base64)

```javascript
// Ajouter photo depuis checklist
document.getElementById('photo-input').addEventListener('change', function(e) {
  const file = e.target.files[0];
  const reader = new FileReader();
  
  reader.onload = function(event) {
    const base64Image = event.target.result;
    // Stocké directement dans LocalStorage
    localStorage.setItem('photo_GEN_001', base64Image);
  };
  
  reader.readAsDataURL(file);
});
```

### Export JSON

```javascript
// Bouton "Exporter JSON"
function exporterJSON() {
  const centraleId = document.getElementById('centrale-id').value;
  const data = {
    centrale_id: centraleId,
    date_audit: new Date().toISOString(),
    nb_photos_prises: compteurPhotos,
    observations_terrain: document.getElementById('observations').value,
    // ... autres champs
  };
  
  // Téléchargement automatique
  const blob = new Blob([JSON.stringify(data, null, 2)], 
                       { type: 'application/json' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = `${centraleId}_terrain.json`;
  a.click();
}
```

---

## 🔐 SÉCURITÉ ET CONFIDENTIALITÉ

### Dépôt Private (Recommandé)

✅ **Uniquement accessible par**:
- Vous (propriétaire)
- Collaborateurs invités explicitement
- GitHub Pages reste public SAUF si compte GitHub Pro/Teams

⚠️ **ATTENTION**: GitHub Pages avec compte gratuit = site public
  → Pour vraie confidentialité, utiliser GitHub Pro (4$/mois) avec Pages privé

### Alternative Sécurisée: Hébergement Local

Si confidentialité maximale requise:

```bash
# Serveur local Python
cd girasole-checklists/
python3 -m http.server 8000

# Accès: http://localhost:8000
# Pas d'exposition internet, 100% local
```

---

## 📱 UTILISATION TERRAIN

### Workflow Auditeur

1. **Avant départ mission**:
   - Ouvrir checklist centrale du jour: `https://USERNAME.github.io/girasole-checklists/checklists/3085.html`
   - La page se met en cache (fonctionne hors-ligne)

2. **Pendant audit**:
   - Remplir checklist sur tablette/smartphone
   - Prendre photos avec appareil
   - Auto-save toutes les 5 secondes

3. **Fin d'audit**:
   - Cliquer **"Exporter JSON"**
   - Fichier `3085_terrain.json` téléchargé automatiquement
   - Envoyer JSON par email à BE DiagPV

4. **BE DiagPV**:
   - Reçoit `3085_terrain.json`
   - Place dans `/home/user/girasole_mission_2025/exports_json/`
   - Lance scripts génération automatique

---

## 🔄 MISE À JOUR CHECKLISTS

### Modifier une checklist

```bash
# 1. Modifier fichier local
nano girasole-checklists/checklists/3085.html

# 2. Commit et push
git add .
git commit -m "✏️ Mise à jour checklist 3085: ajout sections"
git push origin main

# 3. GitHub Pages se met à jour automatiquement (30-60 sec)
```

### Ajouter nouvelle checklist

```bash
# 1. Créer fichier
cp checklists/3085.html checklists/99999.html

# 2. Modifier centrale_id dans 99999.html
sed -i 's/3085/99999/g' checklists/99999.html

# 3. Ajouter ligne dans index.html
echo '<li><a href="checklists/99999.html">99999 - Nouvelle Centrale</a></li>' >> index.html

# 4. Push
git add . && git commit -m "➕ Ajout checklist 99999" && git push
```

---

## 📊 STATISTIQUES DÉPLOIEMENT

| Métrique | Valeur |
|----------|--------|
| **Temps déploiement** | 5 minutes |
| **Coût** | Gratuit (GitHub Pages) |
| **HTTPS** | ✅ Automatique |
| **Domaine personnalisé** | ✅ Possible (ex: checklists.diagpv.fr) |
| **Limite stockage** | 1 GB (largement suffisant) |
| **Limite bande passante** | 100 GB/mois (soft limit) |
| **Nombre de visiteurs** | Illimité |

---

## 🆘 DÉPANNAGE

### Erreur 404 après déploiement

**Cause**: GitHub Pages pas encore activé ou build en cours

**Solution**:
1. Attendre 60 secondes
2. Vérifier Settings → Pages → Source = `main` branch
3. Forcer rebuild: Settings → Pages → "Save" à nouveau

### Checklist ne sauvegarde pas

**Cause**: LocalStorage désactivé ou navigateur en mode privé

**Solution**:
1. Désactiver mode navigation privée
2. Autoriser cookies/LocalStorage dans paramètres navigateur
3. Tester dans autre navigateur (Chrome, Firefox, Safari)

### Photos ne s'affichent pas

**Cause**: Base64 trop volumineux pour LocalStorage (limite 5-10 MB)

**Solution**:
1. Redimensionner photos avant upload (max 800x600 px)
2. Compresser qualité JPEG (70-80%)
3. Utiliser outil de compression: https://tinypng.com

### Git push échoue

**Cause**: Identifiants GitHub incorrects ou pas d'accès

**Solution**:
```bash
# Vérifier remote
git remote -v

# Reconfigurer avec token GitHub
git remote set-url origin https://TOKEN@github.com/USERNAME/girasole-checklists.git

# Générer token: GitHub → Settings → Developer settings → Personal access tokens
```

---

## 🎯 RÉSUMÉ COMMANDES

```bash
# 1. Extraction
unzip GIRASOLE_2025_PACK_COMPLET_GITHUB.zip -d girasole-checklists/
cd girasole-checklists/

# 2. Git init + push
git init
git add .
git commit -m "🚀 Déploiement initial GIRASOLE 2025"
git remote add origin https://github.com/USERNAME/girasole-checklists.git
git branch -M main
git push -u origin main

# 3. Activer GitHub Pages
# → Aller sur GitHub → Settings → Pages → Source: main branch → Save

# 4. Accès
# → https://USERNAME.github.io/girasole-checklists/
```

---

## 📞 SUPPORT

**Diagnostic Photovoltaïque**  
📧 info@diagnosticphotovoltaique.fr  
📱 06 07 29 22 12 (Adrien PAPPALARDO)  
🌐 www.diagnosticphotovoltaique.fr

---

**✅ DÉPLOIEMENT TERMINÉ - SYSTÈME OPÉRATIONNEL !**
