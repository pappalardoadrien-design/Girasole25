# 📄 GUIDE ACCÈS RAPPORTS AUDIT

## 🎯 COMMENT ACCÉDER AUX RAPPORTS

### **Méthode 1 : URL Directe (RECOMMANDÉ)**

Chaque mission a un **lien direct** vers son rapport final :

```
https://0da64170.girasole-diagpv.pages.dev/api/ordres-mission/:id/rapport-final
```

#### **Exemples concrets :**

**Mission 9 - Burgat Et Fils TP**  
📄 https://0da64170.girasole-diagpv.pages.dev/api/ordres-mission/9/rapport-final

**Mission 46 - Commune De Pomas**  
📄 https://0da64170.girasole-diagpv.pages.dev/api/ordres-mission/46/rapport-final

**Mission 1 - Antunez SCI ANAUJA**  
📄 https://0da64170.girasole-dagpv.pages.dev/api/ordres-mission/1/rapport-final

---

### **Méthode 2 : Depuis le Dashboard**

1. Ouvrir Dashboard : https://0da64170.girasole-diagpv.pages.dev
2. Onglet **"📋 Missions"**
3. Chercher la mission concernée
4. Cliquer sur **"🔍 Détails"** (à droite)
5. Lien **"📄 Rapport Final"** visible

---

### **Méthode 3 : Depuis l'Ordre de Mission**

Chaque ordre de mission (QR Code papier) a un lien direct :

```
https://0da64170.girasole-diagpv.pages.dev/ordre-mission/:id
```

En bas de page : **Bouton "📄 Voir Rapport Final"**

---

## 📋 CONTENU DU RAPPORT

Le rapport final HTML inclut :

### **En-tête mission**
- ✅ Nom centrale + Type (SOL/TOITURE)
- ✅ Puissance kWc
- ✅ Date audit
- ✅ Technicien (Adrien Pappalardo)
- ✅ Sous-traitant (ARTEMIS)

### **Statistiques conformité**
- ✅ Nombre points conformes
- ✅ Nombre points non conformes
- ✅ Anomalies mineures/majeures
- ✅ Points N/A
- ✅ **Taux de conformité global**

### **Checklist détaillée par catégorie**
- 📄 **DOCUMENTATION** (3 points)
- ⚡ **INSTALL_ELEC** (6 points)
- ⚡ **NORMES_ELEC** (6 points)
- 🏗️ **TRANCHEES** (5 points)
- 🔌 **CABLAGE** (8 points)
- 👁️ **INSPECTIONS_VISUELLES** (5 points)
- 🏠 **TOITURE_DTU_40_35** (12 points - si toiture)

Pour chaque point :
- ✅ Statut (Conforme / Non conforme / Anomalie / N/A)
- 💬 Commentaire terrain
- 📊 Mesure (si applicable)
- 📸 Photo Base64 (si uploadée)

### **Commentaire final mission** (NOUVEAU)
- 💬 Synthèse générale centrale
- 📸 Photos générales contexte

### **Galerie photos**
- 📸 Photos checklist items
- 📸 Photos générales mission
- 📸 Photos JSON V4 (si uploadé)

### **Bouton impression**
- 🖨️ **Bouton "Imprimer PDF"** (fixe haut droite)
- Format A4 optimisé
- Marges 1.5cm

---

## 🖨️ EXPORT PDF

### **Méthode navigateur (SIMPLE)**

1. Ouvrir rapport : `/api/ordres-mission/:id/rapport-final`
2. Cliquer **bouton bleu "🖨️ Imprimer PDF"** (haut droite)
3. Sélectionner **"Enregistrer au format PDF"**
4. Nom fichier : `Rapport_Audit_[Centrale]_[Date].pdf`
5. Sauvegarder

### **Méthode raccourci clavier**

- **Windows/Linux** : `Ctrl + P` → "Enregistrer PDF"
- **Mac** : `Cmd + P` → "Enregistrer PDF"

### **Paramètres impression recommandés**

- Format : **A4**
- Marges : **1.5 cm**
- Couleur : **Activée** (pour photos)
- Échelle : **100%** (ajuster si nécessaire)
- Inclure arrière-plans : **Oui**

---

## 🔗 LISTE COMPLÈTE LIENS RAPPORTS 52 MISSIONS

### **Missions prioritaires (en cours)**

| ID | Centrale | Progression | Lien Rapport |
|----|----------|-------------|--------------|
| **9** | Burgat Et Fils Tp | 29/40 (72%) | [📄 Rapport](https://0da64170.girasole-diagpv.pages.dev/api/ordres-mission/9/rapport-final) |
| **46** | Commune De Pomas | 33/40 (82%) | [📄 Rapport](https://0da64170.girasole-diagpv.pages.dev/api/ordres-mission/46/rapport-final) |

### **Toutes les missions (1-52)**

```
Mission 1:  https://0da64170.girasole-diagpv.pages.dev/api/ordres-mission/1/rapport-final
Mission 2:  https://0da64170.girasole-diagpv.pages.dev/api/ordres-mission/2/rapport-final
Mission 3:  https://0da64170.girasole-diagpv.pages.dev/api/ordres-mission/3/rapport-final
Mission 4:  https://0da64170.girasole-diagpv.pages.dev/api/ordres-mission/4/rapport-final
Mission 5:  https://0da64170.girasole-diagpv.pages.dev/api/ordres-mission/5/rapport-final
Mission 6:  https://0da64170.girasole-diagpv.pages.dev/api/ordres-mission/6/rapport-final
Mission 7:  https://0da64170.girasole-diagpv.pages.dev/api/ordres-mission/7/rapport-final
Mission 8:  https://0da64170.girasole-diagpv.pages.dev/api/ordres-mission/8/rapport-final
Mission 9:  https://0da64170.girasole-diagpv.pages.dev/api/ordres-mission/9/rapport-final
Mission 10: https://0da64170.girasole-diagpv.pages.dev/api/ordres-mission/10/rapport-final
...
Mission 52: https://0da64170.girasole-diagpv.pages.dev/api/ordres-mission/52/rapport-final
```

---

## 🚀 AMÉLIORATION FUTURE : BOUTON "VOIR RAPPORT"

### **À ajouter dans audit.js**

Après `finishAudit()`, rediriger vers rapport :

```javascript
async function finishAudit() {
  // ... code existant ...
  
  if (window.confirm('Marquer la mission comme TERMINÉE ?')) {
    try {
      await fetch(`/api/ordres-mission/${missionId}/statut`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ statut: 'TERMINE' })
      });
      
      // NOUVEAU : Proposer de voir le rapport
      if (window.confirm('✅ Mission terminée !\n\n📄 Voulez-vous consulter le rapport final ?')) {
        window.location.href = `/api/ordres-mission/${missionId}/rapport-final`;
      } else {
        window.location.href = '/';
      }
      
    } catch (error) {
      alert('Erreur mise à jour statut');
      console.error(error);
    }
  }
}
```

---

## 📞 EXEMPLES UTILISATION

### **Cas 1 : Audit terrain terminé**

1. Terminer audit Mission 46 (Pomas)
2. Cliquer **"✅ Terminer"** (header)
3. Confirmer → Mission TERMINÉE
4. Ouvrir rapport : `/api/ordres-mission/46/rapport-final`
5. Cliquer **"🖨️ Imprimer PDF"**
6. Sauvegarder : `Rapport_Pomas_2025-11-25.pdf`

### **Cas 2 : Consultation bureau**

1. Ouvrir Dashboard
2. Onglet **"📋 Missions"**
3. Chercher "Burgat"
4. Cliquer **Mission 9**
5. Lien direct : `/api/ordres-mission/9/rapport-final`

### **Cas 3 : QR Code papier**

1. Scanner QR Code ordre de mission
2. Ouvre : `/ordre-mission/46`
3. Bouton bas de page : **"📄 Voir Rapport Final"**
4. Export PDF disponible

---

## 🔧 STATUT ACTUEL SYSTÈME

### ✅ **Fonctionnel**
- Route API `/api/ordres-mission/:id/rapport-final`
- Génération HTML rapport complet
- Bouton impression PDF
- Statistiques conformité
- Checklist détaillée avec photos
- Format A4 optimisé

### 🔜 **À améliorer** (optionnel)
- Bouton "Voir Rapport" dans header audit
- Lien rapport dans liste missions
- Email automatique PDF client
- Génération PDF serveur (wkhtmltopdf)

---

## 📧 CONTACT SUPPORT

Questions/bugs : **adrien@diagpv.fr**

---

**RÉSUMÉ RAPIDE** :

**URL Rapport = `https://0da64170.girasole-diagpv.pages.dev/api/ordres-mission/:id/rapport-final`**

Remplacer `:id` par le numéro de mission (1-52).

**Exemples** :
- Mission 9 : `/api/ordres-mission/9/rapport-final`
- Mission 46 : `/api/ordres-mission/46/rapport-final`

Bouton **"🖨️ Imprimer PDF"** en haut à droite du rapport.
