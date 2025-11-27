# 🚨 INSTRUCTIONS SYNCHRONISATION URGENTE AUDITS

**Date:** 26 novembre 2025  
**Pour:** Adrien Pappalardo  
**Problème:** Données audits uniquement en localStorage mobile, pas en DB serveur

---

## ⚠️ PROBLÈME IDENTIFIÉ

Tes **9 audits** (2 jours terrain) sont stockés **UNIQUEMENT en localStorage de ton téléphone** !

**Audits concernés :**
- Audit 24 (Hangar Christophe CARRERE n°2) ✅ fait
- Audit 44 (EARL GOUNY) ✅ fait
- Audit 20 (Hangar Richard VAN ZANTEN) 🔄 en cours
- Audit 7 (Hangar Pierre MOURGUES) ⏳ à faire
- + 5 autres audits

**Pourquoi ?**
L'API de synchronisation n'existait pas. J'ai créé l'API **`POST /api/audit/sync-bulk`** qui sauvegarde tout d'un coup.

---

## ✅ SOLUTION IMMÉDIATE

### **Option 1 : Terminer les audits (RECOMMANDÉ)**

Pour chaque audit fait sur ton téléphone :

1. Ouvrir l'audit : https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/audit/24
2. Cliquer sur **"Terminer"** (bouton vert en haut à droite)
3. Confirmer → La synchronisation se lance automatiquement
4. Message : "✅ Mission terminée et données sauvegardées !"
5. Le rapport est généré automatiquement

**Faire cela pour TOUS les audits :**
- Audit 24 : https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/audit/24
- Audit 44 : https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/audit/44
- (+ tous les autres audits que tu as fait)

---

### **Option 2 : Synchronisation manuelle via console Chrome (si besoin)**

Si tu ne veux pas cliquer "Terminer", tu peux forcer la sync en console Chrome :

1. Ouvrir audit : https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/audit/24
2. Ouvrir Console Chrome (F12 → Console)
3. Coller ce code :

```javascript
// Récupérer données localStorage
const missionId = window.location.pathname.split('/').pop();
const checklistItems = JSON.parse(localStorage.getItem(`audit_mission_${missionId}`) || '[]');

// Récupérer photos par item
const photosItems = [];
for (const item of checklistItems) {
  const photosKey = `audit_photos_item_${missionId}_${item.id}`;
  const photos = JSON.parse(localStorage.getItem(photosKey) || '[]');
  if (photos.length > 0) {
    photosItems.push({
      item_numero: item.item_numero,
      photos: photos
    });
  }
}

// Récupérer commentaire final et photos générales
const commentaireFinal = localStorage.getItem(`commentaire_final_${missionId}`) || '';
const photosGenerales = JSON.parse(localStorage.getItem(`photos_generales_${missionId}`) || '[]');

// Synchroniser
fetch('/api/audit/sync-bulk', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    mission_id: missionId,
    checklist_items: checklistItems,
    photos_items: photosItems,
    commentaire_final: commentaireFinal,
    photos_generales: photosGenerales
  })
})
.then(r => r.json())
.then(data => {
  console.log('✅ Sync réussie:', data);
  alert('✅ Données synchronisées avec succès !');
})
.catch(error => {
  console.error('❌ Erreur:', error);
  alert('❌ Erreur synchronisation');
});
```

4. Appuyer Entrée
5. Attendre message "✅ Données synchronisées avec succès !"

---

## 🔍 VÉRIFICATION APRÈS SYNC

Après synchronisation, vérifie que les données sont en DB :

```bash
# Dans un terminal sandbox
curl -s 'http://localhost:3000/api/ordres-mission' | jq '.data | length'
# Devrait afficher > 0
```

Ou depuis la webapp :
- Aller sur https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/rapports
- Cliquer "Générer rapport" pour mission X
- Vérifier que rapport s'affiche

---

## 📊 CE QUI EST SYNCHRONISÉ

Pour chaque audit :

✅ **Items checklist** (40 points SOL)
- Numéro item
- Statut (Conforme / Non conforme / N/A)
- Commentaire terrain

✅ **Photos multi par item**
- Base64
- Filename
- Commentaire photo
- Ordre

✅ **Commentaire final mission**

✅ **Photos générales**
- Base64
- Filename
- Légende
- Ordre

---

## ⚡ NOUVELLE FONCTION `finishAudit()`

La fonction `finishAudit()` dans `audit.js` a été modifiée :

**AVANT (problème) :**
```javascript
finishAudit() {
  // Mettait juste statut mission à TERMINE
  // Aucune synchronisation données !
}
```

**APRÈS (corrigé) :**
```javascript
finishAudit() {
  // 1. Synchronisation BULK toutes données
  POST /api/audit/sync-bulk {
    mission_id,
    checklist_items,
    photos_items,
    commentaire_final,
    photos_generales
  }
  
  // 2. Mise à jour statut mission
  PUT /api/ordres-mission/${missionId}/statut
  
  // 3. Génération rapport automatique
  POST /api/rapports/generer/${missionId}
  
  // 4. Redirection vers /rapports
}
```

---

## 🎯 PROCHAINES ÉTAPES

1. **IMMÉDIAT** : Synchroniser les 9 audits terrain
   - Méthode : Cliquer "Terminer" sur chaque audit
   - Temps : ~2 min par audit = 20 min total

2. **Vérification** : Consulter rapports générés
   - URL : https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/rapports
   - Devrait afficher 9 rapports

3. **Continuer audits** : Audits 20, 7, etc.
   - Maintenant la sync fonctionne
   - Clique "Terminer" quand audit fini

4. **Partager avec Fabien** : Une fois synchro faite
   - Il pourra voir rapports
   - Il pourra ajouter photos/commentaires

---

## 📞 SUPPORT

Si problème synchronisation :
1. Copier message d'erreur
2. Ouvrir Console Chrome (F12)
3. Copier logs erreur
4. Me contacter avec détails

---

## ✅ GARANTIES

✅ **Données localStorage intactes** : Rien n'est supprimé de ton téléphone  
✅ **Synchronisation non destructive** : Les données sont copiées, pas déplacées  
✅ **Mode offline toujours fonctionnel** : Tu peux continuer audits offline  
✅ **Multi-sync safe** : Tu peux cliquer "Terminer" plusieurs fois sans risque  

---

**🚀 Synchronise tes audits maintenant pour que Fabien puisse y accéder !**
