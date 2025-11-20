# 🚀 GUIDE DÉPLOIEMENT GITHUB PAGES - GIRASOLE 2025

**Mission**: Déployer 52 checklists terrain sur GitHub Pages pour accès web  
**Temps estimé**: 5 minutes  
**Prérequis**: Compte GitHub existant  

---

## 📋 ÉTAPE 1: PRÉPARATION DU PACKAGE

### Localisation du package
Le package complet est déjà prêt dans AI Drive:
```
/mnt/aidrive/GIRASOLE/GIRASOLE_2025_PACK_COMPLET_GITHUB.zip
```

### Contenu du package
- ✅ 52 checklists HTML (1 par centrale)
- ✅ `index.html` (page d'accueil avec liste)
- ✅ LocalStorage auto-save (données persistantes)
- ✅ Export JSON intégré
- ✅ Base64 photo embedding (offline-capable)

### Extraction du package
```bash
cd /home/user/girasole_mission_2025
unzip /mnt/aidrive/GIRASOLE/GIRASOLE_2025_PACK_COMPLET_GITHUB.zip -d github_pages_deploy
```

---

## 📋 ÉTAPE 2: CRÉER DÉPÔT GITHUB

### 2.1. Aller sur GitHub
1. Ouvrir navigateur: https://github.com
2. Cliquer **"New repository"** (bouton vert)

### 2.2. Configuration du dépôt
- **Repository name**: `girasole-checklists-2025` (ou autre nom)
- **Description**: "Checklists terrain GIRASOLE 2025 - Diagnostic Photovoltaïque"
- **Visibilité**: 
  - ⚠️ **Public** si accès libre pour auditeurs
  - 🔒 **Private** si accès restreint (nécessite GitHub Pro/Teams)
- **Initialize**: NE PAS cocher "Add a README file"
- Cliquer **"Create repository"**

### 2.3. Noter l'URL du dépôt
Exemple: `https://github.com/VOTRE_USERNAME/girasole-checklists-2025.git`

---

## 📋 ÉTAPE 3: POUSSER LES FICHIERS

### 3.1. Dans le terminal sandbox
```bash
cd /home/user/girasole_mission_2025/github_pages_deploy

# Initialiser git
git init
git add .
git commit -m "Deploy GIRASOLE 2025 checklists - 52 centrales"

# Configurer remote (REMPLACER par votre URL)
git remote add origin https://github.com/VOTRE_USERNAME/girasole-checklists-2025.git

# Pousser vers GitHub
git branch -M main
git push -u origin main
```

### 3.2. Authentification GitHub
Si demandé:
- **Username**: Votre username GitHub
- **Password**: Utiliser un **Personal Access Token** (PAT)

**Créer un PAT si nécessaire**:
1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Generate new token → Cocher `repo` → Generate token
3. Copier le token et l'utiliser comme mot de passe

---

## 📋 ÉTAPE 4: ACTIVER GITHUB PAGES

### 4.1. Accéder aux paramètres
1. Aller sur votre dépôt GitHub
2. Cliquer onglet **"Settings"**
3. Dans menu gauche, cliquer **"Pages"**

### 4.2. Configurer la source
- **Source**: Sélectionner `main` branch
- **Folder**: Sélectionner `/ (root)`
- Cliquer **"Save"**

### 4.3. Attendre le déploiement
- Durée: 1-2 minutes
- GitHub affichera l'URL publique:
  ```
  https://VOTRE_USERNAME.github.io/girasole-checklists-2025/
  ```

---

## 📋 ÉTAPE 5: TESTER L'ACCÈS

### 5.1. Ouvrir l'URL dans navigateur
```
https://VOTRE_USERNAME.github.io/girasole-checklists-2025/
```

### 5.2. Vérifier fonctionnalités
- ✅ Liste des 52 centrales affichée
- ✅ Cliquer sur une centrale → Checklist s'ouvre
- ✅ Remplir quelques champs → Données sauvegardées (LocalStorage)
- ✅ Rafraîchir page → Données persistent
- ✅ Bouton "Exporter JSON" fonctionne
- ✅ Upload photos fonctionne

---

## 📋 ÉTAPE 6: DISTRIBUER AUX AUDITEURS

### 6.1. URL à partager
Partager l'URL avec vos auditeurs terrain:
```
https://VOTRE_USERNAME.github.io/girasole-checklists-2025/
```

### 6.2. Instructions auditeurs
1. **Ouvrir l'URL sur mobile/tablette**
2. **Sélectionner centrale** dans liste
3. **Remplir checklist** (auto-save)
4. **Prendre photos** avec appareil
5. **Exporter JSON** en fin d'audit
6. **Envoyer JSON + photos ZIP** au BE

### 6.3. Mode offline (optionnel)
Pour utilisation hors ligne:
1. Ouvrir checklist en ligne (1x)
2. Navigateur cache la page
3. Utilisation possible sans internet
4. Sync données au retour réseau

---

## 🔧 MAINTENANCE ET MISES À JOUR

### Mettre à jour les checklists
Si modifications nécessaires:
```bash
cd /home/user/girasole_mission_2025/github_pages_deploy

# Modifier fichiers HTML
# ...

# Commit et push
git add .
git commit -m "Update: [description modifications]"
git push origin main
```

GitHub Pages redéploie automatiquement en 1-2 min.

### Ajouter nouvelles centrales
1. Créer nouveau fichier `XXXXX_checklist.html`
2. Ajouter ligne dans `index.html`
3. Commit et push

---

## 📱 OPTIMISATIONS MOBILE

### Ajouter à l'écran d'accueil (iOS/Android)
Les auditeurs peuvent ajouter l'URL en raccourci:
- **iOS Safari**: Partager → "Sur l'écran d'accueil"
- **Android Chrome**: Menu → "Ajouter à l'écran d'accueil"

Comportement: Lance comme une app native

---

## 🔒 SÉCURITÉ ET CONFIDENTIALITÉ

### ⚠️ Données sensibles
- Les checklists HTML ne contiennent **aucune donnée sensible**
- Données audit = saisies localement (LocalStorage navigateur)
- Photos = uploadées localement (Base64 dans JSON)
- **Aucune donnée n'est envoyée à GitHub Pages**

### 🔐 Dépôt privé (si confidentialité requise)
Si dépôt **Private**:
- Accès limité aux collaborateurs GitHub autorisés
- Nécessite GitHub Pro/Teams (payant)
- Alternative: Cloudflare Pages avec authentification

---

## 📊 STATISTIQUES D'UTILISATION

GitHub Pages fournit statistiques basiques:
- Nombre de visites
- Pages les plus consultées

**Accès**: Dépôt → Insights → Traffic

---

## ✅ CHECKLIST FINALE

- [ ] Package extrait de AI Drive
- [ ] Dépôt GitHub créé
- [ ] Fichiers poussés vers GitHub
- [ ] GitHub Pages activé
- [ ] URL publique testée
- [ ] Checklist test remplie et JSON exporté
- [ ] URL distribuée aux auditeurs
- [ ] Instructions auditeurs envoyées

---

## 🆘 DÉPANNAGE

### Problème: GitHub Pages ne s'active pas
**Solution**: Vérifier que le dépôt est Public OU que GitHub Pro est activé

### Problème: 404 Not Found sur l'URL
**Solution**: Attendre 2-3 min après activation, puis vider cache navigateur

### Problème: Modifications non visibles
**Solution**: 
1. Vérifier que commit/push réussis: `git log`
2. Attendre 1-2 min pour redéploiement
3. Vider cache navigateur (Ctrl+Shift+R)

### Problème: LocalStorage ne fonctionne pas
**Solution**: Vérifier que navigateur autorise cookies/storage

### Problème: Export JSON échoue
**Solution**: Vérifier que navigateur autorise téléchargements

---

## 📞 SUPPORT

**Contact DiagPV**:
- 📧 Email: contact@diagpv.fr
- ☎️ Tél: 05.81.10.16.59

**Documentation GitHub Pages**:
- https://docs.github.com/en/pages

---

## 🎯 RÉSULTAT FINAL

✅ **52 checklists accessibles en ligne**  
✅ **URL unique à partager**: `https://[username].github.io/girasole-checklists-2025/`  
✅ **Auto-save LocalStorage** → Aucune perte de données  
✅ **Export JSON intégré** → Prêt pour scripts Python  
✅ **Hébergement gratuit** → GitHub Pages 100% gratuit pour dépôts publics  
✅ **SSL/HTTPS automatique** → Sécurisé par défaut  

**Temps total déploiement**: 5 minutes ⏱️  
**Coût**: 0€ 💰  
**Disponibilité**: 99.9% ⚡  

---

**Diagnostic Photovoltaïque - Groupe Watt&co**  
*3 rue d'Apollo, 31240 L'UNION*  
*RCS Toulouse 792 972 309*
