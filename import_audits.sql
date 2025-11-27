
-- Mission 1
INSERT OR IGNORE INTO ordres_mission (id, centrale_id, technicien_id, sous_traitant_id, statut, date_mission)
VALUES (1, 1, 1, 1, 'EN_COURS', date('now'));


INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6102, 1, 1, 'CABLAGE', 'Fixations chemin câbles (qualité + méthode)', 'NON_CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6103, 1, 2, 'CABLAGE', 'Type cheminement câbles (galvanisé chaud/froid)', 'NON_CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6104, 1, 3, 'CABLAGE', 'Protections mécaniques câbles (contacts saillants)', 'NON_CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6105, 1, 4, 'CABLAGE', 'Rayons courbure câbles AC/DC respectés', 'NON_CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6106, 1, 5, 'CABLAGE', 'Qualité brassage câbles', 'NON_CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6107, 1, 6, 'CABLAGE', 'Repérage serrage connexions AC', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6108, 1, 7, 'CABLAGE', 'Type repérage câbles (sérigraphié/manuscrit/tenant-aboutissant)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6109, 1, 8, 'CABLAGE', 'Cheminement terre (crapauds/bornier laiton)', 'NON_CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6086, 1, 1, 'DOCUMENTATION', 'Présence autocontrôle renseigné installateur', 'CONFORME', 'Test système OK', 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6087, 1, 2, 'DOCUMENTATION', 'PV réception lot PV signé (GIRASOLE + installateur)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6088, 1, 3, 'DOCUMENTATION', 'CR visite chantier lot PV (GIRASOLE)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6089, 1, 4, 'DOCUMENTATION', 'Plans TQC présents sur place', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6090, 1, 5, 'DOCUMENTATION', 'Attestation DRE bureau contrôle', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6091, 1, 6, 'DOCUMENTATION', 'Plans électriques tel que construit', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6121, 1, 1, 'INSPECTIONS_VISUELLES', 'Alignement modules PV conforme', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6122, 1, 2, 'INSPECTIONS_VISUELLES', 'État visuel modules (fissures/casse)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6123, 1, 3, 'INSPECTIONS_VISUELLES', 'État cadres modules (corrosion/déformation)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6124, 1, 4, 'INSPECTIONS_VISUELLES', 'Boîtiers jonction étanches', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6125, 1, 5, 'INSPECTIONS_VISUELLES', 'Absence corrosion/oxydation générale', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6115, 1, 1, 'INSTALL_ELEC', 'Cosses bimétal jonctions cuivre/alu présentes', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6116, 1, 2, 'INSTALL_ELEC', 'Connecteurs MC4 serrés/étanches', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6117, 1, 3, 'INSTALL_ELEC', 'État général coffrets DC', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6118, 1, 4, 'INSTALL_ELEC', 'Étanchéité IP65 boîtiers', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6119, 1, 5, 'INSTALL_ELEC', 'Serrage bornes électriques', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6120, 1, 6, 'INSTALL_ELEC', 'Ventilation coffrets adéquate', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6092, 1, 1, 'NORMES_ELEC', 'Réglages AGCP conformes aux plans', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6093, 1, 2, 'NORMES_ELEC', 'Protection différentielle 30mA fonctionnelle', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6094, 1, 3, 'NORMES_ELEC', 'Disjoncteurs calibrage correct', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6095, 1, 4, 'NORMES_ELEC', 'Parafoudres DC/AC en bon état', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6096, 1, 5, 'NORMES_ELEC', 'Signalétique circuits présente et conforme', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6097, 1, 6, 'NORMES_ELEC', 'Repérage équipements (inscrit sur équipement)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6098, 1, 7, 'NORMES_ELEC', 'Mesure continuité terres conforme', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6099, 1, 8, 'NORMES_ELEC', 'Polarité strings (+ et -) correcte', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6100, 1, 9, 'NORMES_ELEC', 'Couleurs câbles DC -/+ différentes', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6101, 1, 10, 'NORMES_ELEC', 'Test isolement DC (> 1 MΩ)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6110, 1, 1, 'TRANCHEES', 'Respect préconisations tranchée AC (Shelter → PDL)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6111, 1, 2, 'TRANCHEES', 'Cahier charges tranchées bailleur respecté', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6112, 1, 3, 'TRANCHEES', 'Rebouchage entrée/sortie fourreaux (TPC)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6113, 1, 4, 'TRANCHEES', 'Matériaux rebouchage conformes', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6114, 1, 5, 'TRANCHEES', 'Profondeur tranchées conforme', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

-- Mission 9
INSERT OR IGNORE INTO ordres_mission (id, centrale_id, technicien_id, sous_traitant_id, statut, date_mission)
VALUES (9, 9, 1, 1, 'EN_COURS', date('now'));


INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6422, 9, 1, 'CABLAGE', 'Fixations chemin câbles (qualité + méthode)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6423, 9, 2, 'CABLAGE', 'Type cheminement câbles (galvanisé chaud/froid)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6424, 9, 3, 'CABLAGE', 'Protections mécaniques câbles (contacts saillants)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6425, 9, 4, 'CABLAGE', 'Rayons courbure câbles AC/DC respectés', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6426, 9, 5, 'CABLAGE', 'Qualité brassage câbles', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6427, 9, 6, 'CABLAGE', 'Repérage serrage connexions AC', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6428, 9, 7, 'CABLAGE', 'Type repérage câbles (sérigraphié/manuscrit/tenant-aboutissant)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6429, 9, 8, 'CABLAGE', 'Cheminement terre (crapauds/bornier laiton)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6406, 9, 1, 'DOCUMENTATION', 'Présence autocontrôle renseigné installateur', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6407, 9, 2, 'DOCUMENTATION', 'PV réception lot PV signé (GIRASOLE + installateur)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6408, 9, 3, 'DOCUMENTATION', 'CR visite chantier lot PV (GIRASOLE)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6409, 9, 4, 'DOCUMENTATION', 'Plans TQC présents sur place', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6410, 9, 5, 'DOCUMENTATION', 'Attestation DRE bureau contrôle', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6411, 9, 6, 'DOCUMENTATION', 'Plans électriques tel que construit', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6441, 9, 1, 'INSPECTIONS_VISUELLES', 'Alignement modules PV conforme', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6442, 9, 2, 'INSPECTIONS_VISUELLES', 'État visuel modules (fissures/casse)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6443, 9, 3, 'INSPECTIONS_VISUELLES', 'État cadres modules (corrosion/déformation)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6444, 9, 4, 'INSPECTIONS_VISUELLES', 'Boîtiers jonction étanches', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6445, 9, 5, 'INSPECTIONS_VISUELLES', 'Absence corrosion/oxydation générale', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6435, 9, 1, 'INSTALL_ELEC', 'Cosses bimétal jonctions cuivre/alu présentes', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6436, 9, 2, 'INSTALL_ELEC', 'Connecteurs MC4 serrés/étanches', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6437, 9, 3, 'INSTALL_ELEC', 'État général coffrets DC', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6438, 9, 4, 'INSTALL_ELEC', 'Étanchéité IP65 boîtiers', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6439, 9, 5, 'INSTALL_ELEC', 'Serrage bornes électriques', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6440, 9, 6, 'INSTALL_ELEC', 'Ventilation coffrets adéquate', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6412, 9, 1, 'NORMES_ELEC', 'Réglages AGCP conformes aux plans', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6413, 9, 2, 'NORMES_ELEC', 'Protection différentielle 30mA fonctionnelle', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6414, 9, 3, 'NORMES_ELEC', 'Disjoncteurs calibrage correct', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6415, 9, 4, 'NORMES_ELEC', 'Parafoudres DC/AC en bon état', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6416, 9, 5, 'NORMES_ELEC', 'Signalétique circuits présente et conforme', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6417, 9, 6, 'NORMES_ELEC', 'Repérage équipements (inscrit sur équipement)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6418, 9, 7, 'NORMES_ELEC', 'Mesure continuité terres conforme', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6419, 9, 8, 'NORMES_ELEC', 'Polarité strings (+ et -) correcte', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6420, 9, 9, 'NORMES_ELEC', 'Couleurs câbles DC -/+ différentes', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6421, 9, 10, 'NORMES_ELEC', 'Test isolement DC (> 1 MΩ)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6430, 9, 1, 'TRANCHEES', 'Respect préconisations tranchée AC (Shelter → PDL)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6431, 9, 2, 'TRANCHEES', 'Cahier charges tranchées bailleur respecté', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6432, 9, 3, 'TRANCHEES', 'Rebouchage entrée/sortie fourreaux (TPC)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6433, 9, 4, 'TRANCHEES', 'Matériaux rebouchage conformes', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  6434, 9, 5, 'TRANCHEES', 'Profondeur tranchées conforme', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

-- Mission 24
INSERT OR IGNORE INTO ordres_mission (id, centrale_id, technicien_id, sous_traitant_id, statut, date_mission)
VALUES (24, 24, 1, 1, 'EN_COURS', date('now'));


INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7022, 24, 1, 'CABLAGE', 'Fixations chemin câbles (qualité + méthode)', 'CONFORME', 'Capot de chemin de câble à refixer', 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7023, 24, 2, 'CABLAGE', 'Type cheminement câbles (galvanisé chaud/froid)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7024, 24, 3, 'CABLAGE', 'Protections mécaniques câbles (contacts saillants)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7025, 24, 4, 'CABLAGE', 'Rayons courbure câbles AC/DC respectés', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7026, 24, 5, 'CABLAGE', 'Qualité brassage câbles', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7027, 24, 6, 'CABLAGE', 'Repérage serrage connexions AC', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7028, 24, 7, 'CABLAGE', 'Type repérage câbles (sérigraphié/manuscrit/tenant-aboutissant)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7029, 24, 8, 'CABLAGE', 'Cheminement terre (crapauds/bornier laiton)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7006, 24, 1, 'DOCUMENTATION', 'Présence autocontrôle renseigné installateur', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7007, 24, 2, 'DOCUMENTATION', 'PV réception lot PV signé (GIRASOLE + installateur)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7008, 24, 3, 'DOCUMENTATION', 'CR visite chantier lot PV (GIRASOLE)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7009, 24, 4, 'DOCUMENTATION', 'Plans TQC présents sur place', 'NON_CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7010, 24, 5, 'DOCUMENTATION', 'Attestation DRE bureau contrôle', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7011, 24, 6, 'DOCUMENTATION', 'Plans électriques tel que construit', 'NON_CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7041, 24, 1, 'INSPECTIONS_VISUELLES', 'Alignement modules PV conforme', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7042, 24, 2, 'INSPECTIONS_VISUELLES', 'État visuel modules (fissures/casse)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7043, 24, 3, 'INSPECTIONS_VISUELLES', 'État cadres modules (corrosion/déformation)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7044, 24, 4, 'INSPECTIONS_VISUELLES', 'Boîtiers jonction étanches', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7045, 24, 5, 'INSPECTIONS_VISUELLES', 'Absence corrosion/oxydation générale', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7035, 24, 1, 'INSTALL_ELEC', 'Cosses bimétal jonctions cuivre/alu présentes', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7036, 24, 2, 'INSTALL_ELEC', 'Connecteurs MC4 serrés/étanches', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7037, 24, 3, 'INSTALL_ELEC', 'État général coffrets DC', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7038, 24, 4, 'INSTALL_ELEC', 'Étanchéité IP65 boîtiers', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7039, 24, 5, 'INSTALL_ELEC', 'Serrage bornes électriques', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7040, 24, 6, 'INSTALL_ELEC', 'Ventilation coffrets adéquate', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7012, 24, 1, 'NORMES_ELEC', 'Réglages AGCP conformes aux plans', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7013, 24, 2, 'NORMES_ELEC', 'Protection différentielle 30mA fonctionnelle', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7014, 24, 3, 'NORMES_ELEC', 'Disjoncteurs calibrage correct', 'NON_VERIFIE', 'Onduleur directement sur le sectionneur général. Est-ce normal est-ce normal ?', 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7015, 24, 4, 'NORMES_ELEC', 'Parafoudres DC/AC en bon état', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7016, 24, 5, 'NORMES_ELEC', 'Signalétique circuits présente et conforme', 'NON_CONFORME', 'Manque autocollant sur onduleur courant continu', 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7017, 24, 6, 'NORMES_ELEC', 'Repérage équipements (inscrit sur équipement)', 'NON_CONFORME', 'Manque autocollant, onduleur, courant continu', 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7018, 24, 7, 'NORMES_ELEC', 'Mesure continuité terres conforme', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7019, 24, 8, 'NORMES_ELEC', 'Polarité strings (+ et -) correcte', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7020, 24, 9, 'NORMES_ELEC', 'Couleurs câbles DC -/+ différentes', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7021, 24, 10, 'NORMES_ELEC', 'Test isolement DC (> 1 MΩ)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7030, 24, 1, 'TRANCHEES', 'Respect préconisations tranchée AC (Shelter → PDL)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7031, 24, 2, 'TRANCHEES', 'Cahier charges tranchées bailleur respecté', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7032, 24, 3, 'TRANCHEES', 'Rebouchage entrée/sortie fourreaux (TPC)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7033, 24, 4, 'TRANCHEES', 'Matériaux rebouchage conformes', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7034, 24, 5, 'TRANCHEES', 'Profondeur tranchées conforme', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

-- Mission 44
INSERT OR IGNORE INTO ordres_mission (id, centrale_id, technicien_id, sous_traitant_id, statut, date_mission)
VALUES (44, 44, 1, 1, 'EN_COURS', date('now'));


INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7822, 44, 1, 'CABLAGE', 'Fixations chemin câbles (qualité + méthode)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7823, 44, 2, 'CABLAGE', 'Type cheminement câbles (galvanisé chaud/froid)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7824, 44, 3, 'CABLAGE', 'Protections mécaniques câbles (contacts saillants)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7825, 44, 4, 'CABLAGE', 'Rayons courbure câbles AC/DC respectés', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7826, 44, 5, 'CABLAGE', 'Qualité brassage câbles', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7827, 44, 6, 'CABLAGE', 'Repérage serrage connexions AC', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7828, 44, 7, 'CABLAGE', 'Type repérage câbles (sérigraphié/manuscrit/tenant-aboutissant)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7829, 44, 8, 'CABLAGE', 'Cheminement terre (crapauds/bornier laiton)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7806, 44, 1, 'DOCUMENTATION', 'Présence autocontrôle renseigné installateur', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7807, 44, 2, 'DOCUMENTATION', 'PV réception lot PV signé (GIRASOLE + installateur)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7808, 44, 3, 'DOCUMENTATION', 'CR visite chantier lot PV (GIRASOLE)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7809, 44, 4, 'DOCUMENTATION', 'Plans TQC présents sur place', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7810, 44, 5, 'DOCUMENTATION', 'Attestation DRE bureau contrôle', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7811, 44, 6, 'DOCUMENTATION', 'Plans électriques tel que construit', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7841, 44, 1, 'INSPECTIONS_VISUELLES', 'Alignement modules PV conforme', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7842, 44, 2, 'INSPECTIONS_VISUELLES', 'État visuel modules (fissures/casse)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7843, 44, 3, 'INSPECTIONS_VISUELLES', 'État cadres modules (corrosion/déformation)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7844, 44, 4, 'INSPECTIONS_VISUELLES', 'Boîtiers jonction étanches', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7845, 44, 5, 'INSPECTIONS_VISUELLES', 'Absence corrosion/oxydation générale', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7835, 44, 1, 'INSTALL_ELEC', 'Cosses bimétal jonctions cuivre/alu présentes', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7836, 44, 2, 'INSTALL_ELEC', 'Connecteurs MC4 serrés/étanches', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7837, 44, 3, 'INSTALL_ELEC', 'État général coffrets DC', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7838, 44, 4, 'INSTALL_ELEC', 'Étanchéité IP65 boîtiers', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7839, 44, 5, 'INSTALL_ELEC', 'Serrage bornes électriques', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7840, 44, 6, 'INSTALL_ELEC', 'Ventilation coffrets adéquate', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7812, 44, 1, 'NORMES_ELEC', 'Réglages AGCP conformes aux plans', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7813, 44, 2, 'NORMES_ELEC', 'Protection différentielle 30mA fonctionnelle', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7814, 44, 3, 'NORMES_ELEC', 'Disjoncteurs calibrage correct', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7815, 44, 4, 'NORMES_ELEC', 'Parafoudres DC/AC en bon état', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7816, 44, 5, 'NORMES_ELEC', 'Signalétique circuits présente et conforme', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7817, 44, 6, 'NORMES_ELEC', 'Repérage équipements (inscrit sur équipement)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7818, 44, 7, 'NORMES_ELEC', 'Mesure continuité terres conforme', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7819, 44, 8, 'NORMES_ELEC', 'Polarité strings (+ et -) correcte', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7820, 44, 9, 'NORMES_ELEC', 'Couleurs câbles DC -/+ différentes', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7821, 44, 10, 'NORMES_ELEC', 'Test isolement DC (> 1 MΩ)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7830, 44, 1, 'TRANCHEES', 'Respect préconisations tranchée AC (Shelter → PDL)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7831, 44, 2, 'TRANCHEES', 'Cahier charges tranchées bailleur respecté', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7832, 44, 3, 'TRANCHEES', 'Rebouchage entrée/sortie fourreaux (TPC)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7833, 44, 4, 'TRANCHEES', 'Matériaux rebouchage conformes', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7834, 44, 5, 'TRANCHEES', 'Profondeur tranchées conforme', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

-- Mission 46
INSERT OR IGNORE INTO ordres_mission (id, centrale_id, technicien_id, sous_traitant_id, statut, date_mission)
VALUES (46, 46, 1, 1, 'EN_COURS', date('now'));


INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7902, 46, 1, 'CABLAGE', 'Fixations chemin câbles (qualité + méthode)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7903, 46, 2, 'CABLAGE', 'Type cheminement câbles (galvanisé chaud/froid)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7904, 46, 3, 'CABLAGE', 'Protections mécaniques câbles (contacts saillants)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7905, 46, 4, 'CABLAGE', 'Rayons courbure câbles AC/DC respectés', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7906, 46, 5, 'CABLAGE', 'Qualité brassage câbles', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7907, 46, 6, 'CABLAGE', 'Repérage serrage connexions AC', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7908, 46, 7, 'CABLAGE', 'Type repérage câbles (sérigraphié/manuscrit/tenant-aboutissant)', 'CONFORME', 'Sérigraphie ', 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7909, 46, 8, 'CABLAGE', 'Cheminement terre (crapauds/bornier laiton)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7886, 46, 1, 'DOCUMENTATION', 'Présence autocontrôle renseigné installateur', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7887, 46, 2, 'DOCUMENTATION', 'PV réception lot PV signé (GIRASOLE + installateur)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7888, 46, 3, 'DOCUMENTATION', 'CR visite chantier lot PV (GIRASOLE)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7889, 46, 4, 'DOCUMENTATION', 'Plans TQC présents sur place', 'NON_CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7890, 46, 5, 'DOCUMENTATION', 'Attestation DRE bureau contrôle', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7891, 46, 6, 'DOCUMENTATION', 'Plans électriques tel que construit', 'NON_CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7921, 46, 1, 'INSPECTIONS_VISUELLES', 'Alignement modules PV conforme', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7922, 46, 2, 'INSPECTIONS_VISUELLES', 'État visuel modules (fissures/casse)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7923, 46, 3, 'INSPECTIONS_VISUELLES', 'État cadres modules (corrosion/déformation)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7924, 46, 4, 'INSPECTIONS_VISUELLES', 'Boîtiers jonction étanches', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7925, 46, 5, 'INSPECTIONS_VISUELLES', 'Absence corrosion/oxydation générale', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7915, 46, 1, 'INSTALL_ELEC', 'Cosses bimétal jonctions cuivre/alu présentes', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7916, 46, 2, 'INSTALL_ELEC', 'Connecteurs MC4 serrés/étanches', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7917, 46, 3, 'INSTALL_ELEC', 'État général coffrets DC', 'NON_CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7918, 46, 4, 'INSTALL_ELEC', 'Étanchéité IP65 boîtiers', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7919, 46, 5, 'INSTALL_ELEC', 'Serrage bornes électriques', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7920, 46, 6, 'INSTALL_ELEC', 'Ventilation coffrets adéquate', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7892, 46, 1, 'NORMES_ELEC', 'Réglages AGCP conformes aux plans', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7893, 46, 2, 'NORMES_ELEC', 'Protection différentielle 30mA fonctionnelle', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7894, 46, 3, 'NORMES_ELEC', 'Disjoncteurs calibrage correct', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7895, 46, 4, 'NORMES_ELEC', 'Parafoudres DC/AC en bon état', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7896, 46, 5, 'NORMES_ELEC', 'Signalétique circuits présente et conforme', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7897, 46, 6, 'NORMES_ELEC', 'Repérage équipements (inscrit sur équipement)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7898, 46, 7, 'NORMES_ELEC', 'Mesure continuité terres conforme', 'NON_CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7899, 46, 8, 'NORMES_ELEC', 'Polarité strings (+ et -) correcte', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7900, 46, 9, 'NORMES_ELEC', 'Couleurs câbles DC -/+ différentes', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7901, 46, 10, 'NORMES_ELEC', 'Test isolement DC (> 1 MΩ)', 'NON_VERIFIE', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7910, 46, 1, 'TRANCHEES', 'Respect préconisations tranchée AC (Shelter → PDL)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7911, 46, 2, 'TRANCHEES', 'Cahier charges tranchées bailleur respecté', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7912, 46, 3, 'TRANCHEES', 'Rebouchage entrée/sortie fourreaux (TPC)', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7913, 46, 4, 'TRANCHEES', 'Matériaux rebouchage conformes', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);

INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  7914, 46, 5, 'TRANCHEES', 'Profondeur tranchées conforme', 'CONFORME', NULL, 'Adrien PAPPALARDO'
);