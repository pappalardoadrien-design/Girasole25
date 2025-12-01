#!/usr/bin/env node

/**
 * 🔐 SCRIPT CRÉATION ACCÈS SOUS-TRAITANT - GIRASOLE 2025
 * 
 * Génère automatiquement un token d'accès sécurisé pour un sous-traitant
 * et l'insère dans la base de données Cloudflare D1.
 * 
 * Usage:
 *   node scripts/creer-acces-sous-traitant.js "NOM_SOUS_TRAITANT" SOUS_TRAITANT_ID
 * 
 * Exemples:
 *   node scripts/creer-acces-sous-traitant.js "SOLAR TECH" 10
 *   node scripts/creer-acces-sous-traitant.js "DIAGPV TEAM" 11
 * 
 * Arguments:
 *   - NOM_SOUS_TRAITANT: Nom affiché (ex: "SOLAR TECH")
 *   - SOUS_TRAITANT_ID: ID du sous-traitant dans table sous_traitants
 */

const { execSync } = require('child_process');
const crypto = require('crypto');

// 🎨 Couleurs console
const colors = {
  reset: '\x1b[0m',
  bright: '\x1b[1m',
  green: '\x1b[32m',
  blue: '\x1b[34m',
  yellow: '\x1b[33m',
  red: '\x1b[31m',
  cyan: '\x1b[36m'
};

/**
 * Génère un token sécurisé aléatoire
 * Format: xxxxx-xxxxx-xxxxx-xxxxx (32 caractères)
 */
function genererToken() {
  const buffer = crypto.randomBytes(24);
  const token = buffer.toString('base64')
    .replace(/\+/g, '-')
    .replace(/\//g, '_')
    .replace(/=/g, '')
    .substring(0, 32);
  return token;
}

/**
 * Exécute une commande wrangler D1
 */
function executerSQL(sql, remote = false) {
  const remoteFlag = remote ? '--remote' : '';
  const command = `npx wrangler d1 execute girasole-db-production ${remoteFlag} --command="${sql}"`;
  
  try {
    const output = execSync(command, { 
      encoding: 'utf-8',
      cwd: process.cwd()
    });
    return output;
  } catch (error) {
    console.error(`${colors.red}❌ Erreur SQL:${colors.reset}`, error.message);
    throw error;
  }
}

/**
 * Vérifie si un sous-traitant existe
 */
function verifierSousTraitant(sousTraitantId, remote = false) {
  const sql = `SELECT id, nom_entreprise FROM sous_traitants WHERE id = ${sousTraitantId};`;
  const output = executerSQL(sql, remote);
  
  // Parser la sortie JSON de wrangler
  try {
    const matches = output.match(/"nom_entreprise":\s*"([^"]+)"/);
    if (matches && matches[1]) {
      return matches[1];
    }
    return null;
  } catch (error) {
    return null;
  }
}

/**
 * Insère le nouveau token dans la DB
 */
function insererToken(nom, token, sousTraitantId, remote = false) {
  const sql = `
    INSERT INTO access_tokens (nom, token, role, sous_traitant_id, statut, date_creation)
    VALUES ('${nom}', '${token}', 'SOUS_TRAITANT', ${sousTraitantId}, 'ACTIF', datetime('now'));
  `;
  
  executerSQL(sql, remote);
}

/**
 * Affiche le résumé final avec l'URL d'accès
 */
function afficherResume(nom, token, sousTraitantId, nomSousTraitant, remote) {
  const baseUrl = 'https://girasole-diagpv.pages.dev';
  const urlAcces = `${baseUrl}/s/${token}`;
  
  console.log('\n' + '='.repeat(80));
  console.log(`${colors.bright}${colors.green}✅ ACCÈS SOUS-TRAITANT CRÉÉ AVEC SUCCÈS${colors.reset}`);
  console.log('='.repeat(80));
  console.log('');
  
  console.log(`${colors.bright}📋 Informations:${colors.reset}`);
  console.log(`   ${colors.cyan}Nom utilisateur:${colors.reset}        ${nom}`);
  console.log(`   ${colors.cyan}Sous-traitant DB:${colors.reset}      ${nomSousTraitant} (ID: ${sousTraitantId})`);
  console.log(`   ${colors.cyan}Rôle:${colors.reset}                  SOUS_TRAITANT`);
  console.log(`   ${colors.cyan}Statut:${colors.reset}                ACTIF`);
  console.log(`   ${colors.cyan}Environnement:${colors.reset}         ${remote ? 'PRODUCTION (--remote)' : 'LOCAL (.wrangler/state)'}`);
  console.log('');
  
  console.log(`${colors.bright}🔐 Token d'accès:${colors.reset}`);
  console.log(`   ${colors.yellow}${token}${colors.reset}`);
  console.log('');
  
  console.log(`${colors.bright}🌐 URL d'accès direct:${colors.reset}`);
  console.log(`   ${colors.blue}${urlAcces}${colors.reset}`);
  console.log('');
  
  console.log(`${colors.bright}📧 Message à envoyer au sous-traitant:${colors.reset}`);
  console.log('─'.repeat(80));
  console.log(`
Bonjour ${nom},

Vous avez désormais accès à la plateforme GIRASOLE 2025 pour la gestion 
de vos audits photovoltaïques.

🔗 Lien d'accès direct :
${urlAcces}

📌 Ce lien est personnel et confidentiel. Ne le partagez pas.

✅ Fonctionnalités disponibles :
- Consultation des centrales qui vous sont attribuées
- Gestion des missions d'audit
- Remplissage des checklists de vérification
- Upload des photos (électroluminescence, thermographie, etc.)
- Génération des rapports d'audit

Pour toute question, contactez-nous.

Cordialement,
L'équipe DIAGPV
  `);
  console.log('─'.repeat(80));
  console.log('');
  
  console.log(`${colors.bright}💾 Sauvegarde recommandée:${colors.reset}`);
  console.log(`   Token: ${token}`);
  console.log(`   URL:   ${urlAcces}`);
  console.log('');
  console.log('='.repeat(80));
}

/**
 * Fonction principale
 */
function main() {
  // Vérifier les arguments
  const args = process.argv.slice(2);
  
  if (args.length < 2) {
    console.log(`${colors.red}❌ Erreur: Arguments manquants${colors.reset}\n`);
    console.log(`${colors.bright}Usage:${colors.reset}`);
    console.log(`  node scripts/creer-acces-sous-traitant.js "NOM_SOUS_TRAITANT" SOUS_TRAITANT_ID [--remote]\n`);
    console.log(`${colors.bright}Exemples:${colors.reset}`);
    console.log(`  ${colors.cyan}# Local (.wrangler/state)${colors.reset}`);
    console.log(`  node scripts/creer-acces-sous-traitant.js "SOLAR TECH" 10\n`);
    console.log(`  ${colors.cyan}# Production (--remote)${colors.reset}`);
    console.log(`  node scripts/creer-acces-sous-traitant.js "DIAGPV TEAM" 11 --remote\n`);
    console.log(`${colors.bright}Arguments:${colors.reset}`);
    console.log(`  NOM_SOUS_TRAITANT  Nom affiché (entre guillemets si espaces)`);
    console.log(`  SOUS_TRAITANT_ID   ID dans table sous_traitants (numérique)`);
    console.log(`  --remote           (Optionnel) Créer en PRODUCTION au lieu de local\n`);
    process.exit(1);
  }
  
  const nom = args[0];
  const sousTraitantId = parseInt(args[1], 10);
  const remote = args.includes('--remote');
  
  // Validation
  if (isNaN(sousTraitantId)) {
    console.error(`${colors.red}❌ Erreur: SOUS_TRAITANT_ID doit être un nombre${colors.reset}`);
    process.exit(1);
  }
  
  console.log('\n' + '='.repeat(80));
  console.log(`${colors.bright}🔧 CRÉATION ACCÈS SOUS-TRAITANT - GIRASOLE 2025${colors.reset}`);
  console.log('='.repeat(80));
  console.log('');
  
  // Vérifier si le sous-traitant existe
  console.log(`${colors.cyan}🔍 Vérification sous-traitant ID ${sousTraitantId}...${colors.reset}`);
  const nomSousTraitant = verifierSousTraitant(sousTraitantId, remote);
  
  if (!nomSousTraitant) {
    console.error(`${colors.red}❌ Erreur: Sous-traitant ID ${sousTraitantId} introuvable en base${colors.reset}`);
    console.log(`${colors.yellow}💡 Vérifiez l'ID avec:${colors.reset}`);
    console.log(`   npx wrangler d1 execute girasole-db-production ${remote ? '--remote' : ''} --command="SELECT * FROM sous_traitants;"\n`);
    process.exit(1);
  }
  
  console.log(`${colors.green}   ✓ Sous-traitant trouvé: ${nomSousTraitant}${colors.reset}\n`);
  
  // Générer le token
  console.log(`${colors.cyan}🔐 Génération token sécurisé...${colors.reset}`);
  const token = genererToken();
  console.log(`${colors.green}   ✓ Token généré: ${token}${colors.reset}\n`);
  
  // Insérer dans la DB
  console.log(`${colors.cyan}💾 Insertion dans base de données ${remote ? 'PRODUCTION' : 'LOCAL'}...${colors.reset}`);
  try {
    insererToken(nom, token, sousTraitantId, remote);
    console.log(`${colors.green}   ✓ Token inséré avec succès${colors.reset}\n`);
  } catch (error) {
    console.error(`${colors.red}❌ Échec insertion:${colors.reset}`, error.message);
    process.exit(1);
  }
  
  // Afficher le résumé
  afficherResume(nom, token, sousTraitantId, nomSousTraitant, remote);
}

// Exécution
main();
