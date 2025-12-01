-- Migration 0017 : Ajout items checklist toiture (dépose détaillée + conformités)
-- Date : 2025-11-28
-- Objectif : Ajouter items détaillés dépose panneaux + conformités DTU/ETN/Notices/GIRASOLE
-- Structure : 6 nouveaux groupes (items 12-42 environ)
-- IMPORTANT : Ne modifie AUCUNE donnée existante (checklist en cours/terminées conservées)

-- ============================================================================
-- AJOUT DES NOUVEAUX ITEMS AU TEMPLATE
-- ============================================================================

-- GROUPE 1 : DÉPOSE PANNEAUX DÉTAILLÉE (items 12-20)
INSERT INTO checklist_toiture_template (item_numero, libelle, description, reference_normative, categorie) VALUES

-- 1️⃣ DÉPOSE PANNEAUX DÉTAILLÉE
(12, 'Nombre panneaux déposés (min 25)', 'Nombre de panneaux déposés pendant l''audit (minimum 25 panneaux pertinents)', 'CDC Girasole §2.2', 'DEPOSE_PANNEAUX'),

(13, 'Zone dépose : 1er panneau chaînes', 'Dépose effectuée sur le premier panneau des chaînes photovoltaïques', 'CDC Girasole', 'DEPOSE_PANNEAUX'),

(14, 'Zone dépose : Dernier panneau chaînes', 'Dépose effectuée sur le dernier panneau des chaînes photovoltaïques', 'CDC Girasole', 'DEPOSE_PANNEAUX'),

(15, 'Zone dépose : Rives', 'Dépose effectuée sur les panneaux en rives de toiture', 'CDC Girasole', 'DEPOSE_PANNEAUX'),

(16, 'Zone dépose : Angles', 'Dépose effectuée sur les panneaux aux angles de toiture', 'CDC Girasole', 'DEPOSE_PANNEAUX'),

(17, 'Zone dépose : Zones suspicion écarts', 'Dépose effectuée sur les zones identifiées avec suspicion d''écarts (thermographie, visuel)', 'CDC Girasole', 'DEPOSE_PANNEAUX'),

(18, 'Constats sous panneaux (fixations, étanchéité, câbles, raccordements)', 'Constats détaillés effectués sous les panneaux déposés : état fixations, étanchéité, câbles, raccordements', 'CDC Girasole', 'DEPOSE_PANNEAUX'),

(19, 'Photos dessous panneaux (min 5 photos)', 'Photos prises sous les panneaux déposés (minimum 5 photos obligatoires)', 'CDC Girasole', 'DEPOSE_PANNEAUX'),

(20, 'Repose panneaux sans atteinte intégrité', 'Repose des panneaux effectuée sans atteinte à l''intégrité des panneaux ou de leurs supports', 'CDC Girasole §2.2', 'DEPOSE_PANNEAUX'),


-- GROUPE 2 : CONFORMITÉ DTU 40.35 (items 21-28)
(21, 'Installation conforme DTU 40.35', 'Vérification globale conformité installation selon DTU 40.35 (couvertures éléments métalliques)', 'DTU 40.35', 'CONFORMITE_DTU'),

(22, 'DTU : Fixations sur appuis pannes (PAS en fond nervure)', 'Vérification fixations positionnées sur appuis de pannes et NON en fond de nervure', 'DTU 40.35', 'CONFORMITE_DTU'),

(23, 'DTU : Rondelles étanchéité présentes', 'Présence des rondelles d''étanchéité au niveau des fixations traversant la couverture', 'DTU 40.35', 'CONFORMITE_DTU'),

(24, 'DTU : Traversées avec collerettes + joints', 'Traversées de couverture équipées de collerettes et joints d''étanchéité', 'DTU 40.35', 'CONFORMITE_DTU'),

(25, 'DTU : Pas d''infiltrations visibles', 'Absence d''infiltrations d''eau visibles au niveau des traversées et fixations', 'DTU 40.35', 'CONFORMITE_DTU'),

(26, 'DTU : Pente ≥ 5% (2,86°)', 'Pente de toiture égale ou supérieure à 5% soit 2,86 degrés (mesure terrain)', 'DTU 40.35', 'CONFORMITE_DTU'),

(27, 'DTU : Pas de déformations importantes structure', 'Absence de déformations importantes de la structure porteuse (pannes, charpente)', 'DTU 40.35', 'CONFORMITE_DTU'),

(28, 'DTU : Pas de corrosion avancée', 'Absence de corrosion avancée sur éléments métalliques (supports, fixations)', 'DTU 40.35', 'CONFORMITE_DTU'),


-- GROUPE 3 : CONFORMITÉ ETN (items 29-34)
(29, 'Installation conforme ETN', 'Vérification globale conformité installation selon ETN (Étude Technique Neige)', 'ETN', 'CONFORMITE_ETN'),

(30, 'ETN : Altitude site = altitude ETN', 'Altitude GPS du site correspond à l''altitude indiquée dans l''ETN', 'ETN', 'CONFORMITE_ETN'),

(31, 'ETN : Pente toiture = pente ETN', 'Pente mesurée sur site correspond à la pente indiquée dans l''ETN', 'ETN', 'CONFORMITE_ETN'),

(32, 'ETN : Type couverture dans domaine emploi ETN', 'Type de couverture installée est dans le domaine d''emploi validé par l''ETN', 'ETN', 'CONFORMITE_ETN'),

(33, 'ETN : Type structure support = type ETN', 'Type de structure support installée correspond au type validé dans l''ETN', 'ETN', 'CONFORMITE_ETN'),

(34, 'ETN : Implantation modules conforme plans ETN', 'Implantation des modules photovoltaïques conforme aux plans fournis dans l''ETN', 'ETN', 'CONFORMITE_ETN'),


-- GROUPE 4 : CONFORMITÉ NOTICES MONTAGE (items 35-37)
(35, 'Installation conforme notices montage', 'Vérification globale conformité installation selon notices de montage fabricants (panneaux, SI)', 'Notices fabricant', 'CONFORMITE_NOTICES'),

(36, 'Notices : Espacements panneaux respectés', 'Espacements entre panneaux respectent les prescriptions des notices de montage', 'Notices fabricant', 'CONFORMITE_NOTICES'),

(37, 'Notices : Systèmes fixation conformes notices fabricant', 'Systèmes de fixation utilisés conformes aux notices fabricants (type, nombre, positionnement)', 'Notices fabricant', 'CONFORMITE_NOTICES'),


-- GROUPE 5 : PRESCRIPTIONS GIRASOLE (items 38-41)
(38, 'GIRASOLE : Autocontrôle installateur présent & renseigné', 'Présence et qualité du renseignement de l''autocontrôle installateur', 'CDC GIRASOLE', 'PRESCRIPTIONS_GIRASOLE'),

(39, 'GIRASOLE : PV réception lot PV présent & signé', 'Présence du PV de réception du lot photovoltaïque, signé par GIRASOLE et installateur', 'CDC GIRASOLE', 'PRESCRIPTIONS_GIRASOLE'),

(40, 'GIRASOLE : ≥ 1 CR visite chantier lot PV présent', 'Présence d''au moins 1 compte-rendu de visite de chantier lot PV par GIRASOLE', 'CDC GIRASOLE', 'PRESCRIPTIONS_GIRASOLE'),

(41, 'GIRASOLE : Cahier charges tranchées (bailleur) respecté', 'Cahier des charges tranchées fourni par le bailleur est respecté', 'CDC GIRASOLE', 'PRESCRIPTIONS_GIRASOLE'),


-- GROUPE 6 : BONNES/MAUVAISES PRATIQUES (items 42-44)
(42, 'Bonnes pratiques identifiées (impactent positivement)', 'Identifier et documenter les bonnes pratiques constatées sur chantier (qualité montage, choix techniques pertinents)', 'CDC GIRASOLE page 8', 'PRATIQUES'),

(43, 'Mauvaises pratiques identifiées (impactent négativement)', 'Identifier et documenter les mauvaises pratiques constatées sur chantier (risques, non-conformités mineures)', 'CDC GIRASOLE page 8', 'PRATIQUES'),

(44, 'Photos bonnes/mauvaises pratiques', 'Photos illustrant les bonnes et mauvaises pratiques identifiées', 'CDC GIRASOLE', 'PRATIQUES');


-- ============================================================================
-- VÉRIFICATION POST-MIGRATION
-- ============================================================================
-- Pour vérifier que les items ont été ajoutés :
-- SELECT COUNT(*) FROM checklist_toiture_template;
-- SELECT item_numero, libelle, categorie FROM checklist_toiture_template WHERE item_numero >= 12 ORDER BY item_numero;

-- Total attendu : 11 items existants + 33 nouveaux items = 44 items au total
