#!/usr/bin/env python3
"""
GÉNÉRATEUR RAPPORT INDIVIDUEL PAR CENTRALE - GIRASOLE 2025
Diagnostic Photovoltaïque

Génère UN rapport PDF avec photos pour UNE centrale
Input: Checklist terrain JSON + ZIP photos
Output: Rapport PDF professionnel avec photos intégrées
"""

import json
from pathlib import Path
from datetime import datetime
import base64
import zipfile
import io

def creer_template_rapport_html(centrale, data_audit, photos_base64=[]):
    """Crée template HTML rapport avec photos intégrées"""
    
    # En-tête DiagPV
    logo_section = """
    <div class="header">
        <div class="logo-section">
            <h1>DIAGNOSTIC PHOTOVOLTAÏQUE</h1>
            <p>Expertise indépendante depuis 2012</p>
        </div>
        <div class="contact-section">
            <p>3 rue d'Apollo, 31240 L'UNION</p>
            <p>☎ 05.81.10.16.59 | 📧 contact@diagpv.fr</p>
            <p>RCS Toulouse: 792 972 309</p>
        </div>
    </div>
    """
    
    # Infos centrale
    infos_section = f"""
    <div class="section">
        <h2>📍 INFORMATIONS CENTRALE</h2>
        <table class="info-table">
            <tr>
                <td><strong>Code:</strong></td>
                <td>{centrale.get('id', 'N/A')}</td>
                <td><strong>Nom:</strong></td>
                <td>{centrale.get('nom', 'N/A')}</td>
            </tr>
            <tr>
                <td><strong>Puissance:</strong></td>
                <td>{centrale.get('puissance_kwc', 'N/A')} kWc</td>
                <td><strong>Type:</strong></td>
                <td>{centrale.get('type', 'N/A')}</td>
            </tr>
            <tr>
                <td><strong>GPS:</strong></td>
                <td>{centrale.get('latitude', '')}, {centrale.get('longitude', '')}</td>
                <td><strong>Département:</strong></td>
                <td>{centrale.get('dept', 'N/A')}</td>
            </tr>
            <tr>
                <td><strong>Date audit:</strong></td>
                <td>{datetime.now().strftime("%d/%m/%Y")}</td>
                <td><strong>Auditeur:</strong></td>
                <td>Diagnostic Photovoltaïque</td>
            </tr>
        </table>
    </div>
    """
    
    # Photos terrain
    photos_html = ""
    if photos_base64:
        photos_html = """
        <div class="section">
            <h2>📸 PHOTOS TERRAIN</h2>
            <div class="photos-grid">
        """
        for idx, photo_b64 in enumerate(photos_base64[:20], 1):  # Max 20 photos
            photos_html += f"""
                <div class="photo-item">
                    <img src="data:image/jpeg;base64,{photo_b64}" alt="Photo {idx}">
                    <p class="photo-caption">Photo {idx}</p>
                </div>
            """
        photos_html += """
            </div>
        </div>
        """
    
    # Anomalies détectées
    anomalies_section = f"""
    <div class="section">
        <h2>⚠️ ANOMALIES DÉTECTÉES</h2>
        <div class="anomalies">
            <div class="anomalie-critique">
                <h3>🔴 Critiques: {data_audit.get('anomalies_critiques', 0)}</h3>
                <p>{data_audit.get('detail_critiques', 'Aucune anomalie critique détectée')}</p>
            </div>
            <div class="anomalie-majeure">
                <h3>🟠 Majeures: {data_audit.get('anomalies_majeures', 0)}</h3>
                <p>{data_audit.get('detail_majeures', 'Aucune anomalie majeure détectée')}</p>
            </div>
            <div class="anomalie-mineure">
                <h3>🟡 Mineures: {data_audit.get('anomalies_mineures', 0)}</h3>
                <p>{data_audit.get('detail_mineures', 'Aucune anomalie mineure détectée')}</p>
            </div>
        </div>
    </div>
    """
    
    # Recommandations
    recommandations_section = f"""
    <div class="section">
        <h2>💡 RECOMMANDATIONS</h2>
        <div class="recommandations">
            {data_audit.get('recommandations', 'Aucune recommandation particulière')}
        </div>
    </div>
    """
    
    # Signature
    signature_section = """
    <div class="signature">
        <p><strong>Fabien CORRERA</strong></p>
        <p>Expert Diagnostic Photovoltaïque</p>
        <p>Diagnostic Photovoltaïque - Groupe Watt&co</p>
    </div>
    
    <div class="footer">
        <p>Ce rapport a été réalisé en toute indépendance par Diagnostic Photovoltaïque.</p>
        <p>Méthodologie conforme IEC 62446-3 | IEC TS 63049</p>
        <p>RCS Toulouse 792 972 309 - Assurance RC Professionnelle MMA</p>
    </div>
    """
    
    # CSS
    css = """
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; color: #333; }
        .header { display: flex; justify-content: space-between; border-bottom: 3px solid #2E7D32; padding-bottom: 10px; margin-bottom: 20px; }
        .logo-section h1 { color: #2E7D32; margin: 0; font-size: 24px; }
        .logo-section p { color: #666; margin: 5px 0 0 0; }
        .contact-section { text-align: right; font-size: 12px; }
        .contact-section p { margin: 3px 0; }
        .section { margin: 20px 0; page-break-inside: avoid; }
        .section h2 { background: #2E7D32; color: white; padding: 8px; border-radius: 5px; }
        .info-table { width: 100%; border-collapse: collapse; }
        .info-table td { padding: 8px; border: 1px solid #ddd; }
        .info-table tr:nth-child(even) { background: #f9f9f9; }
        .photos-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 10px; }
        .photo-item { text-align: center; }
        .photo-item img { width: 100%; border: 1px solid #ddd; border-radius: 5px; }
        .photo-caption { font-size: 12px; color: #666; margin: 5px 0; }
        .anomalies { display: flex; gap: 10px; }
        .anomalie-critique, .anomalie-majeure, .anomalie-mineure { flex: 1; padding: 10px; border-radius: 5px; }
        .anomalie-critique { background: #ffebee; border-left: 4px solid #d32f2f; }
        .anomalie-majeure { background: #fff3e0; border-left: 4px solid #f57c00; }
        .anomalie-mineure { background: #fffde7; border-left: 4px solid #fbc02d; }
        .recommandations { background: #e3f2fd; padding: 15px; border-radius: 5px; border-left: 4px solid #1976d2; }
        .signature { margin: 30px 0; text-align: right; font-style: italic; }
        .footer { margin-top: 50px; padding-top: 20px; border-top: 1px solid #ddd; font-size: 10px; color: #666; text-align: center; }
        @media print { .section { page-break-inside: avoid; } }
    </style>
    """
    
    # Assembler HTML complet
    html = f"""
    <!DOCTYPE html>
    <html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Rapport {centrale.get('id', '')} - {centrale.get('nom', '')}</title>
        {css}
    </head>
    <body>
        {logo_section}
        {infos_section}
        {photos_html}
        {anomalies_section}
        {recommandations_section}
        {signature_section}
    </body>
    </html>
    """
    
    return html

def generer_rapport_centrale(centrale, checklist_json_path=None, photos_zip_path=None):
    """Génère rapport HTML pour une centrale"""
    
    # Charger données audit si disponibles
    data_audit = {
        'anomalies_critiques': 0,
        'anomalies_majeures': 0,
        'anomalies_mineures': 0,
        'detail_critiques': 'À compléter après audit terrain',
        'detail_majeures': 'À compléter après audit terrain',
        'detail_mineures': 'À compléter après audit terrain',
        'recommandations': 'À compléter après analyse complète'
    }
    
    if checklist_json_path and Path(checklist_json_path).exists():
        with open(checklist_json_path, 'r', encoding='utf-8') as f:
            data_audit = json.load(f)
    
    # Charger photos si disponibles
    photos_base64 = []
    if photos_zip_path and Path(photos_zip_path).exists():
        with zipfile.ZipFile(photos_zip_path, 'r') as zip_file:
            for file_name in zip_file.namelist()[:20]:  # Max 20 photos
                if file_name.lower().endswith(('.jpg', '.jpeg', '.png')):
                    photo_data = zip_file.read(file_name)
                    photo_b64 = base64.b64encode(photo_data).decode('utf-8')
                    photos_base64.append(photo_b64)
    
    # Générer HTML
    html = creer_template_rapport_html(centrale, data_audit, photos_base64)
    
    return html

def main():
    """Génère rapport exemple pour première centrale"""
    
    print("📄 GÉNÉRATEUR RAPPORT INDIVIDUEL - GIRASOLE 2025\n")
    
    # Charger liste centrales
    centrales_path = Path('/home/user/liste_52_centrales.json')
    with open(centrales_path, 'r', encoding='utf-8') as f:
        centrales = json.load(f)
    
    # Générer rapport exemple pour première centrale
    centrale = centrales[0]
    print(f"📊 Génération rapport exemple: {centrale['id']} - {centrale['nom']}")
    
    html = generer_rapport_centrale(centrale)
    
    # Sauvegarder
    output_path = Path(f"/home/user/RAPPORT_EXEMPLE_{centrale['id']}_{centrale['nom'].replace(' ', '_')}.html")
    output_path.write_text(html, encoding='utf-8')
    
    print(f"✅ Rapport exemple généré: {output_path.name}")
    print(f"\n💡 Ce rapport sera automatiquement rempli avec:")
    print(f"   - Photos terrain (depuis ZIP)")
    print(f"   - Anomalies détectées (depuis checklist JSON)")
    print(f"   - Recommandations (depuis checklist JSON)")
    print(f"\n💡 Pour générer les 52 rapports:")
    print(f"   python3 generer_52_rapports_avec_photos.py")

if __name__ == "__main__":
    main()
