/**
 * ═══════════════════════════════════════════════════════════════════════════════
 * SHAREPOINT CONNECTOR - GIRASOLE DIAGPV
 * ═══════════════════════════════════════════════════════════════════════════════
 * 
 * Connecteur bidirectionnel pour synchronisation automatique :
 * - SharePoint ANNEXE 1 → Base D1 Production (lecture des centrales)
 * - Base D1 Production → SharePoint (mise à jour statuts audits)
 * 
 * Date création : 24 Novembre 2025
 * Auteur : DiagPV Assistant (IA)
 * 
 * ═══════════════════════════════════════════════════════════════════════════════
 */

/**
 * Interface pour une centrale SharePoint
 */
export interface CentraleSharePoint {
  id_ref: string;
  nom: string;
  puissance: number;
  spv: string;
  latitude: number;
  longitude: number;
  adresse: string;
  dept: string;
  type_centrale: string;
  installateur: string;
  date_mes: string;
  si: string;
  panneaux: string;
  contact_exploitation: string;
  tel_exploitation: string;
  contact_gestion: string;
  tel_gestion: string;
  audit_toiture: string;
  audit_hors_toiture: string;
  ratio_pr: string;
  date_prev_audit: string;
  date_reelle_audit?: string; // Sera mis à jour depuis D1
}

/**
 * Configuration du connecteur SharePoint
 */
export interface SharePointConfig {
  siteUrl: string; // Ex: https://lenergiededemain.sharepoint.com/sites/DiagnosticPhotovoltaique
  clientId?: string; // Azure AD App Registration Client ID
  clientSecret?: string; // Azure AD App Registration Client Secret
  tenantId?: string; // Azure AD Tenant ID
  fileUrl?: string; // URL directe du fichier ANNEXE 1
}

/**
 * Classe principale du connecteur SharePoint
 */
export class SharePointConnector {
  private config: SharePointConfig;
  private accessToken?: string;
  
  constructor(config: SharePointConfig) {
    this.config = config;
  }

  /**
   * Authentification OAuth2 avec SharePoint via Azure AD
   * 
   * @returns Token d'accès OAuth2
   */
  private async authenticate(): Promise<string> {
    if (!this.config.clientId || !this.config.clientSecret || !this.config.tenantId) {
      throw new Error('Configuration OAuth2 incomplète. Fournir clientId, clientSecret et tenantId');
    }

    const tokenEndpoint = `https://login.microsoftonline.com/${this.config.tenantId}/oauth2/v2.0/token`;
    
    const body = new URLSearchParams({
      client_id: this.config.clientId,
      client_secret: this.config.clientSecret,
      scope: 'https://graph.microsoft.com/.default',
      grant_type: 'client_credentials'
    });

    const response = await fetch(tokenEndpoint, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: body.toString()
    });

    if (!response.ok) {
      throw new Error(`Authentification SharePoint échouée: ${response.statusText}`);
    }

    const data: any = await response.json();
    this.accessToken = data.access_token;
    return this.accessToken;
  }

  /**
   * Récupération du fichier ANNEXE 1 depuis SharePoint
   * 
   * Mode 1 : Via URL publique (si le fichier est partagé publiquement)
   * Mode 2 : Via Microsoft Graph API (nécessite authentification OAuth2)
   * 
   * @returns Contenu du fichier CSV
   */
  async fetchAnnexe1File(): Promise<string> {
    // MODE 1: URL publique directe (si disponible)
    if (this.config.fileUrl) {
      const response = await fetch(this.config.fileUrl);
      if (!response.ok) {
        throw new Error(`Échec téléchargement fichier SharePoint: ${response.statusText}`);
      }
      return await response.text();
    }

    // MODE 2: Microsoft Graph API (nécessite authentification)
    if (!this.accessToken) {
      await this.authenticate();
    }

    // TODO: Implémenter récupération via Graph API
    // Endpoint: GET https://graph.microsoft.com/v1.0/sites/{site-id}/drive/items/{item-id}/content
    throw new Error('Récupération via Graph API non encore implémentée. Utiliser fileUrl pour le moment.');
  }

  /**
   * Parse le fichier CSV ANNEXE 1 en objets CentraleSharePoint
   * 
   * @param csvContent Contenu brut du CSV
   * @returns Array de centrales parsées
   */
  parseAnnexe1CSV(csvContent: string): CentraleSharePoint[] {
    const lines = csvContent.split('\n');
    const centrales: CentraleSharePoint[] = [];

    // Skip les 2 premières lignes (headers groupés)
    for (let i = 2; i < lines.length; i++) {
      const line = lines[i].trim();
      if (!line || line.split(';').length < 10) continue;

      const values = line.split(';');
      if (!values[0]) continue; // Pas d'ID référent

      try {
        centrales.push({
          id_ref: values[0],
          nom: values[1],
          puissance: parseFloat(values[2].replace(',', '.')) || 0,
          spv: values[3] || '',
          latitude: parseFloat(values[4].replace(',', '.')) || 0,
          longitude: parseFloat(values[5].replace(',', '.')) || 0,
          adresse: values[6] || '',
          dept: values[7] || '',
          type_centrale: values[8] || '',
          installateur: values[9] || '',
          date_mes: values[14] || '',
          si: values[15] || '',
          panneaux: values[16] || '',
          contact_exploitation: values[17] || '',
          tel_exploitation: values[18] || '',
          contact_gestion: values[19] || '',
          tel_gestion: values[20] || '',
          audit_toiture: values[21] || '',
          audit_hors_toiture: values[22] || '',
          ratio_pr: values[24] || '',
          date_prev_audit: values[26] || '',
          date_reelle_audit: values[27] || ''
        });
      } catch (error) {
        console.error(`Erreur parsing ligne ${i}:`, error);
      }
    }

    return centrales;
  }

  /**
   * Synchronisation SharePoint → Base D1
   * Lit ANNEXE 1, compare avec D1, et met à jour les différences
   * 
   * @param db Instance D1Database
   * @returns Nombre de centrales synchronisées
   */
  async syncSharePointToD1(db: D1Database): Promise<number> {
    console.log('🔄 Début synchronisation SharePoint → D1');

    // 1. Récupération du fichier ANNEXE 1
    const csvContent = await this.fetchAnnexe1File();
    const centralesSharePoint = this.parseAnnexe1CSV(csvContent);

    console.log(`📊 ${centralesSharePoint.length} centrales trouvées dans SharePoint`);

    // 2. Mise à jour de chaque centrale dans D1
    let updated = 0;
    for (const centrale of centralesSharePoint) {
      try {
        await db.prepare(`
          UPDATE centrales SET
            puissance_kwc = ?,
            spv = ?,
            latitude = ?,
            longitude = ?,
            adresse = ?,
            dept = ?,
            type_centrale = ?,
            installateur = ?,
            date_mes = ?,
            si = ?,
            panneaux = ?,
            contact_exploitation = ?,
            tel_exploitation = ?,
            contact_gestion = ?,
            tel_gestion = ?,
            audit_toiture = ?,
            audit_hors_toiture = ?,
            ratio_pr = ?,
            date_prev_audit = ?
          WHERE nom = ?
        `).bind(
          centrale.puissance,
          centrale.spv,
          centrale.latitude,
          centrale.longitude,
          centrale.adresse,
          centrale.dept,
          centrale.type_centrale,
          centrale.installateur,
          centrale.date_mes,
          centrale.si,
          centrale.panneaux,
          centrale.contact_exploitation,
          centrale.tel_exploitation,
          centrale.contact_gestion,
          centrale.tel_gestion,
          centrale.audit_toiture,
          centrale.audit_hors_toiture,
          centrale.ratio_pr,
          centrale.date_prev_audit,
          centrale.nom
        ).run();
        updated++;
      } catch (error) {
        console.error(`Erreur mise à jour centrale ${centrale.nom}:`, error);
      }
    }

    console.log(`✅ ${updated} centrales synchronisées avec succès`);
    return updated;
  }

  /**
   * Synchronisation Base D1 → SharePoint
   * Remonte les statuts d'audit et dates réelles depuis D1 vers SharePoint
   * 
   * ATTENTION: Nécessite permissions en écriture sur SharePoint
   * 
   * @param db Instance D1Database
   * @returns Nombre de centrales mises à jour dans SharePoint
   */
  async syncD1ToSharePoint(db: D1Database): Promise<number> {
    console.log('🔄 Début synchronisation D1 → SharePoint');

    // 1. Récupération des centrales avec audits terminés depuis D1
    const result = await db.prepare(`
      SELECT nom, date_audit, statut
      FROM centrales
      WHERE statut IN ('TERMINE', 'VALIDE')
      AND date_audit IS NOT NULL
    `).all();

    if (!result.results || result.results.length === 0) {
      console.log('ℹ️ Aucune centrale à synchroniser vers SharePoint');
      return 0;
    }

    console.log(`📊 ${result.results.length} centrales à mettre à jour dans SharePoint`);

    // 2. Mise à jour dans SharePoint
    // TODO: Implémenter écriture vers SharePoint via Graph API
    // Endpoint: PATCH https://graph.microsoft.com/v1.0/sites/{site-id}/lists/{list-id}/items/{item-id}

    console.log('⚠️ Mise à jour SharePoint non encore implémentée (nécessite Graph API Write permissions)');
    return 0;
  }
}

/**
 * Fonction utilitaire pour créer une instance du connecteur
 * 
 * @param config Configuration SharePoint
 * @returns Instance SharePointConnector
 */
export function createSharePointConnector(config: SharePointConfig): SharePointConnector {
  return new SharePointConnector(config);
}
