-- Migration 0013 : Ajout mesure distances modules/rives/faîtage
-- Date : 2025-11-27
-- Objectif : Ajouter 1 point de contrôle distances (rives + faîtage)

-- Insertion du nouveau point dans le template TOITURE
INSERT INTO checklist_toiture_template (item_numero, libelle, description, reference_normative) VALUES
(14, 'Mesurer la distance Modules > Rives / Modules > Faitage', 'Mesure des distances de sécurité entre les modules photovoltaïques et les éléments de toiture : distance modules-rives (bords latéraux de la toiture) et distance modules-faîtage (ligne de crête). Ces distances doivent respecter les normes DTU pour garantir l''étanchéité, la ventilation et la sécurité en cas d''intervention. Mesures en mètres ou centimètres à relever sur site.', 'DTU 40.35 + Règles sécurité incendie');

-- Note : Cette migration ajoute uniquement l'item au template
-- Les missions existantes nécessitant un audit toiture devront être réinitialisées
-- ou le nouvel item sera ajouté automatiquement lors de la prochaine consultation
