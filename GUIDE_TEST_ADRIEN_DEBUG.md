# 🧪 GUIDE TEST DEBUG - Affichage fin checklist

**Adrien**, j'ai ajouté des **logs de debug** dans le code pour comprendre pourquoi la fin de la checklist ne s'affiche pas.

---

## ✅ **DÉPLOIEMENT PRODUCTION TERMINÉ**

- **URL production** : https://girasole-diagpv.pages.dev/audit/18
- **Corrections déployées** : ✅ Logs console complets
- **Date déploiement** : 2025-12-08 14:35

---

## 🔍 **TEST À EFFECTUER (5 MINUTES)**

### **ÉTAPE 1 : Ouvrir Console Browser**

1. Aller sur **https://girasole-diagpv.pages.dev/audit/18**
2. Appuyer sur **F12** (ou **Fn+F12** sur Mac)
3. Cliquer sur onglet **"Console"** en haut
4. **Laisser la console ouverte** pendant les tests

---

### **ÉTAPE 2 : Scroller en bas de la checklist**

1. **Scroller tout en bas** avec la souris/trackpad
2. **Vérifier si tu vois** :
   - ✅ Section bleue "📋 SYNTHÈSE GÉNÉRALE MISSION" ?
   - ✅ Zone de texte "Commentaire général sur la centrale" ?
   - ✅ Bouton bleu "📸 Ajouter photos générales" ?
   - ✅ Bouton bleu "✅ TERMINÉ - Retour Dashboard" ?
   - ✅ Bouton vert "📄 GÉNÉRER RAPPORT HTML/PDF" ?

**➡️ Si tu ne vois RIEN de tout ça : c'est le bug !**

---

### **ÉTAPE 3 : Lire les logs dans Console**

Dans la console (F12), tu dois voir des messages comme :

```
✅ Commentaire final chargé
✅ Photos générales chargées
✅ Checklist toiture chargée
✅ Rendu commentaireFinalSection...
✅ Rendu 3 photos générales...
```

**➡️ Note tous les messages que tu vois (copie-colle si possible)**

---

### **ÉTAPE 4 : Chercher erreurs en ROUGE**

Dans la console, cherche des messages **en ROUGE** du type :

```
❌ Element commentaireFinalSection NOT FOUND !
❌ Element photosGeneralesGallery NOT FOUND !
```

**➡️ Si tu vois un message rouge, copie-le intégralement**

---

### **ÉTAPE 5 : Vérifier API Network**

1. Dans F12, cliquer sur onglet **"Network"** (ou **"Réseau"**)
2. **Recharger la page** (Ctrl+R / Cmd+R)
3. Dans la liste de requêtes, chercher :
   - `commentaire-final` → Statut **200** ✅ ou **404/500** ❌ ?
   - `photos-generales` → Statut **200** ✅ ou **404/500** ❌ ?
   - `checklist-toiture` → Statut **200** ✅ ou **404/500** ❌ ?

**➡️ Note les statuts de chaque API**

---

## 📸 **OPTION : ENVOYER SCREENSHOTS**

Si tu peux, envoie-moi :
1. **Screenshot console** (F12 → Console) avec les logs visibles
2. **Screenshot page** scrollée tout en bas (pour voir si section affichée ou non)

---

## 📝 **RAPPORT À M'ENVOYER**

Copie-colle ce template et remplis-le :

```
=== RAPPORT TEST DEBUG ===

1. SECTION FIN CHECKLIST VISIBLE ?
   [ ] OUI, je vois tout (commentaire + photos + boutons)
   [ ] NON, rien ne s'affiche en bas de page

2. LOGS CONSOLE (copier messages verts ✅) :
   [Coller ici les logs]

3. ERREURS CONSOLE (copier messages rouges ❌) :
   [Coller ici les erreurs]

4. API NETWORK STATUS :
   - commentaire-final : [ 200 / 404 / 500 ]
   - photos-generales : [ 200 / 404 / 500 ]
   - checklist-toiture : [ 200 / 404 / 500 ]

5. OBSERVATIONS SUPPLÉMENTAIRES :
   [Tout ce qui te semble bizarre]
```

---

## 🎯 **APRÈS TON TEST**

Dès que tu as ces infos, je pourrai :
1. **Identifier la cause exacte** du bug
2. **Corriger immédiatement** le problème
3. **Redéployer** en production

---

## 📞 **BESOIN D'AIDE ?**

Si tu bloques sur un test, dis-moi où et je t'aide !

