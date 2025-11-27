// Script d'import des audits depuis JSON vers DB Cloudflare D1
import fs from 'fs';

const auditsData = JSON.parse(fs.readFileSync('./audits_backup.json', 'utf-8'));

console.log('📦 Données chargées:', Object.keys(auditsData).length, 'missions');

// Générer SQL INSERT statements
const sqlStatements = [];

Object.entries(auditsData).forEach(([missionId, missionData]) => {
  console.log(`\n🔄 Mission ${missionId}:`);
  console.log(`  - ${missionData.items.length} items`);
  console.log(`  - ${missionData.photos_items.length} groupes photos`);
  console.log(`  - ${missionData.photos_generales.length} photos générales`);
  
  // 1. Créer ordre de mission si n'existe pas
  // IMPORTANT: ordres_mission ne contient que IDs (pas centrale_nom ni technicien_nom)
  sqlStatements.push(`
-- Mission ${missionId}
INSERT OR IGNORE INTO ordres_mission (id, centrale_id, technicien_id, sous_traitant_id, statut, date_mission)
VALUES (${missionId}, ${missionId}, 1, 1, 'EN_COURS', date('now'));
`);
  
  // 2. Items checklist
  missionData.items.forEach(item => {
    const statut = item.statut || 'NON_VERIFIE';
    const commentaire = item.commentaire ? item.commentaire.replace(/'/g, "''") : '';
    const itemTexte = item.item_texte.replace(/'/g, "''");
    const categorie = item.categorie || '';
    
    sqlStatements.push(`
INSERT OR REPLACE INTO checklist_items (
  id, ordre_mission_id, item_numero, categorie, item_texte, statut, commentaire, technicien_nom
) VALUES (
  ${item.id}, ${missionId}, ${item.item_numero}, '${categorie}', '${itemTexte}', '${statut}', ${commentaire ? `'${commentaire}'` : 'NULL'}, 'Adrien PAPPALARDO'
);`);
  });
  
  // 3. Photos items
  missionData.photos_items.forEach(photoGroup => {
    photoGroup.photos.forEach((photo, idx) => {
      const filename = photo.filename || 'photo.jpg';
      const base64 = photo.base64 || '';
      const commentaire = photo.commentaire ? photo.commentaire.replace(/'/g, "''") : '';
      
      // Trouver l'item_id correspondant
      const item = missionData.items.find(i => i.item_numero === photoGroup.item_numero);
      if (item && base64) {
        sqlStatements.push(`
INSERT INTO ordres_mission_item_photos (
  ordre_mission_id, item_checklist_id, photo_base64, photo_filename, commentaire, ordre
) VALUES (
  ${missionId}, ${item.id}, '${base64}', '${filename}', ${commentaire ? `'${commentaire}'` : 'NULL'}, ${idx}
);`);
      }
    });
  });
  
  // 4. Commentaire final
  if (missionData.commentaire) {
    const commentaire = missionData.commentaire.replace(/'/g, "''");
    sqlStatements.push(`
INSERT OR REPLACE INTO ordres_mission_commentaires_finaux (ordre_mission_id, commentaire)
VALUES (${missionId}, '${commentaire}');`);
  }
  
  // 5. Photos générales
  missionData.photos_generales.forEach((photo, idx) => {
    const filename = photo.filename || 'photo.jpg';
    const base64 = photo.base64 || '';
    const legende = photo.legende ? photo.legende.replace(/'/g, "''") : '';
    
    if (base64) {
      sqlStatements.push(`
INSERT INTO ordres_mission_photos_generales (
  ordre_mission_id, photo_base64, photo_filename, legende, ordre
) VALUES (
  ${missionId}, '${base64}', '${filename}', ${legende ? `'${legende}'` : 'NULL'}, ${idx}
);`);
    }
  });
});

// Écrire le fichier SQL
const sqlContent = sqlStatements.join('\n');
fs.writeFileSync('./import_audits.sql', sqlContent);

console.log('\n✅ Fichier SQL généré: import_audits.sql');
console.log(`📊 ${sqlStatements.length} commandes SQL`);
console.log('\n🚀 Exécute maintenant:');
console.log('npx wrangler d1 execute girasole-db-production --remote --file=./import_audits.sql');
