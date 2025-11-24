/**
 * ═══════════════════════════════════════════════════════════════════════════════
 * AUDIT MANAGER - GESTION COMPLÈTE DES AUDITS GIRASOLE
 * ═══════════════════════════════════════════════════════════════════════════════
 * 
 * Gestion du cycle de vie complet des audits :
 * - Upload checklists remplies
 * - Upload photos géolocalisées (batch)
 * - Génération automatique ANNEXE 2
 * - Génération rapports PDF
 * - Upload automatique vers SharePoint
 * 
 * Date création : 24 Novembre 2025
 * Auteur : DiagPV Assistant (IA)
 * 
 * ═══════════════════════════════════════════════════════════════════════════════
 */

import { SharePointConnector } from './sharepoint-connector'

/**
 * Interface pour une photo géolocalisée
 */
export interface PhotoGeolocalisee {
  filename: string;
  data: ArrayBuffer;
  latitude?: number;
  longitude?: number;
  timestamp: string;
  description?: string;
}

/**
 * Interface pour une checklist remplie
 */
export interface ChecklistRemplie {
  centrale_id: string;
  centrale_nom: string;
  date_audit: string;
  auditeur: string;
  sous_traitant: string;
  points: ChecklistPoint[];
  commentaires_generaux?: string;
}

export interface ChecklistPoint {
  categorie: string;
  numero: number;
  description: string;
  conforme: boolean;
  commentaire?: string;
  photo_ref?: string;
}

/**
 * Interface pour ANNEXE 2
 */
export interface Annexe2Data {
  centrale_id: string;
  centrale_nom: string;
  puissance_kwc: number;
  nb_modules: number;
  nb_onduleurs: number;
  defauts_majeurs: string[];
  defauts_mineurs: string[];
  recommandations: string[];
  cout_reparations_estime?: number;
}

/**
 * Classe principale de gestion des audits
 */
export class AuditManager {
  private db: D1Database;
  private sharepoint: SharePointConnector;

  constructor(db: D1Database, sharepoint: SharePointConnector) {
    this.db = db;
    this.sharepoint = sharepoint;
  }

  /**
   * Upload d'une checklist remplie
   * 
   * @param centraleId ID de la centrale
   * @param checklist Checklist remplie
   * @returns URL SharePoint du fichier
   */
  async uploadChecklist(centraleId: string, checklist: ChecklistRemplie): Promise<string> {
    // 1. Sauvegarder dans D1
    await this.db.prepare(`
      INSERT INTO audits_checklists (centrale_id, date_audit, auditeur, sous_traitant, data_json, statut)
      VALUES (?, ?, ?, ?, ?, 'COMPLETE')
    `).bind(
      centraleId,
      checklist.date_audit,
      checklist.auditeur,
      checklist.sous_traitant,
      JSON.stringify(checklist)
    ).run();

    // 2. Générer Excel depuis la checklist
    const excelBuffer = await this.generateChecklistExcel(checklist);

    // 3. Upload vers SharePoint
    const folderPath = `/AUDITS_2025/${checklist.sous_traitant}/${checklist.centrale_nom}_${centraleId}`;
    const fileName = `Checklist_${checklist.centrale_nom}_${checklist.date_audit}.xlsx`;
    
    await this.sharepoint.uploadFile(
      folderPath,
      fileName,
      excelBuffer,
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    );

    return `${folderPath}/${fileName}`;
  }

  /**
   * Upload de photos géolocalisées (batch)
   * 
   * @param centraleId ID de la centrale
   * @param photos Array de photos
   * @returns Array des URLs SharePoint
   */
  async uploadPhotos(centraleId: string, photos: PhotoGeolocalisee[]): Promise<string[]> {
    const urls: string[] = [];

    // Récupérer infos centrale
    const centrale = await this.db.prepare(`
      SELECT nom, sous_traitant_prevu FROM centrales WHERE id = ?
    `).bind(centraleId).first();

    if (!centrale) {
      throw new Error(`Centrale ${centraleId} non trouvée`);
    }

    const folderPath = `/AUDITS_2025/${centrale.sous_traitant_prevu}/${centrale.nom}_${centraleId}/Photos`;

    for (const photo of photos) {
      // 1. Sauvegarder métadonnées dans D1
      await this.db.prepare(`
        INSERT INTO audits_photos (centrale_id, filename, latitude, longitude, timestamp, description)
        VALUES (?, ?, ?, ?, ?, ?)
      `).bind(
        centraleId,
        photo.filename,
        photo.latitude || null,
        photo.longitude || null,
        photo.timestamp,
        photo.description || null
      ).run();

      // 2. Upload vers SharePoint
      await this.sharepoint.uploadFile(
        folderPath,
        photo.filename,
        photo.data,
        'image/jpeg'
      );

      urls.push(`${folderPath}/${photo.filename}`);
    }

    return urls;
  }

  /**
   * Génération automatique ANNEXE 2 depuis données D1
   * 
   * @param centraleId ID de la centrale
   * @returns URL SharePoint du fichier ANNEXE 2
   */
  async generateAnnexe2(centraleId: string): Promise<string> {
    // 1. Récupérer toutes les données nécessaires depuis D1
    const centrale = await this.db.prepare(`
      SELECT * FROM centrales WHERE id = ?
    `).bind(centraleId).first();

    if (!centrale) {
      throw new Error(`Centrale ${centraleId} non trouvée`);
    }

    const checklist = await this.db.prepare(`
      SELECT * FROM audits_checklists WHERE centrale_id = ? ORDER BY date_audit DESC LIMIT 1
    `).bind(centraleId).first();

    if (!checklist) {
      throw new Error(`Aucune checklist trouvée pour centrale ${centraleId}`);
    }

    // 2. Compiler les données pour ANNEXE 2
    const checklistData: ChecklistRemplie = JSON.parse(checklist.data_json as string);
    
    const annexe2Data: Annexe2Data = {
      centrale_id: centraleId,
      centrale_nom: centrale.nom as string,
      puissance_kwc: centrale.puissance_kwc as number,
      nb_modules: Math.round((centrale.puissance_kwc as number) / 0.455), // Estimation 455W/module
      nb_onduleurs: Math.ceil((centrale.puissance_kwc as number) / 100), // Estimation 100kW/onduleur
      defauts_majeurs: checklistData.points.filter(p => !p.conforme && p.categorie.includes('MAJEUR')).map(p => p.description),
      defauts_mineurs: checklistData.points.filter(p => !p.conforme && !p.categorie.includes('MAJEUR')).map(p => p.description),
      recommandations: []
    };

    // 3. Générer le fichier Excel ANNEXE 2
    const excelBuffer = await this.generateAnnexe2Excel(annexe2Data);

    // 4. Sauvegarder dans D1
    await this.db.prepare(`
      INSERT INTO audits_annexe2 (centrale_id, data_json, statut)
      VALUES (?, ?, 'GENERE')
    `).bind(
      centraleId,
      JSON.stringify(annexe2Data)
    ).run();

    // 5. Upload vers SharePoint
    const folderPath = `/AUDITS_2025/${centrale.sous_traitant_prevu}/${centrale.nom}_${centraleId}`;
    const fileName = `ANNEXE_2_${centrale.nom}_${new Date().toISOString().split('T')[0]}.xlsx`;
    
    await this.sharepoint.uploadFile(
      folderPath,
      fileName,
      excelBuffer,
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    );

    return `${folderPath}/${fileName}`;
  }

  /**
   * Génération du rapport PDF final
   * 
   * @param centraleId ID de la centrale
   * @returns URL SharePoint du rapport PDF
   */
  async generateRapportFinal(centraleId: string): Promise<string> {
    // 1. Récupérer toutes les données
    const centrale = await this.db.prepare(`
      SELECT * FROM centrales WHERE id = ?
    `).bind(centraleId).first();

    const checklist = await this.db.prepare(`
      SELECT * FROM audits_checklists WHERE centrale_id = ? ORDER BY date_audit DESC LIMIT 1
    `).bind(centraleId).first();

    const annexe2 = await this.db.prepare(`
      SELECT * FROM audits_annexe2 WHERE centrale_id = ? ORDER BY created_at DESC LIMIT 1
    `).bind(centraleId).first();

    const photos = await this.db.prepare(`
      SELECT * FROM audits_photos WHERE centrale_id = ? ORDER BY timestamp ASC
    `).bind(centraleId).all();

    if (!centrale || !checklist || !annexe2) {
      throw new Error(`Données incomplètes pour centrale ${centraleId}`);
    }

    // 2. Générer le PDF (template DiagPV)
    const pdfBuffer = await this.generateRapportPDF({
      centrale: centrale as any,
      checklist: JSON.parse(checklist.data_json as string),
      annexe2: JSON.parse(annexe2.data_json as string),
      photos: photos.results as any[]
    });

    // 3. Sauvegarder dans D1
    await this.db.prepare(`
      UPDATE centrales SET statut = 'TERMINE' WHERE id = ?
    `).bind(centraleId).run();

    // 4. Upload vers SharePoint (2 emplacements)
    const folderPath = `/AUDITS_2025/${centrale.sous_traitant_prevu}/${centrale.nom}_${centraleId}`;
    const fileName = `Rapport_Final_${centrale.nom}_${new Date().toISOString().split('T')[0]}.pdf`;
    
    // Upload dans dossier centrale
    await this.sharepoint.uploadFile(
      folderPath,
      fileName,
      pdfBuffer,
      'application/pdf'
    );

    // Upload dans dossier RAPPORTS_FINAUX
    await this.sharepoint.uploadFile(
      '/RAPPORTS_FINAUX',
      fileName,
      pdfBuffer,
      'application/pdf'
    );

    return `${folderPath}/${fileName}`;
  }

  /**
   * Génération d'un fichier Excel pour la checklist
   * (Implémentation simplifiée - à enrichir avec vraie lib Excel)
   */
  private async generateChecklistExcel(checklist: ChecklistRemplie): Promise<ArrayBuffer> {
    // TODO: Implémenter génération Excel réelle avec exceljs
    // Pour l'instant, retourner un JSON formaté
    const jsonString = JSON.stringify(checklist, null, 2);
    return new TextEncoder().encode(jsonString).buffer;
  }

  /**
   * Génération d'un fichier Excel pour ANNEXE 2
   * (Implémentation simplifiée - à enrichir avec vraie lib Excel)
   */
  private async generateAnnexe2Excel(annexe2: Annexe2Data): Promise<ArrayBuffer> {
    // TODO: Implémenter génération Excel réelle avec formules
    const jsonString = JSON.stringify(annexe2, null, 2);
    return new TextEncoder().encode(jsonString).buffer;
  }

  /**
   * Génération d'un rapport PDF
   * (Implémentation simplifiée - à enrichir avec vraie lib PDF)
   */
  private async generateRapportPDF(data: any): Promise<ArrayBuffer> {
    // TODO: Implémenter génération PDF réelle avec pdfkit ou similaire
    const htmlContent = `
      <html>
        <head><title>Rapport Audit ${data.centrale.nom}</title></head>
        <body>
          <h1>Rapport d'Audit Photovoltaïque</h1>
          <h2>Centrale: ${data.centrale.nom}</h2>
          <h3>Puissance: ${data.centrale.puissance_kwc} kWc</h3>
          <h3>Date audit: ${data.checklist.date_audit}</h3>
          <h3>Auditeur: ${data.checklist.auditeur}</h3>
          <h2>Résultats Checklist</h2>
          <p>Points conformes: ${data.checklist.points.filter((p: any) => p.conforme).length}/${data.checklist.points.length}</p>
          <h2>Défauts détectés</h2>
          <ul>
            ${data.annexe2.defauts_majeurs.map((d: string) => `<li><strong>${d}</strong></li>`).join('')}
            ${data.annexe2.defauts_mineurs.map((d: string) => `<li>${d}</li>`).join('')}
          </ul>
          <h2>Photos (${data.photos.length})</h2>
        </body>
      </html>
    `;
    return new TextEncoder().encode(htmlContent).buffer;
  }
}

/**
 * Factory pour créer une instance AuditManager
 */
export function createAuditManager(db: D1Database, sharepoint: SharePointConnector): AuditManager {
  return new AuditManager(db, sharepoint);
}
