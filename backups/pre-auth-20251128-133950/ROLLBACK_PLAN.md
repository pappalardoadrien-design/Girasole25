# 🔙 PLAN DE ROLLBACK - AUTHENTIFICATION URLs SECRÈTES

**Date Backup**: 28/11/2024 13:39 CET  
**Version Actuelle**: v2.4.6  
**Commit Actuel**: 987d7b4

---

## 📊 ÉTAT AVANT MODIFICATIONS

### Données Sauvegardées
- ✅ **52 centrales** → backup_centrales.json (47 KB)
- ✅ **52 missions** → backup_ordres_mission.json (33 KB)
- ✅ **7 sous-traitants** → backup_sous_traitants.json (2.2 KB)
- ✅ **Code source complet** → backup_code_source.tar.gz (531 KB)

### Fonctionnalités Actuelles (TOUTES FONCTIONNELLES)
- ✅ Dashboard dynamique avec Chart.js
- ✅ Onglet Centrales avec dropdowns 7 sous-traitants
- ✅ Onglet Missions avec accès audits
- ✅ Checklists SOL (40 items) + TOITURE (14 items)
- ✅ Upload photos base64
- ✅ Commentaires audits
- ✅ Onglet Planning
- ✅ Onglet Analytics
- ✅ Auto-save checklist toutes les 3 secondes

### URLs de Production
- **Production**: https://girasole-diagpv.pages.dev
- **Build ID actuel**: dbb6fb2d

---

## 🚨 PROCÉDURE DE ROLLBACK (SI PROBLÈME)

### Option 1 : Rollback Cloudflare Pages (RAPIDE - 30 secondes)

```bash
# 1. Lister les déploiements récents
cd /home/user/webapp
npx wrangler pages deployment list --project-name girasole-diagpv

# 2. Identifier le deployment précédent (dbb6fb2d)
# 3. Rollback vers ce deployment
npx wrangler pages deployment rollback dbb6fb2d --project-name girasole-diagpv

# 4. Vérifier que tout fonctionne
curl https://girasole-diagpv.pages.dev/
curl https://girasole-diagpv.pages.dev/api/centrales
```

### Option 2 : Re-deploy Version Précédente (MOYEN - 2 minutes)

```bash
# 1. Revenir au commit précédent
cd /home/user/webapp
git log --oneline | head -5  # Trouver commit 987d7b4
git checkout 987d7b4

# 2. Rebuild
npm run build

# 3. Redeploy
npx wrangler pages deploy dist --project-name girasole-diagpv

# 4. Vérifier
curl https://girasole-diagpv.pages.dev/
```

### Option 3 : Restauration Code Source (COMPLET - 5 minutes)

```bash
# 1. Extraire backup code
cd /home/user/webapp
tar -xzf backups/pre-auth-20251128-133950/backup_code_source.tar.gz

# 2. Rebuild
npm run build

# 3. Redeploy
npx wrangler pages deploy dist --project-name girasole-diagpv
```

---

## 🧪 TESTS DE VALIDATION POST-ROLLBACK

### Test 1 : API Centrales
```bash
curl -s "https://girasole-diagpv.pages.dev/api/centrales" | jq '.data | length'
# Attendu: 52
```

### Test 2 : API Ordres Mission
```bash
curl -s "https://girasole-diagpv.pages.dev/api/ordres-mission" | jq '.data | length'
# Attendu: 52
```

### Test 3 : Dashboard Accessible
```bash
curl -s "https://girasole-diagpv.pages.dev/" | grep "Dashboard"
# Attendu: HTML contenant "Dashboard"
```

### Test 4 : Checklist Mission 9
```bash
curl -s "https://girasole-diagpv.pages.dev/api/checklist/9" | jq '.data | length'
# Attendu: 40 items
```

---

## 📞 CONTACT EN CAS D'URGENCE

**Administrateur**: Adrien PAPPALARDO  
**Email**: adrien@diagpv.fr  
**URL Production**: https://girasole-diagpv.pages.dev

---

## ⚠️ CRITÈRES DE DÉCLENCHEMENT ROLLBACK

### Déclencher Rollback IMMÉDIAT si :
1. ❌ API `/api/centrales` ne retourne pas 52 centrales
2. ❌ API `/api/ordres-mission` ne retourne pas 52 missions
3. ❌ Dashboard ne s'affiche pas
4. ❌ Checklist ne se charge pas
5. ❌ Erreur 500 sur n'importe quelle page
6. ❌ Photos ou commentaires inaccessibles

### NE PAS déclencher Rollback si :
- ✅ Problème uniquement authentification (URLs secrètes)
- ✅ Problème uniquement filtrage (données visibles mais non filtrées)
- ✅ Problème uniquement session (re-login possible)

---

## 📝 NOTES IMPORTANTES

- **Aucune donnée supprimée** : Toutes les tables restent intactes
- **Nouvelle table ajoutée** : `access_tokens` (indépendante)
- **Middleware ajouté** : `requireSession` (optionnel, peut être désactivé)
- **Filtrage SQL ajouté** : Clauses WHERE sur `sous_traitant_id`

**Toutes ces modifications sont RÉVERSIBLES sans perte de données**

---

**✅ CE BACKUP GARANTIT UN RETOUR ARRIÈRE COMPLET EN MOINS DE 5 MINUTES**
