# 📱 GUIDE AUDIT TERRAIN MOBILE - CHECKLIST & PHOTOS

**Pour:** Techniciens DiagPV sur le terrain  
**Interface:** PWA Mobile (smartphone/tablette)

---

## 🚀 DÉMARRAGE AUDIT - WORKFLOW COMPLET

### **Étape 1: Attribution Planning (Bureau DiagPV)**

**Qui:** Adrien via Planning Manager  
**URL:** https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/planning-manager

**Actions:**
1. Ouvrir Planning Manager
2. Sélectionner centrale (ex: "Hangar Maxime Bayle")
3. Remplir :
   - Sous-Traitant : `DiagPV Solutions`
   - Technicien : `Jean Dupont`
   - Date mission : `2025-01-27`
4. **Auto-save** → Mission créée + Checklist 54 points initialisée
5. Badge vert `✓ 54/54` s'affiche

**Résultat:** Mission ID créé (ex: mission_id = 7)

---

### **Étape 2: Communication Mission au Technicien**

**Qui:** Adrien envoie au technicien

**3 Méthodes possibles:**

#### **Méthode 1: URL Directe (RECOMMANDÉE)**
```
https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/audit/7
```
- Remplacer `7` par le mission_id
- Le technicien ouvre sur smartphone
- Checklist 54 points chargée instantanément

#### **Méthode 2: QR Code (À IMPLÉMENTER)**
```
Générer QR Code de l'URL /audit/:mission_id
Le technicien scanne avec smartphone
```

#### **Méthode 3: Email/SMS**
```
Objet: Mission Audit - Hangar Maxime Bayle - 27/01/2025
Corps:
Bonjour Jean,

Votre mission d'audit est prête :
📍 Centrale: Hangar Maxime Bayle
📅 Date: 27/01/2025 à 08:00
📋 Checklist: 54 points de contrôle
📸 Photos: Requises pour anomalies

Lien audit mobile:
https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/audit/7

Bonne mission,
DiagPV
```

---

### **Étape 3: Ouverture Interface Mobile Audit**

**Qui:** Technicien sur le terrain  
**Appareil:** Smartphone/tablette avec caméra + GPS

**Actions technicien:**

1. **Ouvrir URL** `/audit/7` sur smartphone
2. **Interface chargée** :
   ```
   ╔═══════════════════════════════════════╗
   ║  AUDIT TERRAIN - DIAGPV              ║
   ║  📍 Hangar Maxime Bayle              ║
   ║  📅 27/01/2025 - Mission #7          ║
   ║  👤 Jean Dupont                       ║
   ╠═══════════════════════════════════════╣
   ║  Progression: 0/54 ████░░░░░░░  0%  ║
   ╚═══════════════════════════════════════╝
   
   📋 CATÉGORIES:
   
   [ ] DOC (8 points)
   [ ] ELEC (12 points)
   [ ] TABLEAUX (8 points)
   [ ] CABLAGE (7 points)
   [ ] MODULES (10 points)
   [ ] STRUCTURES (5 points)
   [ ] TOITURE (4 points)
   
   [Démarrer Audit] 🚀
   ```

3. **Cliquer "Démarrer Audit"**

---

### **Étape 4: Réaliser Checklist Catégorie par Catégorie**

#### **Exemple Catégorie DOC (8 points):**

**Interface affichée:**
```
╔═══════════════════════════════════════╗
║  📄 CATÉGORIE: DOC (1/7)             ║
║  Progression: 0/8 points             ║
╚═══════════════════════════════════════╝

┌─────────────────────────────────────┐
│ 1/8: Plaques signalétiques modules │
├─────────────────────────────────────┤
│ Vérifier présence et lisibilité     │
│ plaques fabricant sur modules PV    │
│                                     │
│ Statut:                             │
│ ○ CONFORME                          │
│ ○ NON_CONFORME                      │
│ ○ A_VERIFIER                        │
│ ○ NON_APPLICABLE                    │
│                                     │
│ 📸 Ajouter Photo (optionnel)        │
│ 💬 Commentaire (si anomalie)        │
│                                     │
│ [Suivant ➡️]                        │
└─────────────────────────────────────┘
```

**Actions technicien pour CHAQUE point:**

1. **Vérifier le point** sur site
2. **Sélectionner statut** :
   - ✅ `CONFORME` : OK, conforme norme
   - ❌ `NON_CONFORME` : Anomalie détectée
   - ⚠️ `A_VERIFIER` : Doute, à approfondir
   - 🚫 `NON_APPLICABLE` : Point non concerné

3. **Si NON_CONFORME ou A_VERIFIER** :
   - **📸 Cliquer "Ajouter Photo"**
   - Smartphone ouvre caméra
   - Prendre photo de l'anomalie
   - Photo stockée en **base64** en DB
   - **💬 Ajouter commentaire** : "Plaque fabricant effacée module n°12"

4. **Cliquer "Suivant"** → Auto-save immédiat en DB

5. **Répéter pour les 8 points** de la catégorie DOC

---

#### **Interface Capture Photo:**

```
╔═══════════════════════════════════════╗
║  📸 CAPTURE PHOTO                    ║
║  Point: Plaques signalétiques        ║
╚═══════════════════════════════════════╝

[📷 Caméra du smartphone activée]

┌─────────────────────────────────────┐
│                                     │
│      [Vue caméra en temps réel]     │
│                                     │
│                                     │
└─────────────────────────────────────┘

📍 GPS: 43.30401, 2.07536 (auto)
📅 Date: 27/01/2025 14:23
👤 Tech: Jean Dupont

[Prendre Photo 📷] [Annuler ❌]
```

**Après capture:**
```
✅ Photo enregistrée
- Taille: 245 KB
- Format: image/jpeg
- GPS intégré
- Stockage: base64 en DB

💬 Commentaire (optionnel):
┌─────────────────────────────────────┐
│ Plaque fabricant illisible module 12│
│ Corrosion avancée                   │
└─────────────────────────────────────┘

[Enregistrer ✓] [Retour ←]
```

---

### **Étape 5: Progression Temps Réel**

**Interface principale mise à jour automatiquement:**

```
╔═══════════════════════════════════════╗
║  AUDIT TERRAIN - DIAGPV              ║
║  📍 Hangar Maxime Bayle              ║
╠═══════════════════════════════════════╣
║  Progression: 8/54 ████░░░░░░░  15% ║
╚═══════════════════════════════════════╝

📋 CATÉGORIES:

[✓] DOC (8/8) ✅
[ ] ELEC (0/12)
[ ] TABLEAUX (0/8)
[ ] CABLAGE (0/7)
[ ] MODULES (0/10)
[ ] STRUCTURES (0/5)
[ ] TOITURE (0/4)

[Continuer Audit ➡️]
```

---

### **Étape 6: Catégorie ELEC (Mesures Électriques)**

**Interface avec champs de mesure:**

```
┌─────────────────────────────────────┐
│ 1/12: Mesure tension Voc strings    │
├─────────────────────────────────────┤
│ Mesurer tension circuit ouvert (Voc)│
│ de chaque string avec multimètre    │
│                                     │
│ 📊 Valeur mesurée:                  │
│ ┌─────────┐ Volts (V)               │
│ │  [852]  │                         │
│ └─────────┘                         │
│                                     │
│ Statut:                             │
│ ○ CONFORME (si > 800V)              │
│ ○ NON_CONFORME (si < 800V)          │
│                                     │
│ 📸 Ajouter Photo multimètre         │
│ 💬 Commentaire                       │
│                                     │
│ [Suivant ➡️]                        │
└─────────────────────────────────────┘
```

**Technicien:**
1. Mesure avec multimètre
2. Entre valeur : `852` V
3. Sélectionne `CONFORME`
4. (Optionnel) Photo écran multimètre
5. Clic "Suivant" → Auto-save

**Données sauvegardées en DB:**
```json
{
  "ordre_mission_id": 7,
  "categorie": "ELEC",
  "item_numero": 1,
  "item_texte": "Mesure tension Voc strings",
  "statut": "CONFORME",
  "mesure_valeur": 852,
  "mesure_unite": "V",
  "photo_base64": "data:image/jpeg;base64,/9j/4AAQ...",
  "commentaire": null,
  "technicien_nom": "Jean Dupont",
  "date_modification": "2025-01-27 14:35:22"
}
```

---

### **Étape 7: Catégorie MODULES (Thermographie)**

**Interface avec anomalie détectée:**

```
┌─────────────────────────────────────┐
│ 5/10: Hotspots thermographie        │
├─────────────────────────────────────┤
│ Inspection thermographique modules  │
│ Recherche échauffements (ΔT > 10°C) │
│                                     │
│ 🌡️ ΔT max détecté:                  │
│ ┌─────────┐ °C                      │
│ │  [18.5] │                         │
│ └─────────┘                         │
│                                     │
│ Statut:                             │
│ ○ CONFORME (ΔT < 10°C)              │
│ ● NON_CONFORME (ΔT > 10°C) ⚠️      │
│                                     │
│ 📸 Photo thermographie (REQUISE)    │
│ [📷 Capturer]                       │
│                                     │
│ 💬 Commentaire (REQUIS):            │
│ ┌───────────────────────────────┐   │
│ │ Hotspot 18.5°C module B7      │   │
│ │ Diode by-pass probable HS     │   │
│ │ Cellule affectée visible      │   │
│ └───────────────────────────────┘   │
│                                     │
│ [Enregistrer ✓]                     │
└─────────────────────────────────────┘
```

**Actions technicien:**
1. Utilise caméra thermique
2. Détecte hotspot 18.5°C
3. Sélectionne `NON_CONFORME`
4. **Photo thermographie OBLIGATOIRE**
5. Commente l'anomalie
6. Enregistre → Photo + Mesure + Commentaire en DB

---

### **Étape 8: Finalisation Audit**

**Une fois 54/54 points complétés:**

```
╔═══════════════════════════════════════╗
║  ✅ AUDIT TERMINÉ                    ║
║  📍 Hangar Maxime Bayle              ║
╠═══════════════════════════════════════╣
║  Progression: 54/54 ██████████ 100% ║
╚═══════════════════════════════════════╝

📊 RÉSUMÉ:

✅ CONFORME: 48 points
❌ NON_CONFORME: 4 points
⚠️ A_VERIFIER: 2 points
🚫 NON_APPLICABLE: 0 points

📸 Photos: 6 capturées
💬 Commentaires: 6 renseignés

┌─────────────────────────────────────┐
│ ⚠️ ANOMALIES MAJEURES:              │
├─────────────────────────────────────┤
│ • Hotspot 18.5°C module B7 (ELEC)   │
│ • Plaque fabricant illisible (DOC)  │
│ • MC4 dessérés string 3 (CABLAGE)   │
│ • Corrosion rails sud (STRUCTURES)  │
└─────────────────────────────────────┘

🔒 [Verrouiller & Envoyer] ✅

⚠️ Attention: Une fois verrouillé, 
l'audit ne peut plus être modifié.
```

**Technicien clique "Verrouiller & Envoyer":**
1. Audit marqué `TERMINE` en DB
2. Notification envoyée à DiagPV
3. Rapport auto-généré (PDF)
4. Photos synchronisées

---

### **Étape 9: Consultation Résultats (Bureau DiagPV)**

**Adrien consulte depuis Dashboard:**

**URL:** `https://3000-ifb38209wujb1luk88o0l-6532622b.e2b.dev/`

```
╔═══════════════════════════════════════╗
║  DASHBOARD MISSIONS                  ║
╚═══════════════════════════════════════╝

┌─────────────────────────────────────┐
│ Mission #7 - Hangar Maxime Bayle    │
│ ✅ TERMINÉ - 27/01/2025             │
│ 👤 Jean Dupont                       │
├─────────────────────────────────────┤
│ ✅ Conforme: 48/54 (89%)            │
│ ❌ Non-conforme: 4 (7%)             │
│ ⚠️ À vérifier: 2 (4%)               │
│ 📸 Photos: 6                        │
├─────────────────────────────────────┤
│ [📄 Voir Rapport] [📸 Galerie Photos]│
│ [📊 Analyse Détaillée]              │
└─────────────────────────────────────┘
```

**Clic "Voir Rapport" → PDF généré:**
- Page 1: Synthèse mission
- Pages 2-8: Détail 7 catégories
- Photos insérées à côté des anomalies
- Préconisations automatiques

---

## 🔧 FONCTIONNALITÉS TECHNIQUES

### **Auto-Save Temps Réel**
- Chaque point validé → Sauvegarde immédiate DB
- Pas de perte de données si perte connexion
- Reprise audit possible à tout moment

### **Mode Hors-Ligne (PWA)**
- Service Worker cache l'interface
- Données stockées en LocalStorage
- Synchronisation automatique au retour réseau

### **Capture Photo Optimisée**
- Compression automatique (max 500 KB)
- Format JPEG
- Stockage base64 en DB
- GPS embarqué dans métadonnées

### **Sécurité**
- URL audit unique par mission
- Verrouillage après finalisation
- Horodatage de chaque action
- Traçabilité complète

---

## 📊 SCHÉMA BASE DE DONNÉES

```sql
-- Table checklist_items (1 ligne = 1 point checklist)
CREATE TABLE checklist_items (
  id INTEGER PRIMARY KEY,
  ordre_mission_id INTEGER,           -- Lien mission
  categorie TEXT,                     -- DOC, ELEC, etc.
  item_numero INTEGER,                -- 1 à 54
  item_texte TEXT,                    -- "Mesure Voc..."
  statut TEXT DEFAULT 'NON_VERIFIE', -- CONFORME/NON_CONFORME...
  conformite INTEGER,                 -- 0 ou 1
  commentaire TEXT,                   -- Remarques technicien
  photo_base64 TEXT,                  -- Photo en base64
  photo_filename TEXT,                -- Nom fichier
  mesure_valeur REAL,                 -- Ex: 852 (pour Voc)
  mesure_unite TEXT,                  -- Ex: 'V'
  technicien_nom TEXT,                -- Jean Dupont
  date_creation DATETIME,
  date_modification DATETIME
);

-- 54 lignes créées automatiquement à l'attribution planning
```

---

## ✅ CHECKLIST DÉMARRAGE AUDIT

**Avant de partir sur site:**

- [ ] Mission attribuée dans Planning Manager
- [ ] URL audit envoyée au technicien (ex: `/audit/7`)
- [ ] Smartphone chargé + connexion data
- [ ] Appareils mesure : Multimètre, Caméra thermique
- [ ] Badge vert `✓ 54/54` visible dans Planning Manager

**Sur site:**

- [ ] Ouvrir URL `/audit/:mission_id`
- [ ] Vérifier centrale affichée correcte
- [ ] Démarrer catégorie par catégorie
- [ ] Photographier TOUTES les anomalies
- [ ] Commenter les non-conformités
- [ ] Vérifier progression 54/54 à 100%
- [ ] Verrouiller & Envoyer

**Après audit:**

- [ ] Rapport PDF généré automatiquement
- [ ] Photos consultables dans Dashboard
- [ ] Mission marquée `TERMINE` dans Planning Manager

---

## 🎯 RÉSUMÉ EXPRESS

**3 ÉTAPES SIMPLES:**

1. **Adrien (Bureau)**: Attribue mission → URL `/audit/7` générée
2. **Technicien (Terrain)**: Ouvre URL → Remplit 54 points + Photos
3. **Système**: Auto-save → Rapport PDF → Dashboard mis à jour

**TOUT EST AUTOMATIQUE. ZÉRO SAISIE MANUELLE.**

---

*Guide créé le 2025-01-22 - DiagPV Audit Terrain Mobile v2.0*
