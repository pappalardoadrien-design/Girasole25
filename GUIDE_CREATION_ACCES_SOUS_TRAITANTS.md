# 🔐 GUIDE CRÉATION ACCÈS SOUS-TRAITANTS - GIRASOLE 2025

## 📋 Vue d'ensemble

Ce guide explique comment créer facilement des accès sécurisés pour les sous-traitants de la plateforme GIRASOLE 2025.

**Script automatique** : `scripts/creer-acces-sous-traitant.cjs`

---

## 🚀 MÉTHODE RAPIDE : COMMANDE UNIQUE

### ✅ Création accès PRODUCTION (recommandé)

```bash
cd /home/user/webapp
node scripts/creer-acces-sous-traitant.cjs "NOM_UTILISATEUR" SOUS_TRAITANT_ID --remote
```

**Exemples concrets** :
```bash
# Créer accès pour "SOLAR TECH" (sous-traitant ID 10)
node scripts/creer-acces-sous-traitant.cjs "SOLAR TECH" 10 --remote

# Créer accès pour "Jean DUPONT - DIAGPV NORD" (sous-traitant ID 5)
node scripts/creer-acces-sous-traitant.cjs "Jean DUPONT - DIAGPV NORD" 5 --remote

# Créer accès pour "ENERGIE PLUS" (sous-traitant ID 12)
node scripts/creer-acces-sous-traitant.cjs "ENERGIE PLUS" 12 --remote
```

### 🧪 Création accès LOCAL (tests uniquement)

```bash
node scripts/creer-acces-sous-traitant.cjs "TEST USER" 3
```
*(sans `--remote` = base de données locale `.wrangler/state`)*

---

## 📖 GUIDE ÉTAPE PAR ÉTAPE

### **ÉTAPE 1 : Lister les sous-traitants disponibles**

Avant de créer un accès, vous devez connaître l'**ID du sous-traitant** en base de données.

**Commande** :
```bash
cd /home/user/webapp
npx wrangler d1 execute girasole-db-production --remote \
  --command="SELECT id, nom_entreprise, contact_principal FROM sous_traitants ORDER BY id;"
```

**Sortie exemple** :
```json
{
  "id": 3,
  "nom_entreprise": "ARTEMIS",
  "contact_principal": "LOIC"
},
{
  "id": 4,
  "nom_entreprise": "CADENET",
  "contact_principal": "Contact CADENET"
},
{
  "id": 5,
  "nom_entreprise": "DIAGPV - Adrien & Fabien",
  "contact_principal": "Adrien"
}
```

📌 **Notez l'ID** du sous-traitant pour lequel vous voulez créer un accès (ex: `3` pour ARTEMIS).

---

### **ÉTAPE 2 : Exécuter le script de création**

**Commande complète** :
```bash
cd /home/user/webapp
node scripts/creer-acces-sous-traitant.cjs "NOM_UTILISATEUR" SOUS_TRAITANT_ID --remote
```

**Arguments** :
- `"NOM_UTILISATEUR"` : Nom affiché dans l'interface (mettre entre guillemets si espaces)
- `SOUS_TRAITANT_ID` : ID numérique du sous-traitant (trouvé à l'étape 1)
- `--remote` : Créer en PRODUCTION (obligatoire pour usage réel)

**Exemple réel** :
```bash
node scripts/creer-acces-sous-traitant.cjs "Loïc MARTIN - ARTEMIS" 3 --remote
```

---

### **ÉTAPE 3 : Récupérer les informations d'accès**

Le script affiche automatiquement :

```
================================================================================
✅ ACCÈS SOUS-TRAITANT CRÉÉ AVEC SUCCÈS
================================================================================

📋 Informations:
   Nom utilisateur:        Loïc MARTIN - ARTEMIS
   Sous-traitant DB:      ARTEMIS (ID: 3)
   Rôle:                  SOUS_TRAITANT
   Statut:                ACTIF
   Environnement:         PRODUCTION (--remote)

🔐 Token d'accès:
   tPpG4xjtT7ToTN5cG_Gb5b-CVkKze8yg

🌐 URL d'accès direct:
   https://girasole-diagpv.pages.dev/s/tPpG4xjtT7ToTN5cG_Gb5b-CVkKze8yg

📧 Message à envoyer au sous-traitant:
────────────────────────────────────────────────────────────────────────────────

Bonjour Loïc MARTIN - ARTEMIS,

Vous avez désormais accès à la plateforme GIRASOLE 2025 pour la gestion 
de vos audits photovoltaïques.

🔗 Lien d'accès direct :
https://girasole-diagpv.pages.dev/s/tPpG4xjtT7ToTN5cG_Gb5b-CVkKze8yg

📌 Ce lien est personnel et confidentiel. Ne le partagez pas.

✅ Fonctionnalités disponibles :
- Consultation des centrales qui vous sont attribuées
- Gestion des missions d'audit
- Remplissage des checklists de vérification
- Upload des photos (électroluminescence, thermographie, etc.)
- Génération des rapports d'audit

Pour toute question, contactez-nous.

Cordialement,
L'équipe DIAGPV
  
────────────────────────────────────────────────────────────────────────────────

💾 Sauvegarde recommandée:
   Token: tPpG4xjtT7ToTN5cG_Gb5b-CVkKze8yg
   URL:   https://girasole-diagpv.pages.dev/s/tPpG4xjtT7ToTN5cG_Gb5b-CVkKze8yg

================================================================================
```

---

### **ÉTAPE 4 : Envoyer l'accès au sous-traitant**

**Méthode 1 : Email**
- Copier/coller le message généré automatiquement
- Envoyer par email sécurisé

**Méthode 2 : SMS/WhatsApp**
- Envoyer uniquement l'URL d'accès direct
- Message court : *"Voici votre accès GIRASOLE 2025 : https://girasole-diagpv.pages.dev/s/xxxxx"*

**Méthode 3 : Document PDF**
- Créer un PDF avec les instructions
- Y inclure l'URL d'accès et le guide utilisateur

---

## 🔍 VÉRIFICATION & TESTS

### ✅ Vérifier que le token a été créé en DB

```bash
npx wrangler d1 execute girasole-db-production --remote \
  --command="SELECT id, nom, token, role, statut FROM access_tokens WHERE nom = 'NOM_UTILISATEUR';"
```

**Résultat attendu** :
```json
{
  "id": 9,
  "nom": "Loïc MARTIN - ARTEMIS",
  "token": "tPpG4xjtT7ToTN5cG_Gb5b-CVkKze8yg",
  "role": "SOUS_TRAITANT",
  "statut": "ACTIF"
}
```

### ✅ Tester l'URL d'accès

```bash
curl -I https://girasole-diagpv.pages.dev/s/TOKEN_GENERE
```

**Résultat attendu** : `HTTP/2 302` (redirection vers dashboard)

---

## 🛠️ GESTION DES ACCÈS

### 📋 Lister tous les tokens actifs

```bash
npx wrangler d1 execute girasole-db-production --remote \
  --command="SELECT id, nom, role, statut, date_creation FROM access_tokens WHERE statut = 'ACTIF' ORDER BY date_creation DESC;"
```

### 🔒 Révoquer un accès (désactiver un token)

```bash
npx wrangler d1 execute girasole-db-production --remote \
  --command="UPDATE access_tokens SET statut = 'REVOQUE' WHERE id = TOKEN_ID;"
```

**Exemple** :
```bash
# Révoquer le token ID 9
npx wrangler d1 execute girasole-db-production --remote \
  --command="UPDATE access_tokens SET statut = 'REVOQUE' WHERE id = 9;"
```

### 🔓 Réactiver un accès

```bash
npx wrangler d1 execute girasole-db-production --remote \
  --command="UPDATE access_tokens SET statut = 'ACTIF' WHERE id = TOKEN_ID;"
```

### ❌ Supprimer définitivement un token

```bash
npx wrangler d1 execute girasole-db-production --remote \
  --command="DELETE FROM access_tokens WHERE id = TOKEN_ID;"
```

⚠️ **Attention** : Suppression irréversible !

---

## 📊 STATISTIQUES TOKENS

### Compter les tokens actifs

```bash
npx wrangler d1 execute girasole-db-production --remote \
  --command="SELECT COUNT(*) as total_actifs FROM access_tokens WHERE statut = 'ACTIF';"
```

### Compter par rôle

```bash
npx wrangler d1 execute girasole-db-production --remote \
  --command="SELECT role, COUNT(*) as total FROM access_tokens WHERE statut = 'ACTIF' GROUP BY role;"
```

---

## 🚨 DÉPANNAGE

### ❌ Erreur : "Sous-traitant ID X introuvable"

**Cause** : L'ID du sous-traitant n'existe pas en base.

**Solution** :
1. Lister les sous-traitants disponibles (voir ÉTAPE 1)
2. Utiliser un ID valide

### ❌ Erreur : "require is not defined"

**Cause** : Le script est en `.js` au lieu de `.cjs`.

**Solution** :
```bash
mv scripts/creer-acces-sous-traitant.js scripts/creer-acces-sous-traitant.cjs
```

### ❌ Le token ne fonctionne pas (erreur 404)

**Causes possibles** :
1. Token créé en LOCAL au lieu de PRODUCTION
2. Token révoqué (`statut = 'REVOQUE'`)

**Solution** :
```bash
# Vérifier le statut du token
npx wrangler d1 execute girasole-db-production --remote \
  --command="SELECT * FROM access_tokens WHERE token = 'TOKEN_ICI';"

# Si révoqué, réactiver :
npx wrangler d1 execute girasole-db-production --remote \
  --command="UPDATE access_tokens SET statut = 'ACTIF' WHERE token = 'TOKEN_ICI';"
```

---

## 📌 BONNES PRATIQUES

### ✅ Nommage utilisateurs

**Format recommandé** :
- `"Prénom NOM - Entreprise"` (ex: `"Loïc MARTIN - ARTEMIS"`)
- `"Entreprise - Contact"` (ex: `"CADENET - Jean DUPONT"`)
- `"Entreprise"` seul (ex: `"SOLAR TECH"`)

**À éviter** :
- Caractères spéciaux (`@`, `#`, `%`)
- Emojis
- Noms trop longs (>50 caractères)

### 🔐 Sécurité tokens

✅ **Tokens générés automatiquement** (32 caractères, base64, cryptographiquement sécurisés)  
✅ **1 token = 1 utilisateur** (pas de partage)  
✅ **Révocation possible** (statut `REVOQUE`)  
✅ **Traçabilité complète** (date création, dernière utilisation)

### 📧 Communication tokens

**OUI** ✅ :
- Email professionnel sécurisé
- SMS/WhatsApp personnel du contact
- Document PDF protégé par mot de passe

**NON** ❌ :
- Email en clair à plusieurs destinataires
- Publication sur Slack/Teams public
- Stockage dans fichier partagé non protégé

---

## 🎯 RÉCAPITULATIF COMMANDES

| Action | Commande |
|--------|----------|
| **Créer accès PROD** | `node scripts/creer-acces-sous-traitant.cjs "NOM" ID --remote` |
| **Lister sous-traitants** | `npx wrangler d1 execute girasole-db-production --remote --command="SELECT * FROM sous_traitants;"` |
| **Lister tokens actifs** | `npx wrangler d1 execute girasole-db-production --remote --command="SELECT * FROM access_tokens WHERE statut='ACTIF';"` |
| **Révoquer token** | `npx wrangler d1 execute girasole-db-production --remote --command="UPDATE access_tokens SET statut='REVOQUE' WHERE id=X;"` |
| **Tester URL** | `curl -I https://girasole-diagpv.pages.dev/s/TOKEN` |

---

## 📞 SUPPORT

**En cas de problème** :
1. Vérifier que `wrangler` est à jour : `npm install --save-dev wrangler@latest`
2. Vérifier l'ID sous-traitant existe bien en DB
3. Tester l'URL générée avec `curl -I`
4. Consulter les logs : `npx wrangler pages deployment list --project-name girasole-diagpv`

**Contact** : adrien@diagpv.fr

---

**Dernière mise à jour** : 1er décembre 2025  
**Version script** : v1.0  
**Plateforme** : GIRASOLE 2025 - Cloudflare Pages + D1
