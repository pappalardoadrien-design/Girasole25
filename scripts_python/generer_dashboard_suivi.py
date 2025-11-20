#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
📊 GÉNÉRATEUR DASHBOARD SUIVI - GIRASOLE 2025
Diagnostic Photovoltaïque

Génère dashboard HTML interactif pour suivre avancement audits 52 centrales
Input : JSON V4 disponibles + liste 52 centrales
Output : Dashboard HTML avec statistiques, graphiques, tracking

Auteur : DiagPV Assistant Pro
Date : 20 janvier 2025
Version : 1.0
"""

import json
from pathlib import Path
from datetime import datetime


def charger_json(chemin: Path) -> dict:
    """Charge un fichier JSON"""
    try:
        with open(chemin, 'r', encoding='utf-8') as f:
            return json.load(f)
    except Exception as e:
        return {}


def analyser_json_v4(json_path: Path) -> dict:
    """Analyse un JSON V4 et extrait statistiques"""
    data = charger_json(json_path)
    
    if not data:
        return None
    
    version = data.get('metadata', {}).get('version', '3.0')
    if version < '4.0':
        return None
    
    centrale = data.get('centrale', {})
    stats = data.get('statistiques', {})
    audit = data.get('audit', {})
    
    return {
        'id': centrale.get('id', 'UNKNOWN'),
        'nom': centrale.get('nom', 'N/A'),
        'type': centrale.get('type_installation', 'SOL'),
        'puissance_kwc': centrale.get('puissance_kwc', 0),
        'date_audit': audit.get('date_audit', 'N/A'),
        'total_photos': stats.get('total_photos', 0),
        'anomalies_critiques': stats.get('anomalies_critiques', 0),
        'anomalies_majeures': stats.get('anomalies_majeures', 0),
        'anomalies_mineures': stats.get('anomalies_mineures', 0),
        'conformite_cdc': data.get('metadata', {}).get('conformite_cdc', '100%')
    }


def generer_dashboard_html(centrales_liste: list, audits_completes: list, output_path: Path):
    """Génère dashboard HTML interactif"""
    
    # Statistiques globales
    nb_total = len(centrales_liste)
    nb_completes = len(audits_completes)
    nb_restantes = nb_total - nb_completes
    taux_completion = round((nb_completes / nb_total * 100), 1) if nb_total > 0 else 0
    
    # Statistiques par type
    nb_sol = sum(1 for a in audits_completes if a['type'] == 'SOL')
    nb_toiture = sum(1 for a in audits_completes if a['type'] == 'TOITURE')
    
    # Statistiques anomalies
    total_critiques = sum(a['anomalies_critiques'] for a in audits_completes)
    total_majeures = sum(a['anomalies_majeures'] for a in audits_completes)
    total_mineures = sum(a['anomalies_mineures'] for a in audits_completes)
    
    # Statistiques photos
    total_photos = sum(a['total_photos'] for a in audits_completes)
    avg_photos = round(total_photos / nb_completes, 1) if nb_completes > 0 else 0
    
    html = f"""<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Suivi Audits GIRASOLE 2025</title>
    <style>
        * {{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }}
        
        body {{
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 20px;
            min-height: 100vh;
        }}
        
        .container {{
            max-width: 1400px;
            margin: 0 auto;
        }}
        
        .header {{
            text-align: center;
            color: white;
            margin-bottom: 30px;
        }}
        
        .header h1 {{
            font-size: 2.5rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }}
        
        .header .subtitle {{
            font-size: 1.2rem;
            opacity: 0.9;
        }}
        
        .stats-grid {{
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }}
        
        .stat-card {{
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            transition: transform 0.3s ease;
        }}
        
        .stat-card:hover {{
            transform: translateY(-5px);
        }}
        
        .stat-card .icon {{
            font-size: 3rem;
            margin-bottom: 10px;
        }}
        
        .stat-card .value {{
            font-size: 2.5rem;
            font-weight: bold;
            color: #667eea;
            margin: 10px 0;
        }}
        
        .stat-card .label {{
            font-size: 1rem;
            color: #666;
        }}
        
        .progress-section {{
            background: white;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }}
        
        .progress-section h2 {{
            font-size: 1.8rem;
            color: #333;
            margin-bottom: 20px;
        }}
        
        .progress-bar {{
            background: #e0e0e0;
            border-radius: 50px;
            height: 40px;
            overflow: hidden;
            position: relative;
            margin-bottom: 15px;
        }}
        
        .progress-fill {{
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
            height: 100%;
            border-radius: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 1.1rem;
            transition: width 0.5s ease;
        }}
        
        .table-container {{
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            overflow-x: auto;
        }}
        
        .table-container h2 {{
            font-size: 1.8rem;
            color: #333;
            margin-bottom: 20px;
        }}
        
        table {{
            width: 100%;
            border-collapse: collapse;
        }}
        
        th {{
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }}
        
        td {{
            padding: 12px 15px;
            border-bottom: 1px solid #e0e0e0;
        }}
        
        tr:hover {{
            background: #f5f5f5;
        }}
        
        .badge {{
            display: inline-block;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
        }}
        
        .badge-success {{
            background: #2ecc71;
            color: white;
        }}
        
        .badge-pending {{
            background: #f39c12;
            color: white;
        }}
        
        .badge-sol {{
            background: #3498db;
            color: white;
        }}
        
        .badge-toiture {{
            background: #e74c3c;
            color: white;
        }}
        
        .timestamp {{
            text-align: center;
            color: white;
            margin-top: 20px;
            font-size: 0.9rem;
            opacity: 0.8;
        }}
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📊 DASHBOARD SUIVI AUDITS</h1>
            <div class="subtitle">Mission GIRASOLE 2025 - Diagnostic Photovoltaïque</div>
        </div>
        
        <div class="stats-grid">
            <div class="stat-card">
                <div class="icon">🎯</div>
                <div class="value">{nb_total}</div>
                <div class="label">Centrales Total</div>
            </div>
            
            <div class="stat-card">
                <div class="icon">✅</div>
                <div class="value">{nb_completes}</div>
                <div class="label">Audits Complétés</div>
            </div>
            
            <div class="stat-card">
                <div class="icon">⏳</div>
                <div class="value">{nb_restantes}</div>
                <div class="label">Audits Restants</div>
            </div>
            
            <div class="stat-card">
                <div class="icon">📈</div>
                <div class="value">{taux_completion}%</div>
                <div class="label">Taux Complétion</div>
            </div>
            
            <div class="stat-card">
                <div class="icon">🏠</div>
                <div class="value">{nb_sol}</div>
                <div class="label">Installations SOL</div>
            </div>
            
            <div class="stat-card">
                <div class="icon">🏢</div>
                <div class="value">{nb_toiture}</div>
                <div class="label">Installations TOITURE</div>
            </div>
            
            <div class="stat-card">
                <div class="icon">📸</div>
                <div class="value">{total_photos}</div>
                <div class="label">Photos Totales</div>
            </div>
            
            <div class="stat-card">
                <div class="icon">⚠️</div>
                <div class="value">{total_critiques + total_majeures}</div>
                <div class="label">Anomalies Critiques/Majeures</div>
            </div>
        </div>
        
        <div class="progress-section">
            <h2>Progression Globale</h2>
            <div class="progress-bar">
                <div class="progress-fill" style="width: {taux_completion}%">
                    {nb_completes}/{nb_total} centrales ({taux_completion}%)
                </div>
            </div>
            <p style="color: #666; font-size: 0.95rem;">
                📊 Moyenne photos/centrale : <strong>{avg_photos}</strong> | 
                ⚠️ Anomalies critiques : <strong>{total_critiques}</strong> | 
                ⚠️ Anomalies majeures : <strong>{total_majeures}</strong> | 
                ℹ️ Anomalies mineures : <strong>{total_mineures}</strong>
            </p>
        </div>
        
        <div class="table-container">
            <h2>Liste Centrales Auditées ({nb_completes})</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom Centrale</th>
                        <th>Type</th>
                        <th>Puissance</th>
                        <th>Date Audit</th>
                        <th>Photos</th>
                        <th>Anomalies C/M/m</th>
                        <th>Conformité CDC</th>
                    </tr>
                </thead>
                <tbody>
"""
    
    # Ajouter lignes tableau
    for audit in sorted(audits_completes, key=lambda x: x['id']):
        type_badge = 'badge-sol' if audit['type'] == 'SOL' else 'badge-toiture'
        html += f"""
                    <tr>
                        <td><strong>{audit['id']}</strong></td>
                        <td>{audit['nom']}</td>
                        <td><span class="badge {type_badge}">{audit['type']}</span></td>
                        <td>{audit['puissance_kwc']} kWc</td>
                        <td>{audit['date_audit']}</td>
                        <td>{audit['total_photos']}</td>
                        <td>{audit['anomalies_critiques']} / {audit['anomalies_majeures']} / {audit['anomalies_mineures']}</td>
                        <td><span class="badge badge-success">{audit['conformite_cdc']}</span></td>
                    </tr>
"""
    
    # Fermer HTML
    timestamp = datetime.now().strftime("%d/%m/%Y %H:%M:%S")
    html += f"""
                </tbody>
            </table>
        </div>
        
        <div class="timestamp">
            📅 Dernière mise à jour : {timestamp}
        </div>
    </div>
</body>
</html>
"""
    
    # Sauvegarder
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(html)


def main():
    """Génère dashboard suivi"""
    
    print("="*100)
    print("📊 GÉNÉRATEUR DASHBOARD SUIVI - GIRASOLE 2025")
    print("="*100)
    print()
    
    # Chemins
    base_dir = Path(__file__).parent.parent
    exports_dir = base_dir / 'exports_json'
    data_dir = base_dir / 'data'
    output_path = base_dir / 'DASHBOARD_SUIVI_AUDITS.html'
    
    # Charger liste 52 centrales
    centrales_path = data_dir / 'liste_52_centrales.json'
    if not centrales_path.exists():
        print(f"❌ Liste centrales introuvable : {centrales_path}")
        return
    
    centrales_liste = charger_json(centrales_path)
    print(f"📊 {len(centrales_liste)} centrales dans la liste\n")
    
    # Analyser JSON V4 disponibles
    audits_completes = []
    
    if exports_dir.exists():
        json_files = list(exports_dir.glob("AUDIT_*.json"))
        print(f"📊 {len(json_files)} fichiers JSON détectés\n")
        print("⚙️  Analyse audits complétés...\n")
        
        for json_path in json_files:
            audit_data = analyser_json_v4(json_path)
            if audit_data:
                audits_completes.append(audit_data)
                print(f"   ✅ {audit_data['id']} - {audit_data['nom']} ({audit_data['total_photos']} photos)")
    else:
        print(f"⚠️  Dossier exports_json introuvable\n")
    
    # Générer dashboard
    print(f"\n📊 Génération dashboard HTML...")
    generer_dashboard_html(centrales_liste, audits_completes, output_path)
    
    # Statistiques
    print()
    print("="*100)
    print("📊 DASHBOARD GÉNÉRÉ")
    print("="*100)
    print(f"✅ Centrales total : {len(centrales_liste)}")
    print(f"✅ Audits complétés : {len(audits_completes)}")
    print(f"⏳ Audits restants : {len(centrales_liste) - len(audits_completes)}")
    print(f"📈 Taux complétion : {round((len(audits_completes) / len(centrales_liste) * 100), 1) if len(centrales_liste) > 0 else 0}%")
    print(f"📁 Fichier : {output_path}")
    print("="*100)
    print()
    print("💡 Pour visualiser :")
    print(f"   open {output_path}")
    print()


if __name__ == "__main__":
    main()
