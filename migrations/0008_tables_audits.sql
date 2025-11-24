-- Migration 0008: Création des tables pour gestion complète des audits
-- Date: 2025-11-24

-- Table audits_checklists : Stockage des checklists remplies
CREATE TABLE IF NOT EXISTS audits_checklists (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    centrale_id TEXT NOT NULL,
    date_audit TEXT NOT NULL,
    auditeur TEXT NOT NULL,
    sous_traitant TEXT NOT NULL,
    data_json TEXT NOT NULL,
    statut TEXT DEFAULT 'EN_COURS',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    sharepoint_url TEXT,
    FOREIGN KEY (centrale_id) REFERENCES centrales(id)
);

-- Table audits_photos : Métadonnées des photos géolocalisées
CREATE TABLE IF NOT EXISTS audits_photos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    centrale_id TEXT NOT NULL,
    filename TEXT NOT NULL,
    latitude REAL,
    longitude REAL,
    timestamp TEXT NOT NULL,
    description TEXT,
    sharepoint_url TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (centrale_id) REFERENCES centrales(id)
);

-- Table audits_annexe2 : Données ANNEXE 2 générées
CREATE TABLE IF NOT EXISTS audits_annexe2 (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    centrale_id TEXT NOT NULL,
    data_json TEXT NOT NULL,
    statut TEXT DEFAULT 'GENERE',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    sharepoint_url TEXT,
    FOREIGN KEY (centrale_id) REFERENCES centrales(id)
);

-- Table audits_rapports : Rapports PDF finaux
CREATE TABLE IF NOT EXISTS audits_rapports (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    centrale_id TEXT NOT NULL,
    date_generation TEXT NOT NULL,
    statut TEXT DEFAULT 'GENERE',
    sharepoint_url TEXT,
    sharepoint_url_final TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (centrale_id) REFERENCES centrales(id)
);

-- Table sync_logs : Logs des synchronisations SharePoint
CREATE TABLE IF NOT EXISTS sync_logs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT NOT NULL, -- 'SHAREPOINT_TO_D1', 'D1_TO_SHAREPOINT', 'UPLOAD_CHECKLIST', etc.
    status TEXT NOT NULL, -- 'SUCCESS', 'ERROR', 'PENDING'
    message TEXT,
    details TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Index pour optimiser les requêtes
CREATE INDEX IF NOT EXISTS idx_audits_checklists_centrale ON audits_checklists(centrale_id);
CREATE INDEX IF NOT EXISTS idx_audits_photos_centrale ON audits_photos(centrale_id);
CREATE INDEX IF NOT EXISTS idx_audits_annexe2_centrale ON audits_annexe2(centrale_id);
CREATE INDEX IF NOT EXISTS idx_audits_rapports_centrale ON audits_rapports(centrale_id);
CREATE INDEX IF NOT EXISTS idx_sync_logs_type ON sync_logs(type);
CREATE INDEX IF NOT EXISTS idx_sync_logs_created ON sync_logs(created_at);
