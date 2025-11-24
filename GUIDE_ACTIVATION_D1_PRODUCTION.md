# 🚀 GUIDE ACTIVATION D1 PRODUCTION - GIRASOLE

## ⚡ ÉTAPE CRITIQUE : Activer D1 Database pour Fabien

**URL Production actuelle** : https://d1ef2c1b.girasole-diagpv.pages.dev  
**Statut** : ✅ Déployé, ❌ D1 Database non configurée (0 centrales chargées)

---

## 🎯 PROCÉDURE RAPIDE (5 minutes)

### **1️⃣ Ouvrir Dashboard Cloudflare**

🔗 https://dash.cloudflare.com

1. Se connecter avec votre compte Cloudflare
2. Menu **Workers & Pages** (barre latérale gauche)
3. Cliquer sur **girasole-diagpv**

---

### **2️⃣ Configurer D1 Binding**

1. Onglet **Settings** en haut
2. Section **Bindings** (Functions) → Cliquer **Add**
3. Remplir :
   - **Variable name** : `DB`
   - **Type** : `D1 database`
   - **D1 database** : `girasole-db-production`
4. Cliquer **Save**

---

### **3️⃣ Relancer le Déploiement**

**Option A : Via Dashboard (recommandé)**

1. Onglet **Deployments** en haut
2. Trouver le déploiement `d1ef2c1b` (en cours)
3. Cliquer sur les 3 points `⋮` → **Retry deployment**

**Option B : Via Sandbox (si besoin)**

```bash
cd /home/user/webapp && npx wrangler pages deploy dist --project-name girasole-diagpv
```

---

### **4️⃣ Importer Données dans D1 Production**

**Via Dashboard Cloudflare** :

1. Menu **Storage & Databases** → **D1**
2. Cliquer sur **girasole-db-production**
3. Onglet **Console**
4. Copier-coller les scripts SQL depuis `/home/user/webapp/migrations/` :
   - `0001_init_centrales_reelles.sql` (schéma DB)
   - `0002_add_planning_management.sql` (ordres mission + checklist)
   - `0003_checklist_photos.sql` (photos base64)
   - `0003_import_girasole_centrales.sql` (52 centrales ANNEXE 1)

**Alternative : Via Sandbox (si timeout Dashboard)**

```bash
# ⚠️ Peut prendre 10-15 minutes (grosse migration)
cd /home/user/webapp
npx wrangler d1 migrations apply girasole-db-production --remote
```

---

### **5️⃣ Vérifier Production**

```bash
# Tester API centrales (doit retourner 52)
curl -s https://d1ef2c1b.girasole-diagpv.pages.dev/api/centrales | jq '.centrales | length'

# Tester Planning Manager (doit afficher 52 centrales)
open https://d1ef2c1b.girasole-diagpv.pages.dev/planning-manager
```

---

## ✅ RÉSULTAT ATTENDU

**Après activation D1** :

✅ **URL Production** : https://d1ef2c1b.girasole-diagpv.pages.dev  
✅ **Planning Manager** : https://d1ef2c1b.girasole-diagpv.pages.dev/planning-manager  
✅ **52 centrales chargées** (ANNEXE 1 complète)  
✅ **Checklists 54 points** auto-créées  
✅ **Export ANNEXE 1 Enrichie** fonctionnel  
✅ **Accessible par Fabien** (même URL)

---

## 📋 DONNÉES À IMPORTER

### **Tables critiques** :

- `centrales` : 52 centrales GIRASOLE
- `sous_traitants` : 2 ST (DiagPV Solutions, DiagPV Externe)
- `techniciens` : 4 techniciens (Jean Dupont, Adrien, Fabien, Marc Leroy)
- `ordres_mission` : missions planifiées
- `checklist_items` : 54 points par mission

### **Vérification rapide** :

```sql
-- Compter centrales
SELECT COUNT(*) FROM centrales;  -- 52 attendu

-- Compter techniciens
SELECT COUNT(*) FROM techniciens;  -- 4 attendu

-- Compter sous-traitants
SELECT COUNT(*) FROM sous_traitants;  -- 2 attendu
```

---

## 🚨 PROBLÈME COURANT : Timeout Migrations

**Si `wrangler d1 migrations apply` timeout** :

1. **Dashboard Console** : Importer manuellement (copier-coller SQL)
2. **Batch Import** : Diviser `0003_import_girasole_centrales.sql` en plusieurs fichiers (10 centrales par fichier)
3. **Local → Export → Import** : 
   ```bash
   # Export depuis sandbox local
   npx wrangler d1 execute girasole-db-production --local --command="SELECT * FROM centrales" --json > centrales_export.json
   
   # Convertir JSON → SQL INSERT
   # Importer via Dashboard Console
   ```

---

## 📞 SUPPORT

**Si problème** :

1. Vérifier logs Cloudflare Pages : Dashboard → **Deployments** → Cliquer sur `d1ef2c1b`
2. Vérifier D1 binding : Dashboard → **Settings** → **Bindings** (doit afficher `DB → girasole-db-production`)
3. Tester API localement : `curl http://localhost:3000/api/centrales` (sandbox OK ?)

---

## 🎯 PROCHAINES ÉTAPES

**Une fois D1 activée** :

1. ✅ Envoyer URL à Fabien : https://d1ef2c1b.girasole-diagpv.pages.dev/planning-manager
2. ✅ Planifier 26 Centrales Toulouse (Adrien + Fabien)
3. ✅ Exporter ANNEXE 1 Enrichie
4. ✅ Envoyer CSV à GIRASOLE

---

**Date création** : 2025-01-22 19:51 CET  
**Deadline** : URGENTE (15 minutes avant)  
**Statut** : ⏳ D1 Database à activer manuellement
