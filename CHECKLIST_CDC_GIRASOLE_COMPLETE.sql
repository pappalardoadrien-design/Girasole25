-- ═══════════════════════════════════════════════════════════════════════════════
-- CHECKLIST COMPLÈTE CONFORME AU CDC GIRASOLE 2025
-- ═══════════════════════════════════════════════════════════════════════════════
-- Source: PERF-CDC-001-CDC_AUDIT_QUALITE_2025_INSTALLATIONS_PV-001.pdf
-- Couvre: Normes + Prescriptions GIRASOLE + Bonnes/Mauvaises pratiques + Tranchées
-- ═══════════════════════════════════════════════════════════════════════════════

-- ============================================================================
-- CHECKLIST SOL (40 POINTS) - Pour centrales SOL
-- ============================================================================

-- 📄 1. DOCUMENTATION ET CONFORMITÉ (10 points)
-- CDC 2.4: Prescriptions documentaires GIRASOLE
--  1. Plaques signalétiques modules (lisibilité, présence)
--  2. Plaque onduleur(s) (identification, caractéristiques)
--  3. Schéma électrique unifilaire (conformité, mise à jour TQC)
--  4. Plan implantation modules (conforme au réalisé)
--  5. Attestation Consuel (présente, valide)
--  6. Contrat de raccordement (ENEDIS, présent)
--  7. Attestation DRE Bureau de Contrôle (présente, signée)
--  8. PV de réception lot PV signé GIRASOLE + installateur
--  9. CR visite chantier GIRASOLE (au moins 1)
-- 10. Autocontrôle installateur (correctement renseigné)

-- ⚡ 2. CONTRÔLES ÉLECTRIQUES DC (8 points)
-- Normes: NF C 15-100, UTE C 15-712-1, IEC 62446-1
-- 11. Tension Voc à vide par string (mesure, conformité)
-- 12. Courant Isc court-circuit par string
-- 13. Polarité connexions DC (+ / -, respect couleurs câbles)
-- 14. Test isolement DC (≥1 MΩ, IEC 62446-1)
-- 15. Continuité terre/masses (< 2Ω, NF C 15-100)
-- 16. État connecteurs MC4 (serrages, étanchéité, compatibilité mâle/femelle)
-- 17. Serrage bornes onduleur DC (couple conforme constructeur)
-- 18. Protection surtensions DC (présence, calibre)

-- 🔌 3. CONTRÔLES ÉLECTRIQUES AC (6 points)
-- 19. Tension réseau AC (conformité, déséquilibre phases)
-- 20. Protection différentielle 30mA type A (présence, test)
-- 21. Serrage bornes AGCP (couple conforme, repérage)
-- 22. Réglages AGCP (calibres conformes aux plans)
-- 23. Fonctionnement onduleur(s) (injection, monitoring)
-- 24. Production instantanée (mesure, cohérence PR)

-- 📷 4. INSPECTIONS VISUELLES MODULES (5 points)
-- CDC 2.5: Bonnes et mauvaises pratiques
-- 25. Constat visuel alignement modules PV
-- 26. Fixations modules (serrages, état SI)
-- 27. Microfissures visibles (coins, cellules)
-- 28. Salissures / ombrages proches
-- 29. Diodes by-pass accessibles (boîte de jonction)

-- 🔧 5. CHEMINEMENT CÂBLES ET PROTECTIONS (8 points)
-- CDC 2.5: Liste exhaustive bonnes/mauvaises pratiques
-- 30. Méthode et qualité fixations chemin de câbles
-- 31. Type de cheminement: galvanisé à chaud / à froid
-- 32. Protections mécaniques câbles (bords saillants, TPC)
-- 33. Rayons de courbure câbles AC et DC (respect constructeur)
-- 34. Repérage câbles (sérigraphié, manuscrit, tenant-aboutissant)
-- 35. Qualité du brassage des câbles (ordre, maintien)
-- 36. Cheminement terre le long chemins de câbles (crapaud, bornier laiton)
-- 37. Cosses bimétal cuivre/alu (jonction, accroche terre nu)

-- 🌍 6. MISE À LA TERRE ET ÉQUIPOTENTIALITÉ (3 points)
-- 38. Continuité liaison équipotentielle (structures, masses)
-- 39. Prise de terre dédiée PV (< 100Ω si exigé)
-- 40. Repérage équipements et bornes terre

-- ============================================================================
-- CHECKLIST TOITURE (52 POINTS) - Pour centrales TOITURE
-- ============================================================================
-- Inclut TOUS les 40 points SOL + 12 points spécifiques TOITURE

-- 🏠 7. SPÉCIFICITÉS AUDIT TOITURE (12 points supplémentaires)
-- CDC 2.5: Liste non exhaustive constats toiture
-- 41. Qualité et conformité montage/serrage SI sur support (DTU 40.35)
-- 42. Qualité et conformité montage/serrage panneau sur SI
-- 43. Fixation cheminement câbles (supports, maintien étanchéité toiture)
-- 44. Compatibilité connecteurs mâle/femelle (PVZH202B ou équivalent)
-- 45. Serrages connecteurs toiture (étanchéité, ruissellement)
-- 46. Cheminement câbles DC dans chemin de câble (qualité, protection)
-- 47. Cheminement câbles (pas directement sur couverture)
-- 48. Raccordement des terres en toiture (continuité SI → structure)
-- 49. Repérage câbles toiture (tenant-aboutissant, sérigraphié, manuscrit)
-- 50. Étiquettes réglementaires tension DC (présence, visibilité)
-- 51. Étanchéité traversées toiture (fourreaux, passe-câbles)
-- 52. État général couverture (tuiles, fixations, zones d'intervention)

-- ═══════════════════════════════════════════════════════════════════════════════
-- POINTS CRITIQUES TRANCHÉES (intégrés dans les points ci-dessus)
-- ═══════════════════════════════════════════════════════════════════════════════
-- CDC 2.4: "Respect du cahier des charges tranchées fourni au bailleur"
-- CDC 2.5: "Respect des préconisations pour la tranchée AC (Shelter vers PDL)"
-- CDC 2.5: "Rebouchage entrée/sortie des fourreaux (TPC, etc.) et matériaux utilisés"
--
-- Points couverts:
-- - Point 32: Protections mécaniques câbles (TPC, fourreaux)
-- - Point 51: Étanchéité traversées (fourreaux, rebouchage)
-- - À vérifier sur place: profondeur tranchée, grillage avertisseur, remblai conforme

-- ═══════════════════════════════════════════════════════════════════════════════
-- CONFORMITÉ ANNEXE 2 GIRASOLE (export Excel)
-- ═══════════════════════════════════════════════════════════════════════════════
-- Tous les points permettent de remplir les colonnes ANNEXE 2:
-- - N° ID centrale
-- - Nom installation
-- - Description écart / constat
-- - Catégorie (Documentation, Électrique DC, Électrique AC, etc.)
-- - Statut (Conforme, Non conforme, À vérifier)
-- - Photo associée
-- - Commentaire technicien
-- - Date d'audit
-- - Nom auditeur

