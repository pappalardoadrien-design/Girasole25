# 🔗 Liens d'Accès GIRASOLE PROD - Version 2.5.3

**Date de déploiement** : 01/12/2025  
**Version** : v2.5.3 (Suppression localStorage + Checklist toiture 31 items)  
**URL Production** : https://girasole-diagpv.pages.dev  
**Déploiement** : https://8f2729cf.girasole-diagpv.pages.dev

---

## 🔐 URL ADMIN

### **Adrien PAPPALARDO (ADMIN)**
- **URL** : https://girasole-diagpv.pages.dev/s/u8ejmUtdA2UPx8n06Px1v8Mzu8ziOs5x
- **Rôle** : Administrateur complet
- **Accès** : 
  - ✅ Voir **52 centrales** (toutes)
  - ✅ Voir **52 missions** (toutes)
  - ✅ Dashboard complet (stats + graphiques)
  - ✅ Gestion attributions centrales/sous-traitants
  - ✅ Accès toutes fonctionnalités

---

## 👷 URLs SOUS-TRAITANTS (7 actifs)

### **1. ARTEMIS**
- **URL** : https://girasole-diagpv.pages.dev/s/W-v8c-SVL7-XzF-xBvwH9BtfPyGoii6x
- **Contact** : LOIC
- **Missions attribuées** : 15 centrales
- **Accès restreint** : Voir uniquement ses 15 centrales

---

### **2. CADENET**
- **URL** : https://girasole-diagpv.pages.dev/s/FMupE3hHXF_rgVz_jovYZB7vtkcQ3opF
- **Contact** : Contact CADENET
- **Missions attribuées** : 6 centrales
- **Départements** : 26, 7, 3, 71
- **Accès restreint** : Voir uniquement ses 6 centrales

---

### **3. COURTIADE DISTRIB**
- **URL** : https://girasole-diagpv.pages.dev/s/G379vToAdqZdpqif43M7O8fBYVjYkPOu
- **Contact** : Courtiade (jy.courtiade@gascogne-nouvelles-energies.fr)
- **Téléphone** : 0689630513
- **Entreprise** : Gascogne Nouvelles Energies
- **Missions attribuées** : 1 centrale
- **Accès restreint** : Voir uniquement sa 1 centrale

---

### **4. DIAGPV - Adrien & Fabien**
- **URL** : https://girasole-diagpv.pages.dev/s/wtYrujaywSTfOgalNhzQ3Pe3FHNqiVOv
- **Contact** : Adrien (adrien@diagpv.fr)
- **Missions attribuées** : 15 centrales
- **Accès restreint** : Voir uniquement ses 15 centrales

---

### **5. DRONE AVEYRON SERVICE**
- **URL** : https://girasole-diagpv.pages.dev/s/3W-dQ-9TOBzb92Nk_NoSSVc9dbGNkitj
- **Contact** : À compléter
- **Département** : 12 (Aveyron)
- **Missions attribuées** : 2 centrales
- **Notes** : Devis envoyé
- **Accès restreint** : Voir uniquement ses 2 centrales

---

### **6. EDOUARD - Martial**
- **URL** : https://girasole-diagpv.pages.dev/s/WXBVyrYlC_SSym0omGSOwU5-4S3-VPWD
- **Contact** : Martial Edouard
- **Téléphone** : 0683878552
- **Localisation** : Dompierre sur Mer
- **Missions attribuées** : 7 centrales
- **Accès restreint** : Voir uniquement ses 7 centrales

---

### **7. En attente attribution**
- **URL** : https://girasole-diagpv.pages.dev/s/BE9zxULmY8HbXalHU4KgKght1MpzPwvk
- **Contact** : N/A
- **Département** : 23 (Creuse)
- **Missions attribuées** : 6 centrales
- **Notes** : Recherche sous-traitant local en cours
- **Accès restreint** : Voir uniquement les 6 centrales en attente

---

## 📊 Récapitulatif Répartition

| Sous-traitant              | Centrales | % Total |
|----------------------------|-----------|---------|
| ARTEMIS                    | 15        | 28.8%   |
| DIAGPV - Adrien & Fabien   | 15        | 28.8%   |
| EDOUARD - Martial          | 7         | 13.5%   |
| CADENET                    | 6         | 11.5%   |
| En attente attribution     | 6         | 11.5%   |
| DRONE AVEYRON SERVICE      | 2         | 3.8%    |
| COURTIADE DISTRIB          | 1         | 1.9%    |
| **TOTAL**                  | **52**    | **100%**|

---

## 🔒 Règles de Sécurité

### **Distribution des URLs**
1. ✅ **Envoyer 1 URL unique par sous-traitant** via email sécurisé
2. ❌ **NE JAMAIS partager l'URL ADMIN** avec sous-traitants
3. ✅ Chaque URL est **liée à un sous-traitant spécifique**
4. ✅ URLs valides **indéfiniment** (pas d'expiration)
5. ⚠️ Si URL compromise → **Révoquer** et **régénérer nouveau token**

### **Contrôles d'Accès**
- **ADMIN** : Accès total (52 centrales, toutes missions)
- **Sous-traitants** : Accès filtré uniquement à leurs centrales/missions
- **Isolation totale** : Sous-traitant A ne voit PAS les centrales de B
- **Logs d'activité** : Toutes actions tracées dans `activity_logs`

### **Protection des Données**
- ✅ **Tokens 32 caractères** aléatoires sécurisés
- ✅ **Session cookies** HTTP-only
- ✅ **Filtrage SQL** automatique par `sous_traitant_id`
- ✅ **Aucune modification croisée** entre sous-traitants
- ✅ **100% Cloudflare D1** (zéro localStorage, zéro local)

---

## 📧 Modèle Email Distribution

```
Objet : [GIRASOLE] Accès Plateforme Audits Photovoltaïques

Bonjour [NOM_SOUS_TRAITANT],

Voici votre lien d'accès personnel à la plateforme GIRASOLE pour vos audits photovoltaïques :

🔗 Lien d'accès : https://girasole-diagpv.pages.dev/s/[TOKEN]

📋 Informations importantes :
- Centrales attribuées : [NB_CENTRALES]
- Ce lien est unique et confidentiel
- Accès permanent (pas d'expiration)
- Vous verrez uniquement vos centrales/missions

⚠️ Sécurité :
- Ne partagez PAS ce lien
- Marquez-le en favori dans votre navigateur
- Contactez-nous en cas de problème d'accès

Support technique : adrien@diagpv.fr

Cordialement,
L'équipe GIRASOLE DiagPV
```

---

## ✅ Vérifications Post-Déploiement

### **Checklist Validation**
- [x] Déploiement PROD : https://girasole-diagpv.pages.dev ✅ HTTP 200
- [x] Webapp opérationnelle (86KB, 102ms)
- [x] 8 tokens actifs (1 ADMIN + 7 SOUS-TRAITANTS)
- [x] Filtrage sous-traitants fonctionnel
- [x] ZÉRO localStorage (vérification DevTools)
- [x] 52 centrales + 52 missions en DB
- [x] Checklist toiture 31 items opérationnelle
- [x] 2080 checklist items + 28 toiture conservés
- [x] 8 photos + 21 commentaires conservés

### **Tests PROD recommandés**
1. Tester URL ADMIN → Voir 52 centrales
2. Tester URL ARTEMIS → Voir 15 centrales (filtrées)
3. Vérifier DevTools → Application → Local Storage = **VIDE**
4. Créer nouvelle mission toiture → Vérifier 31 items générés

---

## 🆕 Nouveautés Version 2.5.3

### **Changements Majeurs**
- ✅ **Suppression totale localStorage** (même brouillons)
- ✅ **780 lignes code supprimées** (4 routes localStorage)
- ✅ **Architecture 100% Cloudflare D1** distant
- ✅ **Checklist toiture 31 items** (contrôles terrain uniquement)
- ✅ **ZÉRO perte données** (2,189 enregistrements vérifiés)

### **Garanties**
- ✅ Toutes données missions existantes **intactes**
- ✅ Photos et commentaires **conservés**
- ✅ Authentification et filtrage **fonctionnels**
- ✅ APIs temps réel **100% opérationnelles**

---

## 📞 Support

**Contact technique** : adrien@diagpv.fr  
**Plateforme** : https://girasole-diagpv.pages.dev  
**Documentation** : GitHub - Girasole25  
**Version** : v2.5.3 (01/12/2025)

---

**Développé par** : DiagPV Assistant  
**Pour** : Adrien PAPPALARDO (GIRASOLE DiagPV)  
**Déploiement** : Cloudflare Pages (Edge Network)
