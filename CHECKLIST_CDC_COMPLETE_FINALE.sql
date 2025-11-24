-- ═══════════════════════════════════════════════════════════════════════════════
-- CHECKLIST COMPLÈTE CDC GIRASOLE 2025 - VERSION FINALE
-- ═══════════════════════════════════════════════════════════════════════════════
-- Source: PERF-CDC-001-CDC_AUDIT_QUALITE_2025_INSTALLATIONS_PV-001.pdf
-- Type: AUDIT VISUEL (tous) + TOITURE (suppléments si applicable)
-- ═══════════════════════════════════════════════════════════════════════════════

-- ============================================================================
-- PARTIE 1 : AUDIT VISUEL (40 POINTS) - POUR TOUTES LES CENTRALES
-- ============================================================================

-- 📄 1. DOCUMENTATION (10 points) - CDC 2.4 Prescriptions GIRASOLE
-- Point 1-10 : Vérification complète documentation réglementaire et GIRASOLE

-- 📄 Point 1 : Plaques signalétiques modules PV
--   Vérifier : lisibilité, présence, conformité modèle installé
--   Photo obligatoire : OUI

-- 📄 Point 2 : Plaque signalétique onduleur(s)
--   Vérifier : identification, caractéristiques techniques, numéro série
--   Photo obligatoire : OUI

-- 📄 Point 3 : Schéma électrique unifilaire (TQC)
--   Vérifier : conformité réalisation, mise à jour, présence sur site
--   CDC 2.5 : Plans TQC présent sur place
--   Photo obligatoire : OUI

-- 📄 Point 4 : Plan d'implantation modules
--   Vérifier : conforme au réalisé, repérage strings visible
--   Photo obligatoire : OUI

-- 📄 Point 5 : Attestation Consuel
--   Vérifier : présente, valide, date mise en service
--   Photo obligatoire : OUI

-- 📄 Point 6 : Contrat de raccordement ENEDIS
--   Vérifier : présent, signé, numéro PDL correct
--   Photo obligatoire : OUI

-- 📄 Point 7 : Attestation DRE du Bureau de Contrôle
--   Vérifier : présente, signée, visa favorable
--   CDC 2.6 : Fournie par bureau de contrôle
--   Photo obligatoire : OUI

-- 📄 Point 8 : PV de réception lot PV signé GIRASOLE + installateur
--   Vérifier : présent, signé par les 2 parties, date
--   CDC 2.4 : Prescription GIRASOLE obligatoire
--   Photo obligatoire : OUI

-- 📄 Point 9 : Compte-rendu visite chantier GIRASOLE (au moins 1)
--   Vérifier : présent, signé, observations relevées
--   CDC 2.4 : Au moins un CR exigé
--   Photo obligatoire : OUI

-- 📄 Point 10 : Autocontrôle installateur correctement renseigné
--   Vérifier : présent, complet, valeurs cohérentes
--   CDC 2.4 : Document obligatoire GIRASOLE
--   Photo obligatoire : OUI

-- ⚡ 2. CONTRÔLES ÉLECTRIQUES DC (8 points) - Normes IEC 62446-1, UTE C 15-712-1
-- Point 11-18 : Mesures et vérifications côté continu

-- ⚡ Point 11 : Tension Voc à vide par string (mesure)
--   Mesurer : Voc de chaque string à vide
--   Comparer : valeurs théoriques (datasheet modules x nb modules)
--   Écart acceptable : ±5%
--   Photo obligatoire : OUI (multimètre + valeur)

-- ⚡ Point 12 : Courant Isc court-circuit par string
--   Mesurer : Isc de chaque string
--   Comparer : valeurs théoriques, cohérence entre strings
--   Écart acceptable : ±10% entre strings identiques
--   Photo obligatoire : OUI (multimètre + valeur)

-- ⚡ Point 13 : Polarité connexions DC (+ / -)
--   Vérifier : respect polarité, couleurs câbles (rouge +, noir/bleu -)
--   CDC 2.5 : Couleurs câbles DC -/+ différents
--   Photo obligatoire : OUI

-- ⚡ Point 14 : Test isolement DC (≥1 MΩ selon IEC 62446-1)
--   Mesurer : isolement pôle + vers terre, pôle - vers terre
--   Valeur minimale : 1 MΩ (1000 kΩ)
--   Photo obligatoire : OUI (mégohmmètre + valeur)

-- ⚡ Point 15 : Continuité terre/masses (< 2Ω selon NF C 15-100)
--   Mesurer : résistance liaison équipotentielle
--   Valeur maximale : 2Ω
--   Photo obligatoire : OUI (ohmmètre + valeur)

-- ⚡ Point 16 : État connecteurs MC4
--   Vérifier : serrages corrects, étanchéité, compatibilité mâle/femelle
--   CDC 2.5 : Contrôle raccordements, compatibilité connecteurs
--   Photo obligatoire : OUI (gros plan connecteurs)

-- ⚡ Point 17 : Serrage bornes onduleur DC
--   Vérifier : couple de serrage conforme notice constructeur
--   CDC 2.5 : Serrage bornes (couple)
--   Photo obligatoire : OUI

-- ⚡ Point 18 : Protection surtensions DC
--   Vérifier : présence parafoudre DC, calibre adapté, voyant OK
--   Photo obligatoire : OUI

-- 🔌 3. CONTRÔLES ÉLECTRIQUES AC (6 points) - Normes NF C 15-100, UTE C 15-712-1
-- Point 19-24 : Mesures et vérifications côté alternatif

-- 🔌 Point 19 : Tension réseau AC
--   Mesurer : tension phases, déséquilibre phases (si triphasé)
--   Valeurs attendues : 230V ±10% (mono), 400V ±10% (tri)
--   Photo obligatoire : OUI (multimètre + valeur)

-- 🔌 Point 20 : Protection différentielle 30mA type A
--   Vérifier : présence, type A obligatoire (PV), test bouton
--   Photo obligatoire : OUI

-- 🔌 Point 21 : Serrage bornes AGCP
--   Vérifier : couple conforme, repérage phases/neutre/terre
--   CDC 2.5 : Repérage serrage connexions câbles AC
--   Photo obligatoire : OUI

-- 🔌 Point 22 : Réglages AGCP conformes aux plans
--   Vérifier : calibres disjoncteurs, sélectivité
--   CDC 2.5 : Réglages AGCP conforme aux plans
--   Photo obligatoire : OUI

-- 🔌 Point 23 : Fonctionnement onduleur(s)
--   Vérifier : injection réseau, monitoring actif, codes erreur
--   Photo obligatoire : OUI (écran onduleur)

-- 🔌 Point 24 : Production instantanée (mesure cohérence PR)
--   Mesurer : puissance instantanée, comparer à l'attendu (irradiance)
--   Calculer : Performance Ratio approximatif
--   Photo obligatoire : OUI (écran production)

-- 📷 4. INSPECTIONS VISUELLES MODULES (5 points) - CDC 2.5 Bonnes/mauvaises pratiques
-- Point 25-29 : État visuel modules et installation

-- 📷 Point 25 : Constat visuel alignement modules PV
--   Vérifier : alignement tables, modules non décalés
--   CDC 2.5 : Constat visuel alignement modules PV
--   Photo obligatoire : OUI (vue d'ensemble)

-- 📷 Point 26 : Fixations modules (serrages, état SI)
--   Vérifier : brides serrées, écrous présents, pas de corrosion
--   Photo obligatoire : OUI (détail fixations)

-- 📷 Point 27 : Microfissures visibles (coins, cellules)
--   Vérifier : coins modules, cellules, pas de casse visible
--   Photo obligatoire : OUI si anomalie détectée

-- 📷 Point 28 : Salissures / ombrages proches
--   Vérifier : propreté modules, végétation proche, obstacles
--   Photo obligatoire : OUI si salissures importantes

-- 📷 Point 29 : Diodes by-pass accessibles (boîte jonction)
--   Vérifier : boîte de jonction accessible, pas de dégradation
--   Photo obligatoire : OUI

-- 🔧 5. CHEMINEMENT CÂBLES ET PROTECTIONS (8 points) - CDC 2.5 Liste exhaustive
-- Point 30-37 : Qualité installation câbles DC/AC

-- 🔧 Point 30 : Méthode et qualité fixations chemin de câbles
--   Vérifier : fixations solides, espacement régulier, pas de déformation
--   CDC 2.5 : Méthode et qualité de fixations du chemin de câbles
--   Photo obligatoire : OUI

-- 🔧 Point 31 : Type de cheminement (galvanisé à chaud / à froid)
--   Vérifier : type galvanisation, état corrosion
--   CDC 2.5 : Type cheminement câbles utilisé : galvanisé à chaud, à froid
--   Photo obligatoire : OUI

-- 🔧 Point 32 : Protections mécaniques câbles (bords saillants, TPC)
--   Vérifier : protection traversées, pas de contact bord coupant
--   CDC 2.5 : Protections mécaniques câbles, contact bord saillant
--   CDC 2.5 : Respect tranchée AC (Shelter vers PDL), rebouchage TPC
--   Photo obligatoire : OUI

-- 🔧 Point 33 : Rayons de courbure câbles AC et DC
--   Vérifier : respect rayon mini (constructeur), pas de coude forcé
--   CDC 2.5 : Contrôle rayons de courbure câbles AC et DC
--   Photo obligatoire : OUI si anomalie

-- 🔧 Point 34 : Repérage câbles (sérigraphié, manuscrit, tenant-aboutissant)
--   Vérifier : repérage présent, lisible, logique
--   CDC 2.5 : Type repérage câble ou filerie : sérigraphié, manuscrit
--   Photo obligatoire : OUI

-- 🔧 Point 35 : Qualité du brassage des câbles (ordre, maintien)
--   Vérifier : câbles rangés, colliers de maintien, pas de câbles pendants
--   CDC 2.5 : Qualité du brassage des câbles
--   Photo obligatoire : OUI

-- 🔧 Point 36 : Cheminement terre le long chemins câbles
--   Vérifier : terre continue, fixation (crapaud, bornier laiton)
--   CDC 2.5 : Cheminement terre : utilisation crapaud, bornier laiton
--   Photo obligatoire : OUI

-- 🔧 Point 37 : Cosses bimétal cuivre/alu (jonctions)
--   Vérifier : présence si jonction cuivre-aluminium
--   CDC 2.5 : Présence cosses bimétal lors jonction cuivre/alu
--   Photo obligatoire : OUI si présent

-- 🌍 6. MISE À LA TERRE ET ÉQUIPOTENTIALITÉ (3 points) - Norme NF C 15-100
-- Point 38-40 : Protection personnes et matériel

-- 🌍 Point 38 : Continuité liaison équipotentielle (structures, masses)
--   Vérifier : terre reliée structures métalliques, masses onduleur
--   Photo obligatoire : OUI

-- 🌍 Point 39 : Prise de terre dédiée PV (< 100Ω si exigé)
--   Mesurer : résistance prise de terre (si accessible)
--   Valeur cible : < 100Ω (contexte)
--   Photo obligatoire : OUI

-- 🌍 Point 40 : Repérage équipements et bornes terre
--   Vérifier : repérage présent, symbole terre visible
--   CDC 2.5 : Repérage équipements
--   Photo obligatoire : OUI

-- ============================================================================
-- PARTIE 2 : AUDIT TOITURE (12 POINTS SUPPLÉMENTAIRES) - SI APPLICABLE
-- ============================================================================
-- CDC 2.5 : Liste non exhaustive constats toiture + DTU 40.35

-- 🏠 7. SPÉCIFICITÉS AUDIT TOITURE (12 points)
-- Point 41-52 : Contrôles spécifiques installations en toiture

-- 🏠 Point 41 : Qualité et conformité montage/serrage SI sur support
--   Vérifier : fixations SI conformes DTU 40.35, étanchéité maintenue
--   CDC 2.5 : Qualité et conformité montage/serrage SI sur son support
--   Photo obligatoire : OUI

-- 🏠 Point 42 : Qualité et conformité montage/serrage panneau sur SI
--   Vérifier : brides serrées, modules bien fixés, pas de jeu
--   CDC 2.5 : Qualité et conformité montage/serrage panneau sur SI
--   Photo obligatoire : OUI

-- 🏠 Point 43 : Fixation cheminement câbles (supports, étanchéité)
--   Vérifier : fixations n'endommagent pas étanchéité, supports adaptés
--   CDC 2.5 : Contrôle fixation cheminement câbles (pertinence supports, maintien étanchéité)
--   Photo obligatoire : OUI

-- 🏠 Point 44 : Compatibilité connecteurs mâle/femelle (PVZH202B)
--   Vérifier : connecteurs compatibles, type PVZH202B ou équivalent
--   CDC 2.5 : Compatibilité connecteurs mâle/femelle (généralement PVZH202B)
--   Photo obligatoire : OUI

-- 🏠 Point 45 : Serrages connecteurs toiture (étanchéité, ruissellement)
--   Vérifier : connecteurs bien serrés, étanches, pas exposés ruissellement
--   CDC 2.5 : Serrages, étanchéités, exposition ruissellement
--   Photo obligatoire : OUI

-- 🏠 Point 46 : Cheminement câbles DC dans chemin de câble (qualité)
--   Vérifier : câbles bien rangés, pas de tension excessive
--   CDC 2.5 : Contrôle qualité cheminement câbles DC
--   Photo obligatoire : OUI

-- 🏠 Point 47 : Cheminement câbles (pas directement sur couverture)
--   Vérifier : câbles ne touchent pas tuiles/couverture directement
--   CDC 2.5 : Contrôle qualité cheminement (pas cheminement direct sur couverture)
--   Photo obligatoire : OUI si anomalie

-- 🏠 Point 48 : Raccordement des terres en toiture (continuité SI → structure)
--   Vérifier : terre reliée SI, continuité jusqu'à AGCP
--   CDC 2.5 : Raccordement des terres
--   Photo obligatoire : OUI

-- 🏠 Point 49 : Repérage câbles toiture (tenant-aboutissant, sérigraphié)
--   Vérifier : repérage lisible, logique, résistant UV
--   CDC 2.5 : Type repérage câbles : tenant-aboutissant, sérigraphié, manuscrit
--   Photo obligatoire : OUI

-- 🏠 Point 50 : Étiquettes réglementaires tension DC (présence, visibilité)
--   Vérifier : étiquettes "DANGER TENSION DC" présentes, visibles
--   CDC 2.5 : Présence étiquettes réglementaires indiquant présence tension DC
--   Photo obligatoire : OUI

-- 🏠 Point 51 : Étanchéité traversées toiture (fourreaux, passe-câbles)
--   Vérifier : traversées étanches, rebouchage correct, matériaux adaptés
--   CDC 2.5 : Rebouchage entrée/sortie fourreaux (TPC), matériaux utilisés
--   Photo obligatoire : OUI

-- 🏠 Point 52 : État général couverture (tuiles, fixations, zones intervention)
--   Vérifier : pas de tuiles cassées, zones intervention propres
--   Photo obligatoire : OUI (vue d'ensemble)

-- ═══════════════════════════════════════════════════════════════════════════════
-- RÉSUMÉ CONFORMITÉ CDC GIRASOLE 2025
-- ═══════════════════════════════════════════════════════════════════════════════
-- ✅ Normes : NF C 15-100, UTE C 15-712-1, IEC 62446-1, DTU 40.35
-- ✅ Prescriptions GIRASOLE (2.4) : Autocontrôle, PV réception, CR visite, DRE
-- ✅ Bonnes/Mauvaises pratiques (2.5) : 100% des points listés couverts
-- ✅ Tranchées : Protections TPC, rebouchage fourreaux (points 32, 51)
-- ✅ ANNEXE 2 : Tous les constats permettent remplissage Excel GIRASOLE
-- ✅ Photos : OBLIGATOIRES pour chaque point (facilite rapprochement)
-- ═══════════════════════════════════════════════════════════════════════════════
