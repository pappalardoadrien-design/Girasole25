-- GIRASOLE - Régénération tokens sécurisés
-- Version: 2.5.0
-- Date: 2025-11-28 14:19:27

-- Suppression tokens non sécurisés
DELETE FROM access_tokens;

-- Insertion nouveaux tokens sécurisés
INSERT INTO access_tokens (id, token, nom, role, sous_traitant_id, statut, date_creation)
VALUES (1, 'u8ejmUtdA2UPx8n06Px1v8Mzu8ziOs5x', 'Adrien PAPPALARDO', 'ADMIN', NULL, 'ACTIF', CURRENT_TIMESTAMP);
INSERT INTO access_tokens (id, token, nom, role, sous_traitant_id, statut, date_creation)
VALUES (2, 'W-v8c-SVL7-XzF-xBvwH9BtfPyGoii6x', 'ARTEMIS', 'SOUS_TRAITANT', '3', 'ACTIF', CURRENT_TIMESTAMP);
INSERT INTO access_tokens (id, token, nom, role, sous_traitant_id, statut, date_creation)
VALUES (3, 'FMupE3hHXF_rgVz_jovYZB7vtkcQ3opF', 'CADENET', 'SOUS_TRAITANT', '4', 'ACTIF', CURRENT_TIMESTAMP);
INSERT INTO access_tokens (id, token, nom, role, sous_traitant_id, statut, date_creation)
VALUES (4, 'G379vToAdqZdpqif43M7O8fBYVjYkPOu', 'COURTIADE DISTRIB', 'SOUS_TRAITANT', '7', 'ACTIF', CURRENT_TIMESTAMP);
INSERT INTO access_tokens (id, token, nom, role, sous_traitant_id, statut, date_creation)
VALUES (5, 'wtYrujaywSTfOgalNhzQ3Pe3FHNqiVOv', 'DIAGPV - Adrien & Fabien', 'SOUS_TRAITANT', '5', 'ACTIF', CURRENT_TIMESTAMP);
INSERT INTO access_tokens (id, token, nom, role, sous_traitant_id, statut, date_creation)
VALUES (6, '3W-dQ-9TOBzb92Nk_NoSSVc9dbGNkitj', 'DRONE AVEYRON SERVICE', 'SOUS_TRAITANT', '8', 'ACTIF', CURRENT_TIMESTAMP);
INSERT INTO access_tokens (id, token, nom, role, sous_traitant_id, statut, date_creation)
VALUES (7, 'WXBVyrYlC_SSym0omGSOwU5-4S3-VPWD', 'EDOUARD - Martial', 'SOUS_TRAITANT', '6', 'ACTIF', CURRENT_TIMESTAMP);
INSERT INTO access_tokens (id, token, nom, role, sous_traitant_id, statut, date_creation)
VALUES (8, 'BE9zxULmY8HbXalHU4KgKght1MpzPwvk', 'En attente attribution', 'SOUS_TRAITANT', '9', 'ACTIF', CURRENT_TIMESTAMP);