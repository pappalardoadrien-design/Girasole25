# 🚨 SOLUTION URGENTE - Récupérer tes audits localStorage

## LE PROBLÈME

Le localStorage est **isolé par domaine**. Tes audits sont sur **l'URL où tu les as faits**, pas forcément sur l'URL sandbox.

---

## 🔍 ÉTAPE 1 : TROUVER L'URL CORRECTE

**Sur ton téléphone, ouvre ton historique de navigation et cherche :**

1. URL Cloudflare Pages : `https://xxx.girasole-diagpv.pages.dev/audit/24`
2. OU URL sandbox : `https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/audit/24`

**Quelle URL tu vois dans ton historique pour les audits 24, 44, etc. ?**

---

## 🎯 SOLUTION SELON L'URL

### **CAS 1 : URL = Cloudflare Pages (`xxx.girasole-diagpv.pages.dev`)**

Si tu as fait les audits sur Cloudflare Pages, **la page backup-urgence n'existe pas là-bas** (pas encore déployée en production).

**SOLUTION : Utiliser Console Chrome directement depuis un audit**

1. Sur ton téléphone, ouvre UN audit que tu as fait :
   ```
   https://xxx.girasole-diagpv.pages.dev/audit/24
   ```

2. Ouvre la Console Chrome :
   - Android : Menu → Plus d'outils → Outils de développement → Console
   - iPhone Safari : Réglages → Safari → Avancé → Activer console web

3. Copie/colle CE CODE dans la console :

```javascript
// CODE SAUVEGARDE URGENCE
async function sauvegardeUrgence() {
  const keys = Object.keys(localStorage).filter(k => k.startsWith('audit_mission_'));
  console.log('🔍 Missions trouvées:', keys.length);
  
  if (keys.length === 0) {
    alert('❌ Aucune mission en localStorage !');
    return;
  }
  
  let saved = 0;
  for (const key of keys) {
    const missionId = key.replace('audit_mission_', '');
    console.log('🔄 Sauvegarde mission', missionId);
    
    const items = JSON.parse(localStorage.getItem(key) || '[]');
    const photosItems = [];
    for (const item of items) {
      const pk = 'audit_photos_item_' + missionId + '_' + item.id;
      const photos = JSON.parse(localStorage.getItem(pk) || '[]');
      if (photos.length > 0) {
        photosItems.push({item_numero: item.item_numero, photos});
      }
    }
    const commentaire = localStorage.getItem('commentaire_final_' + missionId) || '';
    const photosGen = JSON.parse(localStorage.getItem('photos_generales_' + missionId) || '[]');
    
    try {
      const res = await fetch('/api/audit/sync-bulk', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({
          mission_id: missionId,
          checklist_items: items,
          photos_items: photosItems,
          commentaire_final: commentaire,
          photos_generales: photosGen
        })
      });
      const result = await res.json();
      if (result.success) {
        console.log('✅ Mission', missionId, 'sauvegardée !');
        saved++;
      } else {
        console.error('❌ Erreur mission', missionId, ':', result.error);
      }
    } catch (e) {
      console.error('❌ Erreur réseau:', e);
    }
  }
  alert('✅ ' + saved + ' mission(s) sauvegardée(s) !');
}

// LANCER SAUVEGARDE
sauvegardeUrgence();
```

4. Appuie sur Entrée
5. Attends le message "✅ X mission(s) sauvegardée(s) !"

---

### **CAS 2 : URL = Sandbox (`3000-xxx.e2b.dev`)**

Si tu as fait les audits sur l'URL sandbox :

1. Ouvre cette page **SUR LE MÊME TÉLÉPHONE** :
   ```
   https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/backup-urgence
   ```

2. Clique sur le bouton vert

---

## 🔍 ALTERNATIVE : EXPORT MANUEL JSON

Si aucune solution ne marche, **exporte les données en JSON** :

1. Ouvre UN audit sur ton téléphone
2. Console Chrome → colle ce code :

```javascript
// EXPORT JSON
const keys = Object.keys(localStorage).filter(k => k.startsWith('audit_'));
const data = {};
keys.forEach(k => {
  data[k] = localStorage.getItem(k);
});
const json = JSON.stringify(data, null, 2);
console.log('📦 DONNÉES À COPIER :');
console.log(json);
// Copie le JSON et envoie-le moi
```

3. Copie le JSON affiché
4. Envoie-moi le JSON → Je le réinjecte dans la DB

---

## ❓ QUELLE URL TU UTILISES ?

**Dis-moi quelle URL tu vois dans ton historique de navigation pour les audits !**

Exemples :
- `https://0da64170.girasole-diagpv.pages.dev/audit/24` → Cloudflare Pages
- `https://3000-xxx.e2b.dev/audit/24` → Sandbox
- Autre ?

---

## 🚨 RÉPONSE RAPIDE REQUISE

**Réponds-moi avec l'URL exacte que tu utilises pour les audits et je t'aide immédiatement !**
