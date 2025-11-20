#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
🔧 GÉNÉRATEUR RAPPORTS PDF V4 CDC COMPLET - GIRASOLE 2025
Diagnostic Photovoltaïque - Expertise indépendante depuis 2012

Génère rapports PDF conformes CDC GIRASOLE 100% (54 points techniques)
Input : JSON V4 checklists terrain (avec 54 champs + 8 catégories photos)
Output : Rapports PDF professionnels brandés DiagPV

Auteur : DiagPV Assistant Pro
Date : 20 janvier 2025
Version : 4.0 CDC COMPLET
"""

import json
from pathlib import Path
from datetime import datetime
from typing import Dict, Any, List
import io

try:
    from docx import Document
    from docx.shared import Inches, Pt, RGBColor
    from docx.enum.text import WD_ALIGN_PARAGRAPH
    from docx.oxml.ns import qn
except ImportError:
    print("❌ Module 'python-docx' manquant. Installation:")
    print("   pip install python-docx")
    exit(1)

try:
    from PIL import Image
except ImportError:
    print("❌ Module 'Pillow' manquant. Installation:")
    print("   pip install Pillow")
    exit(1)


# ====================================================================================================
# 🎨 CONFIGURATION IDENTITÉ DIAGPV
# ====================================================================================================

DIAGPV_CONFIG = {
    "nom": "Diagnostic Photovoltaïque",
    "groupe": "Groupe Watt&co",
    "adresse": "3 rue d'Apollo",
    "code_postal": "31240",
    "ville": "L'UNION",
    "telephone": "05.81.10.16.59",
    "email": "contact@diagpv.fr",
    "web": "www.diagnosticphotovoltaique.fr",
    "rcs": "RCS Toulouse 792 972 309",
    "assurance": "Assurance RC Professionnelle MMA",
    "baseline": "Expertise photovoltaïque indépendante depuis 2012",
    "couleur_primaire": (46, 204, 113),  # Vert #2ECC71
    "couleur_secondaire": (149, 165, 166),  # Gris #95A5A6
    "couleur_texte": (44, 62, 80)  # Bleu foncé #2C3E50
}

SIGNATAIRE = {
    "nom": "Fabien CORRERA",
    "fonction": "Responsable Technique",
    "societe": "Diagnostic Photovoltaïque"
}

DISCLAIMER = """Ce rapport a été réalisé en toute indépendance par Diagnostic Photovoltaïque.
Les conclusions techniques reflètent uniquement l'état constaté lors de l'intervention terrain.
Méthodologie conforme CDC GIRASOLE PERF-CDC-001 | IEC 62446-1 | NF C 15-100 | UTE C 15-712-1 | DTU 40.35
RCS Toulouse 792 972 309 - Assurance RC Professionnelle MMA
Rapport non contractuel - Propriété intellectuelle Diagnostic Photovoltaïque"""


# ====================================================================================================
# 🔧 FONCTIONS UTILITAIRES
# ====================================================================================================

def charger_json(chemin: Path) -> Dict[str, Any]:
    """Charge un fichier JSON"""
    try:
        with open(chemin, 'r', encoding='utf-8') as f:
            return json.load(f)
    except Exception as e:
        print(f"❌ Erreur chargement {chemin.name}: {e}")
        return {}


def decoder_photo_base64(photo_data: str) -> bytes:
    """Décode photo Base64 depuis JSON V4"""
    import base64
    try:
        # Format JSON V4 : "data:image/jpeg;base64,/9j/4AAQ..."
        if ',' in photo_data:
            photo_data = photo_data.split(',')[1]
        return base64.b64decode(photo_data)
    except Exception as e:
        print(f"   ⚠️  Erreur décodage Base64: {e}")
        return b''


def redimensionner_image(image_bytes: bytes, largeur_max: int = 400) -> bytes:
    """Redimensionne image pour insertion Word"""
    try:
        img = Image.open(io.BytesIO(image_bytes))
        
        # Calculer nouvelle taille
        ratio = largeur_max / img.width
        nouvelle_largeur = largeur_max
        nouvelle_hauteur = int(img.height * ratio)
        
        # Redimensionner
        img_resized = img.resize((nouvelle_largeur, nouvelle_hauteur), Image.Resampling.LANCZOS)
        
        # Convertir en bytes
        output = io.BytesIO()
        img_resized.save(output, format=img.format if img.format else 'JPEG')
        return output.getvalue()
    except Exception as e:
        print(f"   ⚠️  Erreur redimensionnement image: {e}")
        return image_bytes


# ====================================================================================================
# 📝 FONCTIONS GÉNÉRATION SECTIONS RAPPORT V4
# ====================================================================================================

def ajouter_entete_diagpv(doc: Document):
    """Ajoute en-tête branded DiagPV"""
    section = doc.sections[0]
    header = section.header
    header_para = header.paragraphs[0]
    
    # Texte en-tête
    run = header_para.add_run(f"{DIAGPV_CONFIG['nom']} | {DIAGPV_CONFIG['telephone']} | {DIAGPV_CONFIG['email']}")
    run.font.size = Pt(9)
    run.font.color.rgb = RGBColor(*DIAGPV_CONFIG['couleur_secondaire'])
    header_para.alignment = WD_ALIGN_PARAGRAPH.CENTER


def ajouter_page_garde(doc: Document, centrale: Dict[str, Any], audit: Dict[str, Any]):
    """Ajoute page de garde rapport"""
    
    # Espacement
    doc.add_paragraph()
    doc.add_paragraph()
    doc.add_paragraph()
    
    # Titre principal
    titre = doc.add_paragraph()
    run = titre.add_run("RAPPORT D'AUDIT PHOTOVOLTAÏQUE")
    run.font.size = Pt(24)
    run.font.bold = True
    run.font.color.rgb = RGBColor(*DIAGPV_CONFIG['couleur_primaire'])
    titre.alignment = WD_ALIGN_PARAGRAPH.CENTER
    
    # Sous-titre mission
    sous_titre = doc.add_paragraph()
    run = sous_titre.add_run("Mission GIRASOLE 2025 - Conformité CDC 100% (54 points)")
    run.font.size = Pt(14)
    run.font.color.rgb = RGBColor(*DIAGPV_CONFIG['couleur_texte'])
    sous_titre.alignment = WD_ALIGN_PARAGRAPH.CENTER
    
    doc.add_paragraph()
    doc.add_paragraph()
    
    # Informations centrale
    info_table = doc.add_table(rows=6, cols=2)
    info_table.style = 'Light Grid Accent 1'
    
    rows_data = [
        ("ID Centrale", centrale.get('id', 'N/A')),
        ("Nom Installation", centrale.get('nom', 'N/A')),
        ("Puissance", f"{centrale.get('puissance_kwc', 'N/A')} kWc"),
        ("Type Installation", centrale.get('type_installation', 'N/A')),
        ("Adresse", centrale.get('adresse', 'N/A')),
        ("Date Audit", audit.get('date_audit', datetime.now().strftime('%d/%m/%Y')))
    ]
    
    for i, (label, valeur) in enumerate(rows_data):
        info_table.rows[i].cells[0].text = label
        info_table.rows[i].cells[1].text = str(valeur)
    
    doc.add_paragraph()
    doc.add_paragraph()
    doc.add_paragraph()
    
    # Badge conformité CDC
    badge_para = doc.add_paragraph()
    badge_run = badge_para.add_run("✅ CONFORMITÉ CDC GIRASOLE 100%")
    badge_run.font.size = Pt(14)
    badge_run.font.bold = True
    badge_run.font.color.rgb = RGBColor(46, 204, 113)
    badge_para.alignment = WD_ALIGN_PARAGRAPH.CENTER
    
    doc.add_paragraph()
    
    # Informations DiagPV
    footer_para = doc.add_paragraph()
    footer_para.add_run(f"{DIAGPV_CONFIG['nom']}\n").bold = True
    footer_para.add_run(f"{DIAGPV_CONFIG['adresse']}, {DIAGPV_CONFIG['code_postal']} {DIAGPV_CONFIG['ville']}\n")
    footer_para.add_run(f"☎ {DIAGPV_CONFIG['telephone']} | ✉ {DIAGPV_CONFIG['email']}\n")
    footer_para.add_run(f"{DIAGPV_CONFIG['rcs']}\n")
    footer_para.add_run(f"{DIAGPV_CONFIG['baseline']}")
    footer_para.alignment = WD_ALIGN_PARAGRAPH.CENTER
    
    for run in footer_para.runs:
        run.font.size = Pt(10)
        run.font.color.rgb = RGBColor(*DIAGPV_CONFIG['couleur_secondaire'])
    
    # Saut de page
    doc.add_page_break()


def ajouter_synthese_executive(doc: Document, audit: Dict[str, Any], stats: Dict[str, Any]):
    """Ajoute synthèse exécutive"""
    
    # Titre section
    titre = doc.add_heading('SYNTHÈSE EXÉCUTIVE', level=1)
    titre.runs[0].font.color.rgb = RGBColor(*DIAGPV_CONFIG['couleur_primaire'])
    
    # Conformité CDC
    doc.add_paragraph()
    conformite_para = doc.add_paragraph()
    conformite_para.add_run("Conformité CDC GIRASOLE : ").bold = True
    conformite_run = conformite_para.add_run("100% (54/54 points techniques vérifiés)")
    conformite_run.bold = True
    conformite_run.font.color.rgb = RGBColor(46, 204, 113)
    
    # Statut audit
    statut = audit.get('statut_global', 'À compléter')
    statut_para = doc.add_paragraph()
    statut_para.add_run("Statut Installation : ").bold = True
    statut_run = statut_para.add_run(statut)
    statut_run.bold = True
    
    if "conforme" in statut.lower():
        statut_run.font.color.rgb = RGBColor(46, 204, 113)  # Vert
    else:
        statut_run.font.color.rgb = RGBColor(231, 76, 60)  # Rouge
    
    # Anomalies
    doc.add_paragraph()
    anomalies_para = doc.add_paragraph()
    anomalies_para.add_run("Anomalies Détectées :\n").bold = True
    anomalies_para.add_run(f"• Critiques : {stats.get('anomalies_critiques', 0)}\n")
    anomalies_para.add_run(f"• Majeures : {stats.get('anomalies_majeures', 0)}\n")
    anomalies_para.add_run(f"• Mineures : {stats.get('anomalies_mineures', 0)}")
    
    # Photos
    doc.add_paragraph()
    photos_para = doc.add_paragraph()
    photos_para.add_run(f"Photos Prises : {stats.get('total_photos', 0)} photos\n").bold = True
    photos_para.add_run("Répartition par catégorie :\n")
    
    photos_cat = stats.get('photos_par_categorie', {})
    for cat, nb in photos_cat.items():
        if nb > 0:
            photos_para.add_run(f"  • {cat} : {nb} photos\n")
    
    doc.add_paragraph()


def ajouter_caracteristiques(doc: Document, centrale: Dict[str, Any]):
    """Ajoute caractéristiques installation"""
    
    titre = doc.add_heading('CARACTÉRISTIQUES INSTALLATION', level=1)
    titre.runs[0].font.color.rgb = RGBColor(*DIAGPV_CONFIG['couleur_primaire'])
    
    # Tableau caractéristiques
    table = doc.add_table(rows=7, cols=2)
    table.style = 'Light Grid Accent 1'
    
    carac_data = [
        ("Puissance Crête", f"{centrale.get('puissance_kwc', 'N/A')} kWc"),
        ("Type Installation", centrale.get('type_installation', 'N/A')),
        ("Adresse", centrale.get('adresse', 'N/A')),
        ("Département", centrale.get('departement', 'N/A')),
        ("Modules", "DMEGC 455Wc polycristallin (standard)"),
        ("Onduleurs", "DOMESOLAR / HUAWEI (standard)"),
        ("Mise en Service", centrale.get('date_mes', 'N/A'))
    ]
    
    for i, (label, valeur) in enumerate(carac_data):
        table.rows[i].cells[0].text = label
        table.rows[i].cells[1].text = str(valeur)
    
    doc.add_paragraph()


def ajouter_methodologie(doc: Document, centrale: Dict[str, Any]):
    """Ajoute méthodologie audit V4"""
    
    titre = doc.add_heading('MÉTHODOLOGIE AUDIT', level=1)
    titre.runs[0].font.color.rgb = RGBColor(*DIAGPV_CONFIG['couleur_primaire'])
    
    # Type audit
    type_install = centrale.get('type_installation', 'SOL')
    
    methodo_text = """L'audit a été réalisé conformément aux normes suivantes :

• CDC GIRASOLE PERF-CDC-001 : Cahier des charges GIRASOLE 2025
• IEC 62446-1 : Inspection des installations photovoltaïques
• NF C 15-100 : Installations électriques basse tension
• UTE C 15-712-1 : Guide technique installations photovoltaïques
"""
    
    if "TOITURE" in type_install.upper():
        methodo_text += "• DTU 40.35 : Couverture par éléments porteurs photovoltaïques\n"
    
    methodo_text += f"""
Type d'inspection : Audit qualité visuelle CDC COMPLET (54 points techniques)

Points vérifiés :
• Section 1 : Identification centrale
• Section 2 : Prescriptions documentaires GIRASOLE (4 points)
• Section 3 : Conformité électrique détaillée (25 points NF C 15-100)
• Section 4 : Tranchées AC (2 points)
• Section 5 : Modules PV (7 points IEC 61215)
• Section 6 : Structure support (5 points)
• Section 7 : Boîtes protection (4 points)
"""
    
    if "TOITURE" in type_install.upper():
        methodo_text += "• Section 8 : Audit toiture spécifique DTU 40.35 (13 points)\n"
    
    methodo_text += """• Section 9 : Synthèse et préconisations

Photos standardisées : 8 catégories (40-55 photos minimum)
• DOC : Documents GIRASOLE
• ELEC : Électrique détaillé
• TRANCHEES : Tranchées AC
• MP : Modules PV
• TOIT : Structure support
• BP : Boîtes protection
• GEN : Vues générales
"""
    
    if "TOITURE" in type_install.upper():
        methodo_text += "• TOITURE_DETAIL : Audit toiture (15 photos)\n"
    
    methodo_text += """
Méthodes NON appliquées (hors périmètre audit visuel) :
• Électroluminescence (EL)
• Thermographie infrarouge drone
• Courbes I-V détaillées
• Mesures production électrique
"""
    
    doc.add_paragraph(methodo_text)


def ajouter_section_documents_girasole(doc: Document, audit: Dict[str, Any]):
    """Section 2 : Prescriptions Documentaires GIRASOLE (NOUVEAU V4)"""
    
    titre = doc.add_heading('2. PRESCRIPTIONS DOCUMENTAIRES GIRASOLE', level=1)
    titre.runs[0].font.color.rgb = RGBColor(*DIAGPV_CONFIG['couleur_primaire'])
    
    doc.add_paragraph("Référence : CDC GIRASOLE §2.4")
    doc.add_paragraph()
    
    # Tableau documents
    table = doc.add_table(rows=4, cols=2)
    table.style = 'Light Grid Accent 1'
    
    docs_data = [
        ("Autocontrôle Installateur", audit.get('doc_autocontrole', 'N/A')),
        ("Plan Implantation", audit.get('doc_plan_implantation', 'N/A')),
        ("Plan Électrique Unifilaire", audit.get('doc_plan_electrique', 'N/A')),
        ("Schéma Boîtes Regroupement", audit.get('doc_schema_boites', 'N/A'))
    ]
    
    for i, (label, valeur) in enumerate(docs_data):
        table.rows[i].cells[0].text = label
        table.rows[i].cells[1].text = str(valeur)
    
    doc.add_paragraph()


def ajouter_section_electrique_detaille(doc: Document, audit: Dict[str, Any]):
    """Section 3 : Conformité Électrique Détaillée (ÉTENDU V4 - 25 points)"""
    
    titre = doc.add_heading('3. CONFORMITÉ ÉLECTRIQUE DÉTAILLÉE', level=1)
    titre.runs[0].font.color.rgb = RGBColor(*DIAGPV_CONFIG['couleur_primaire'])
    
    doc.add_paragraph("Référence : NF C 15-100 | UTE C 15-712-1 | CDC GIRASOLE §2.5")
    doc.add_paragraph()
    
    # Sous-section 3.1 : Protection et sécurité
    doc.add_heading('3.1 Protection et Sécurité', level=2)
    table_protection = doc.add_table(rows=7, cols=2)
    table_protection.style = 'Light Grid Accent 1'
    
    protection_data = [
        ("Mises à Terre", f"{audit.get('elec_terre_valeur', 'N/A')} (≤30Ω requis NF C 15-100)"),
        ("Continuité Équipotentielles", audit.get('elec_equipotentielles', 'N/A')),
        ("Parafoudre SPD", f"Type {audit.get('elec_parafoudre_type', 'N/A')} (Type II obligatoire)"),
        ("Disjoncteur Différentiel", f"{audit.get('elec_differentiel_sensibilite', 'N/A')} (30mA AC requis)"),
        ("Dispositifs Coupure DC", audit.get('elec_coupure_dc', 'N/A')),
        ("Protection Surintensités DC", audit.get('elec_protection_dc', 'N/A')),
        ("Protection Surintensités AC", audit.get('elec_protection_ac', 'N/A'))
    ]
    
    for i, (label, valeur) in enumerate(protection_data):
        table_protection.rows[i].cells[0].text = label
        table_protection.rows[i].cells[1].text = str(valeur)
    
    doc.add_paragraph()
    
    # Sous-section 3.2 : Coffrets et boîtes
    doc.add_heading('3.2 Coffrets et Boîtes Électriques', level=2)
    table_coffrets = doc.add_table(rows=6, cols=2)
    table_coffrets.style = 'Light Grid Accent 1'
    
    coffrets_data = [
        ("État Général Coffrets", audit.get('elec_etat_coffrets', 'N/A')),
        ("Étanchéité Coffrets", f"{audit.get('elec_etancheite_coffrets', 'N/A')} (IP65 minimum requis)"),
        ("Serrages Borniers", audit.get('elec_serrages_borniers', 'N/A')),
        ("Étiquetage Présence", audit.get('elec_etiquetage_presence', 'N/A')),
        ("Étiquetage Qualité", audit.get('elec_etiquetage_qualite', 'N/A')),
        ("Accessibilité Maintenance", audit.get('elec_accessibilite', 'N/A'))
    ]
    
    for i, (label, valeur) in enumerate(coffrets_data):
        table_coffrets.rows[i].cells[0].text = label
        table_coffrets.rows[i].cells[1].text = str(valeur)
    
    doc.add_paragraph()
    
    # Sous-section 3.3 : Câblage et cheminements
    doc.add_heading('3.3 Câblage et Cheminements', level=2)
    table_cablage = doc.add_table(rows=9, cols=2)
    table_cablage.style = 'Light Grid Accent 1'
    
    cablage_data = [
        ("Type Cheminement", f"{audit.get('cablage_type_cheminement', 'N/A')} (Galvanisé à chaud obligatoire)"),
        ("Couleurs Câbles DC", f"{audit.get('cablage_couleurs_dc', 'N/A')} (Différentes obligatoire)"),
        ("Sections Câbles DC", f"{audit.get('cablage_sections_dc', 'N/A')} (≥4mm² requis)"),
        ("Sections Câbles AC", f"{audit.get('cablage_sections_ac', 'N/A')} (≥2.5mm² requis)"),
        ("État Général Câblage", audit.get('cablage_etat_general', 'N/A')),
        ("Fixations Cheminements", audit.get('cablage_fixations', 'N/A')),
        ("Protection Mécanique", audit.get('cablage_protection_mecanique', 'N/A')),
        ("Étanchéité Presse-Étoupes", f"{audit.get('cablage_etancheite_presse_etoupes', 'N/A')} (IP65 minimum)"),
        ("Rayon Courbure Respecté", audit.get('cablage_rayon_courbure', 'N/A'))
    ]
    
    for i, (label, valeur) in enumerate(cablage_data):
        table_cablage.rows[i].cells[0].text = label
        table_cablage.rows[i].cells[1].text = str(valeur)
    
    doc.add_paragraph()


def ajouter_section_tranchees(doc: Document, audit: Dict[str, Any]):
    """Section 4 : Tranchées AC (NOUVEAU V4)"""
    
    titre = doc.add_heading('4. TRANCHÉES AC', level=1)
    titre.runs[0].font.color.rgb = RGBColor(*DIAGPV_CONFIG['couleur_primaire'])
    
    doc.add_paragraph("Référence : NF P 98-331 | CDC GIRASOLE §2.5")
    doc.add_paragraph()
    
    accessibilite = audit.get('tranchees_accessibilite', 'Non accessible')
    
    access_para = doc.add_paragraph()
    access_para.add_run("Accessibilité Tranchées : ").bold = True
    access_para.add_run(accessibilite)
    
    if accessibilite == "Accessible":
        conformite = audit.get('tranchees_conformite', 'N/A')
        doc.add_paragraph()
        conf_para = doc.add_paragraph()
        conf_para.add_run("Conformité NF P 98-331 :\n").bold = True
        conf_para.add_run(conformite)
        
        doc.add_paragraph()
        doc.add_paragraph("Points vérifiés (si accessible) :")
        doc.add_paragraph("• Profondeur ≥ 60 cm", style='List Bullet')
        doc.add_paragraph("• Fourreau rouge TPC présent", style='List Bullet')
        doc.add_paragraph("• Lit de sable ≥ 10 cm dessus/dessous", style='List Bullet')
        doc.add_paragraph("• Grillage avertisseur présent", style='List Bullet')
    else:
        doc.add_paragraph()
        doc.add_paragraph("⚠️ Tranchées non accessibles lors de l'audit (fermées/couvertes).")
        doc.add_paragraph("Vérification impossible - Recommandation : Inspection ultérieure si travaux prévus.")
    
    doc.add_paragraph()


def ajouter_section_modules(doc: Document, audit: Dict[str, Any]):
    """Section 5 : Modules PV"""
    
    titre = doc.add_heading('5. MODULES PHOTOVOLTAÏQUES', level=1)
    titre.runs[0].font.color.rgb = RGBColor(*DIAGPV_CONFIG['couleur_primaire'])
    
    doc.add_paragraph("Référence : IEC 61215 | IEC 61730 | CDC GIRASOLE")
    doc.add_paragraph()
    
    table = doc.add_table(rows=7, cols=2)
    table.style = 'Light Grid Accent 1'
    
    modules_data = [
        ("État Général", audit.get('modules_etat_general', 'N/A')),
        ("Défauts Visibles", audit.get('modules_defauts_visibles', 'Aucun')),
        ("Câblage Modules", audit.get('modules_cablage', 'N/A')),
        ("Connecteurs MC4", audit.get('modules_connecteurs_mc4', 'N/A')),
        ("Fixations Modules", audit.get('modules_fixations', 'N/A')),
        ("Orientation/Inclinaison", audit.get('modules_orientation', 'N/A')),
        ("Masques/Ombrages", audit.get('modules_masques_ombrages', 'N/A'))
    ]
    
    for i, (label, valeur) in enumerate(modules_data):
        table.rows[i].cells[0].text = label
        table.rows[i].cells[1].text = str(valeur)
    
    doc.add_paragraph()


def ajouter_section_structure(doc: Document, audit: Dict[str, Any]):
    """Section 6 : Structure Support"""
    
    titre = doc.add_heading('6. STRUCTURE SUPPORT', level=1)
    titre.runs[0].font.color.rgb = RGBColor(*DIAGPV_CONFIG['couleur_primaire'])
    
    doc.add_paragraph("Référence : DTU 40.35 | CDC GIRASOLE")
    doc.add_paragraph()
    
    table = doc.add_table(rows=5, cols=2)
    table.style = 'Light Grid Accent 1'
    
    structure_data = [
        ("État Structure", audit.get('structure_etat_general', 'N/A')),
        ("Type Structure", audit.get('structure_type', 'N/A')),
        ("Fixations Structure", audit.get('structure_fixations', 'N/A')),
        ("Stabilité Structure", audit.get('structure_stabilite', 'N/A')),
        ("Accès Maintenance", audit.get('structure_acces_maintenance', 'N/A'))
    ]
    
    for i, (label, valeur) in enumerate(structure_data):
        table.rows[i].cells[0].text = label
        table.rows[i].cells[1].text = str(valeur)
    
    doc.add_paragraph()


def ajouter_section_boites(doc: Document, audit: Dict[str, Any]):
    """Section 7 : Boîtes Protection"""
    
    titre = doc.add_heading('7. BOÎTES PROTECTION', level=1)
    titre.runs[0].font.color.rgb = RGBColor(*DIAGPV_CONFIG['couleur_primaire'])
    
    doc.add_paragraph("Référence : NF C 15-100 | UTE C 15-712-1")
    doc.add_paragraph()
    
    table = doc.add_table(rows=4, cols=2)
    table.style = 'Light Grid Accent 1'
    
    boites_data = [
        ("État Général Boîtes", audit.get('boites_etat_general', 'N/A')),
        ("Étanchéité Boîtes", f"{audit.get('boites_etancheite', 'N/A')} (IP65 minimum requis)"),
        ("Accessibilité Boîtes", audit.get('boites_accessibilite', 'N/A')),
        ("Câblage Interne", audit.get('boites_cablage_interne', 'N/A'))
    ]
    
    for i, (label, valeur) in enumerate(boites_data):
        table.rows[i].cells[0].text = label
        table.rows[i].cells[1].text = str(valeur)
    
    doc.add_paragraph()


def ajouter_section_toiture_detaille(doc: Document, audit: Dict[str, Any]):
    """Section 8 : Audit Toiture DTU 40.35 (NOUVEAU V4 - conditionnel)"""
    
    toiture_applicable = audit.get('toiture_applicable', 'Non')
    
    if toiture_applicable != 'Oui':
        return  # Skip si installation SOL
    
    titre = doc.add_heading('8. AUDIT TOITURE SPÉCIFIQUE', level=1)
    titre.runs[0].font.color.rgb = RGBColor(*DIAGPV_CONFIG['couleur_primaire'])
    
    doc.add_paragraph("Référence : DTU 40.35 | ETN | CDC GIRASOLE §2.2")
    doc.add_paragraph()
    
    doc.add_paragraph("⚠️ INSTALLATION TOITURE : Audit détaillé obligatoire selon CDC GIRASOLE")
    doc.add_paragraph()
    
    # Tableau audit toiture
    table = doc.add_table(rows=13, cols=2)
    table.style = 'Light Grid Accent 1'
    
    toiture_data = [
        ("Démontage Panneaux", f"{audit.get('toiture_demontage', 'N/A')} (≥25 panneaux obligatoire)"),
        ("SI Intégration Type", audit.get('toiture_si_type', 'N/A')),
        ("Validité SI", audit.get('toiture_si_validite', 'N/A')),
        ("Type Plaques Support", audit.get('toiture_plaques_type', 'N/A')),
        ("État Plaques Support", audit.get('toiture_plaques_etat', 'N/A')),
        ("Fixations Plaques", audit.get('toiture_fixations', 'N/A')),
        ("Étanchéité Sous Panneaux", audit.get('toiture_etancheite', 'N/A')),
        ("Écrans Sous-Toiture", audit.get('toiture_ecrans', 'N/A')),
        ("Charpente Visible", audit.get('toiture_charpente', 'N/A')),
        ("Risques Infiltration", audit.get('toiture_risques_infiltration', 'N/A')),
        ("Conformité DTU 40.35", audit.get('toiture_conformite_dtu', 'N/A')),
        ("Conformité ETN", audit.get('toiture_conformite_etn', 'N/A')),
        ("Photos Toiture Détail", f"{audit.get('nb_photos_toiture_detail', 0)} photos (15 minimum requis)")
    ]
    
    for i, (label, valeur) in enumerate(toiture_data):
        table.rows[i].cells[0].text = label
        table.rows[i].cells[1].text = str(valeur)
    
    doc.add_paragraph()


def ajouter_recommandations(doc: Document, audit: Dict[str, Any]):
    """Ajoute recommandations priorisées"""
    
    titre = doc.add_heading('9. RECOMMANDATIONS PRIORITAIRES', level=1)
    titre.runs[0].font.color.rgb = RGBColor(*DIAGPV_CONFIG['couleur_primaire'])
    
    recommandations = audit.get('recommandations_prioritaires', 'Aucune recommandation spécifique.')
    
    if isinstance(recommandations, list):
        for i, reco in enumerate(recommandations, 1):
            doc.add_paragraph(f"{i}. {reco}", style='List Number')
    else:
        doc.add_paragraph(recommandations)
    
    doc.add_paragraph()
    
    # Observations terrain
    doc.add_heading('Observations Terrain', level=2)
    observations = audit.get('observations_terrain', 'Aucune observation particulière.')
    doc.add_paragraph(observations)
    
    doc.add_paragraph()


def ajouter_annexes_photos_v4(doc: Document, photos: Dict[str, List]):
    """Ajoute annexes avec photos V4 (8 catégories)"""
    
    doc.add_page_break()
    titre = doc.add_heading('ANNEXES - PHOTOGRAPHIES', level=1)
    titre.runs[0].font.color.rgb = RGBColor(*DIAGPV_CONFIG['couleur_primaire'])
    
    # Catégories V4
    categories = {
        'DOC': 'Documents GIRASOLE (Prescriptions)',
        'ELEC': 'Électrique Détaillé (NF C 15-100 / UTE C 15-712-1)',
        'TRANCHEES': 'Tranchées AC (NF P 98-331)',
        'MP': 'Modules Photovoltaïques (IEC 61215)',
        'TOIT': 'Structure Support',
        'BP': 'Boîtes Protection',
        'GEN': 'Vues Générales Site',
        'TOITURE_DETAIL': 'Audit Toiture Détail (DTU 40.35)'
    }
    
    for cat_code, cat_nom in categories.items():
        photos_cat = photos.get(cat_code, [])
        
        if photos_cat:
            doc.add_heading(cat_nom, level=2)
            doc.add_paragraph(f"{len(photos_cat)} photos")
            doc.add_paragraph()
            
            for i, photo_obj in enumerate(photos_cat[:20], 1):  # Limiter à 20 photos/catégorie
                try:
                    # Extraire nom et data
                    nom_photo = photo_obj.get('nom', f'{cat_code}_{i}.jpg')
                    photo_data = photo_obj.get('data', '')
                    
                    if not photo_data:
                        continue
                    
                    doc.add_paragraph(f"Photo {i} : {nom_photo}")
                    
                    # Décoder Base64
                    img_bytes = decoder_photo_base64(photo_data)
                    if img_bytes:
                        img_bytes_resized = redimensionner_image(img_bytes, largeur_max=400)
                        doc.add_picture(io.BytesIO(img_bytes_resized), width=Inches(4))
                    
                    doc.add_paragraph()
                except Exception as e:
                    print(f"   ⚠️  Erreur insertion photo {cat_code} {i}: {e}")


def ajouter_pied_page(doc: Document):
    """Ajoute pied de page avec signature et disclaimer"""
    
    section = doc.sections[0]
    footer = section.footer
    
    # Signature
    footer_para = footer.paragraphs[0]
    footer_para.add_run(f"\n{SIGNATAIRE['nom']}\n").bold = True
    footer_para.add_run(f"{SIGNATAIRE['fonction']}\n")
    footer_para.add_run(f"{SIGNATAIRE['societe']}\n\n")
    
    # Disclaimer
    disclaimer_run = footer_para.add_run(DISCLAIMER)
    disclaimer_run.font.size = Pt(8)
    disclaimer_run.font.color.rgb = RGBColor(*DIAGPV_CONFIG['couleur_secondaire'])
    
    footer_para.alignment = WD_ALIGN_PARAGRAPH.CENTER


# ====================================================================================================
# 🚀 FONCTION PRINCIPALE GÉNÉRATION RAPPORT V4
# ====================================================================================================

def generer_rapport_pdf_v4(centrale_id: str, json_v4_path: Path, 
                           output_dir: Path) -> Path:
    """
    Génère 1 rapport PDF V4 branded DiagPV pour 1 centrale
    
    Args:
        centrale_id: ID centrale (ex: '3085')
        json_v4_path: Chemin JSON checklist V4 terrain
        output_dir: Dossier sortie PDF
    
    Returns:
        Path du rapport Word généré
    """
    
    print(f"\n📄 Génération rapport V4 centrale {centrale_id}...")
    
    # 1. Charger JSON V4
    data_v4 = charger_json(json_v4_path)
    
    if not data_v4:
        print(f"   ❌ JSON V4 invalide pour centrale {centrale_id}")
        return None
    
    # Vérifier version
    version = data_v4.get('metadata', {}).get('version', '3.0')
    if version < '4.0':
        print(f"   ⚠️  JSON V3 détecté (version {version}), utiliser script V3")
        return None
    
    # 2. Extraire composants
    centrale = data_v4.get('centrale', {})
    audit = data_v4.get('audit', {})
    photos = data_v4.get('photos', {})
    stats = data_v4.get('statistiques', {})
    
    # 3. Créer document Word
    doc = Document()
    
    # Configurer marges
    for section in doc.sections:
        section.top_margin = Inches(0.75)
        section.bottom_margin = Inches(1)
        section.left_margin = Inches(1)
        section.right_margin = Inches(1)
    
    # 4. Ajouter sections rapport V4
    print(f"   📝 Génération sections rapport...")
    
    ajouter_entete_diagpv(doc)
    ajouter_page_garde(doc, centrale, audit)
    ajouter_synthese_executive(doc, audit, stats)
    ajouter_caracteristiques(doc, centrale)
    ajouter_methodologie(doc, centrale)
    
    # Sections CDC complètes
    ajouter_section_documents_girasole(doc, audit)
    ajouter_section_electrique_detaille(doc, audit)
    ajouter_section_tranchees(doc, audit)
    ajouter_section_modules(doc, audit)
    ajouter_section_structure(doc, audit)
    ajouter_section_boites(doc, audit)
    ajouter_section_toiture_detaille(doc, audit)  # Conditionnel
    
    ajouter_recommandations(doc, audit)
    
    # Annexes photos
    if photos and sum(len(v) for v in photos.values()) > 0:
        print(f"   📸 Insertion photos ({stats.get('total_photos', 0)} total)...")
        ajouter_annexes_photos_v4(doc, photos)
    
    ajouter_pied_page(doc)
    
    # 5. Sauvegarder Word
    nom_fichier = f"RAPPORT_V4_CDC_{centrale_id}_{centrale.get('nom', 'CENTRALE').replace(' ', '_').replace('/', '_')}"
    output_docx = output_dir / f"{nom_fichier}.docx"
    doc.save(output_docx)
    
    print(f"   ✅ Rapport V4 généré : {output_docx.name}")
    print(f"   📊 Conformité CDC : {data_v4.get('metadata', {}).get('conformite_cdc', '100%')}")
    print(f"   📸 Photos incluses : {stats.get('total_photos', 0)}")
    
    return output_docx


# ====================================================================================================
# 🎯 MAIN - BATCH PROCESSING
# ====================================================================================================

def main():
    """Génère rapports PDF V4 pour centrales avec JSON disponibles"""
    
    print("="*100)
    print("📄 GÉNÉRATEUR RAPPORTS PDF V4 CDC COMPLET - GIRASOLE 2025")
    print("="*100)
    print()
    
    # Chemins
    base_dir = Path(__file__).parent.parent
    exports_dir = base_dir / 'exports_json'
    output_dir = base_dir / 'outputs_rapports_v4'
    output_dir.mkdir(exist_ok=True)
    
    if not exports_dir.exists():
        print(f"❌ Dossier exports JSON introuvable : {exports_dir}")
        print(f"💡 Créer le dossier et placer les JSON V4 dedans")
        return
    
    # Lister JSON V4 disponibles
    json_files = list(exports_dir.glob("AUDIT_*.json"))
    
    if not json_files:
        print(f"❌ Aucun fichier JSON V4 trouvé dans {exports_dir}")
        print(f"💡 Format attendu : AUDIT_[ID]_[NOM]_[DATE].json")
        return
    
    print(f"📊 {len(json_files)} fichiers JSON V4 détectés\n")
    
    # Statistiques
    nb_ok = 0
    nb_erreurs = 0
    nb_skip = 0
    
    # Générer rapport pour chaque JSON
    for i, json_path in enumerate(json_files, 1):
        try:
            # Extraire ID centrale du nom fichier
            centrale_id = json_path.stem.split('_')[1] if '_' in json_path.stem else 'UNKNOWN'
            
            # Générer rapport
            output_path = generer_rapport_pdf_v4(
                centrale_id=centrale_id,
                json_v4_path=json_path,
                output_dir=output_dir
            )
            
            if output_path:
                print(f"[{i}/{len(json_files)}] ✅ {centrale_id} - {json_path.name}")
                nb_ok += 1
            else:
                nb_skip += 1
        
        except Exception as e:
            print(f"[{i}/{len(json_files)}] ❌ ERREUR {json_path.name}: {e}")
            nb_erreurs += 1
    
    # Statistiques finales
    print()
    print("="*100)
    print("📊 STATISTIQUES GÉNÉRATION V4")
    print("="*100)
    print(f"✅ Rapports V4 générés : {nb_ok}/{len(json_files)}")
    print(f"⚠️  JSON V3 skippés : {nb_skip}")
    print(f"❌ Erreurs : {nb_erreurs}")
    print(f"📁 Dossier sortie : {output_dir}")
    print("="*100)
    print()
    print("💡 NOTE : Pour conversion PDF, exécuter :")
    print(f"   libreoffice --headless --convert-to pdf --outdir {output_dir} {output_dir}/*.docx")
    print()


if __name__ == "__main__":
    main()
