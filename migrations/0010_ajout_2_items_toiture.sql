-- Migration 0010 : Ajout 2 nouveaux points checklist TOITURE
-- Date : 2025-11-27
-- Objectif : Ajouter 2 points de contrôle spécifiques toiture (film anticondensation + limaille/rouille)

-- Insertion des 2 nouveaux points dans le template TOITURE
INSERT INTO checklist_toiture_template (item_numero, libelle, description, reference_normative) VALUES
(12, 'Présence de film anticondensation ?', 'Vérification de la présence et de l''état du film anticondensation sous la toiture (pare-vapeur). Contrôle de son intégrité, de son étanchéité et de sa continuité.', 'DTU 40.35 + CDC Girasole'),
(13, 'Présence de limaille sous les modules liées au perçage du bac acier pour les supports ? ou points de rouille ou piquage visible ?', 'Contrôle de la présence de limaille métallique sous les panneaux (résidus de perçage du bac acier). Vérification de l''absence de points de rouille, de corrosion ou de piquage visible sur la couverture métallique. Ces défauts peuvent compromettre l''étanchéité et la durabilité de la toiture.', 'DTU 40.35 + Prévention corrosion');

-- Note : Cette migration ajoute uniquement les items au template
-- Les missions existantes nécessitant un audit toiture devront être réinitialisées
-- ou les nouveaux items seront ajoutés automatiquement lors de la prochaine consultation
