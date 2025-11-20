#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
✅ VALIDATEUR JSON V4 - GIRASOLE 2025
Diagnostic Photovoltaïque

Valide structure et conformité JSON V4 avant génération rapports
Vérifie : version, structure, 54 champs CDC, photos (quotas + catégories)

Input : JSON V4 exports_json/
Output : Rapport validation détaillé (pass/fail + erreurs spécifiques)

Auteur : DiagPV Assistant Pro
Date : 20 janvier 2025
Version : 1.0
"""

import json
from pathlib import Path
from datetime import datetime
from typing import Dict, Any, List, Tuple


# ====================================================================================================
# 📋 RÉFÉRENTIEL VALIDATION V4 CDC
# ====================================================================================================

# Champs obligatoires metadata
CHAMPS_METADATA_REQUIS = {
    'version': str,
    'date_export': str,
    'application': str
}

# Champs obligatoires centrale
CHAMPS_CENTRALE_REQUIS = {
    'id': str,
    'nom': str,
    'type': str,  # SOL ou TOITURE
    'puissance_kwc': (int, float),
    'adresse': str,
    'code_postal': str,
    'ville': str,
    'departement': str,
    'latitude': (int, float),
    'longitude': (int, float),
    'date_mes': str,
    'exploitant': str
}

# 54 champs CDC obligatoires (audit)
CHAMPS_AUDIT_REQUIS_CDC = {
    # SECTION 1 : Documentation (9 points)
    'doc_plans_disponibles': str,
    'doc_schemas_elec': str,
    'doc_datasheet_modules': str,
    'doc_datasheet_onduleurs': str,
    'doc_certificats_conformite': str,
    'doc_rapports_precedents': str,
    'doc_garanties': str,
    'doc_contrats_maintenance': str,
    'doc_dossier_qualite': str,
    
    # SECTION 2 : Contexte Installation (6 points)
    'contexte_date_installation': str,
    'contexte_integrations_techniques': str,
    'contexte_historique_anomalies': str,
    'contexte_modifications': str,
    'contexte_environnement': str,
    'contexte_acces_securite': str,
    
    # SECTION 3 : Vérifications Electriques (25 points)
    'elec_continuite_masses': str,
    'elec_resistance_isolement': str,
    'elec_polarite_strings': str,
    'elec_tension_voc': str,
    'elec_courant_isc': str,
    'elec_protections_surintensites': str,
    'elec_protections_surtensions': str,
    'elec_sectionneurs': str,
    'elec_boites_jonction': str,
    'elec_armoires_elec': str,
    'elec_cablage_sections': str,
    'elec_identification_cables': str,
    'elec_cheminement_cables': str,
    'elec_connecteurs_mc4': str,
    'elec_mise_terre': str,
    'elec_parafoudres': str,
    'elec_disjoncteurs': str,
    'elec_tableaux_elec': str,
    'elec_onduleurs_fonctionnement': str,
    'elec_onduleurs_parametres': str,
    'elec_onduleurs_ventilation': str,
    'elec_onduleurs_temperature': str,
    'elec_transformateurs': str,
    'elec_compteurs': str,
    'elec_supervision': str,
    
    # SECTION 4 : Structures & Etanchéité (14 points)
    'struct_fixations_modules': str,
    'struct_rails_structures': str,
    'struct_fondations': str,
    'struct_assemblages': str,
    'struct_corrosion': str,
    'struct_deformations': str,
    'struct_etancheite_toiture': str,
    'struct_ecrans_sous_toiture': str,
    'struct_traversees_toiture': str,
    'struct_joints_etancheite': str,
    'struct_gestion_eaux': str,
    'struct_vegetalisation': str,
    'struct_acces_maintenance': str,
    'struct_balisage_securite': str
}

# Catégories photos V4 (8 obligatoires)
CATEGORIES_PHOTOS_V4 = [
    'DOC',           # Documentation
    'ELEC',          # Électrique
    'TRANCHEES',     # Tranchées/cheminements
    'MP',            # Modules photovoltaïques
    'TOIT',          # Toiture vue générale
    'BP',            # Boîtes de jonction/protection
    'GEN',           # Vues générales centrale
    'TOITURE_DETAIL' # Détails toiture/étanchéité
]

# Quotas photos minimum par type centrale
QUOTAS_PHOTOS_MINIMUM = {
    'SOL': 40,
    'TOITURE': 55
}


# ====================================================================================================
# 🔧 FONCTIONS VALIDATION
# ====================================================================================================

def charger_json(json_path: Path) -> Dict[str, Any]:
    """Charge fichier JSON"""
    try:
        with open(json_path, 'r', encoding='utf-8') as f:
            return json.load(f)
    except Exception as e:
        return {'erreur': f"Erreur chargement JSON : {e}"}


def valider_version(data: Dict[str, Any]) -> Tuple[bool, List[str]]:
    """Valide version JSON ≥ 4.0"""
    erreurs = []
    
    metadata = data.get('metadata', {})
    version_str = metadata.get('version', '0.0')
    
    try:
        version_num = float(version_str)
        if version_num < 4.0:
            erreurs.append(f"❌ Version JSON insuffisante : {version_str} (requis ≥ 4.0)")
            return False, erreurs
    except ValueError:
        erreurs.append(f"❌ Version JSON invalide : {version_str}")
        return False, erreurs
    
    return True, erreurs


def valider_structure(data: Dict[str, Any]) -> Tuple[bool, List[str]]:
    """Valide structure globale JSON V4"""
    erreurs = []
    
    sections_requises = ['metadata', 'centrale', 'audit', 'photos', 'statistiques']
    
    for section in sections_requises:
        if section not in data:
            erreurs.append(f"❌ Section manquante : {section}")
    
    return len(erreurs) == 0, erreurs


def valider_champs_metadata(data: Dict[str, Any]) -> Tuple[bool, List[str]]:
    """Valide champs metadata"""
    erreurs = []
    metadata = data.get('metadata', {})
    
    for champ, type_attendu in CHAMPS_METADATA_REQUIS.items():
        if champ not in metadata:
            erreurs.append(f"❌ Metadata.{champ} manquant")
        elif not isinstance(metadata[champ], type_attendu):
            erreurs.append(f"❌ Metadata.{champ} type invalide (attendu {type_attendu.__name__})")
    
    return len(erreurs) == 0, erreurs


def valider_champs_centrale(data: Dict[str, Any]) -> Tuple[bool, List[str]]:
    """Valide champs centrale"""
    erreurs = []
    centrale = data.get('centrale', {})
    
    for champ, types_attendus in CHAMPS_CENTRALE_REQUIS.items():
        if champ not in centrale:
            erreurs.append(f"❌ Centrale.{champ} manquant")
        else:
            valeur = centrale[champ]
            if isinstance(types_attendus, tuple):
                # Types multiples acceptés
                if not isinstance(valeur, types_attendus):
                    types_str = ' ou '.join([t.__name__ for t in types_attendus])
                    erreurs.append(f"❌ Centrale.{champ} type invalide (attendu {types_str})")
            else:
                # Type unique
                if not isinstance(valeur, types_attendus):
                    erreurs.append(f"❌ Centrale.{champ} type invalide (attendu {types_attendus.__name__})")
    
    # Validation type centrale
    type_centrale = centrale.get('type', '')
    if type_centrale not in ['SOL', 'TOITURE']:
        erreurs.append(f"❌ Centrale.type invalide : '{type_centrale}' (attendu SOL ou TOITURE)")
    
    return len(erreurs) == 0, erreurs


def valider_champs_audit_cdc(data: Dict[str, Any]) -> Tuple[bool, List[str]]:
    """Valide 54 champs CDC obligatoires"""
    erreurs = []
    audit = data.get('audit', {})
    
    for champ, type_attendu in CHAMPS_AUDIT_REQUIS_CDC.items():
        if champ not in audit:
            erreurs.append(f"❌ Audit.{champ} manquant (CDC obligatoire)")
        elif not isinstance(audit[champ], type_attendu):
            erreurs.append(f"❌ Audit.{champ} type invalide (attendu {type_attendu.__name__})")
    
    return len(erreurs) == 0, erreurs


def valider_photos(data: Dict[str, Any]) -> Tuple[bool, List[str]]:
    """Valide photos (quotas + catégories)"""
    erreurs = []
    avertissements = []
    
    centrale = data.get('centrale', {})
    photos = data.get('photos', {})
    
    type_centrale = centrale.get('type', 'UNKNOWN')
    quota_minimum = QUOTAS_PHOTOS_MINIMUM.get(type_centrale, 40)
    
    # Vérifier catégories présentes
    categories_presentes = []
    categories_manquantes = []
    
    for categorie in CATEGORIES_PHOTOS_V4:
        if categorie in photos and len(photos[categorie]) > 0:
            categories_presentes.append(categorie)
        else:
            categories_manquantes.append(categorie)
    
    # Compter total photos
    nb_photos_total = sum(len(photos.get(cat, [])) for cat in CATEGORIES_PHOTOS_V4)
    
    # Validation catégories
    if len(categories_manquantes) > 0:
        erreurs.append(f"❌ Catégories photos manquantes : {', '.join(categories_manquantes)}")
    
    # Validation quota
    if nb_photos_total < quota_minimum:
        erreurs.append(f"❌ Quota photos insuffisant : {nb_photos_total}/{quota_minimum} (type {type_centrale})")
    
    # Vérifier Base64 valide (échantillon)
    nb_photos_invalides = 0
    for categorie in categories_presentes:
        for photo in photos[categorie][:3]:  # Test 3 premières photos par catégorie
            photo_data = photo.get('data', '')
            if not photo_data or len(photo_data) < 100:
                nb_photos_invalides += 1
    
    if nb_photos_invalides > 0:
        avertissements.append(f"⚠️  {nb_photos_invalides} photo(s) avec données Base64 suspectes")
    
    return len(erreurs) == 0, erreurs + avertissements


def valider_statistiques(data: Dict[str, Any]) -> Tuple[bool, List[str]]:
    """Valide statistiques calculées"""
    erreurs = []
    
    stats = data.get('statistiques', {})
    
    champs_stats_requis = [
        'nb_anomalies_critiques',
        'nb_anomalies_majeures',
        'nb_anomalies_mineures',
        'nb_points_conformes',
        'taux_conformite'
    ]
    
    for champ in champs_stats_requis:
        if champ not in stats:
            erreurs.append(f"❌ Statistiques.{champ} manquant")
    
    # Validation cohérence
    if 'taux_conformite' in stats:
        taux = stats['taux_conformite']
        if not (0 <= taux <= 100):
            erreurs.append(f"❌ Statistiques.taux_conformite invalide : {taux}% (attendu 0-100)")
    
    return len(erreurs) == 0, erreurs


def valider_json_v4_complet(json_path: Path) -> Dict[str, Any]:
    """
    Validation complète JSON V4
    
    Returns:
        Dictionnaire résultats validation avec clés :
        - 'valide': bool
        - 'centrale_id': str
        - 'centrale_nom': str
        - 'type': str
        - 'erreurs': list
        - 'avertissements': list
        - 'details': dict
    """
    
    # Charger JSON
    data = charger_json(json_path)
    
    if 'erreur' in data:
        return {
            'valide': False,
            'centrale_id': 'UNKNOWN',
            'centrale_nom': 'N/A',
            'type': 'N/A',
            'erreurs': [data['erreur']],
            'avertissements': [],
            'details': {}
        }
    
    # Extraire infos centrale
    centrale = data.get('centrale', {})
    centrale_id = centrale.get('id', 'UNKNOWN')
    centrale_nom = centrale.get('nom', 'N/A')
    type_centrale = centrale.get('type', 'N/A')
    
    # Lancer validations
    resultats = {}
    erreurs_globales = []
    avertissements_globales = []
    
    # 1. Version
    valide_version, err_version = valider_version(data)
    resultats['version'] = valide_version
    erreurs_globales.extend(err_version)
    
    # 2. Structure
    valide_structure, err_structure = valider_structure(data)
    resultats['structure'] = valide_structure
    erreurs_globales.extend(err_structure)
    
    # 3. Metadata
    valide_metadata, err_metadata = valider_champs_metadata(data)
    resultats['metadata'] = valide_metadata
    erreurs_globales.extend(err_metadata)
    
    # 4. Centrale
    valide_centrale, err_centrale = valider_champs_centrale(data)
    resultats['centrale'] = valide_centrale
    erreurs_globales.extend(err_centrale)
    
    # 5. Audit CDC 54 points
    valide_audit, err_audit = valider_champs_audit_cdc(data)
    resultats['audit_cdc'] = valide_audit
    erreurs_globales.extend(err_audit)
    
    # 6. Photos
    valide_photos, err_photos = valider_photos(data)
    resultats['photos'] = valide_photos
    # Séparer erreurs et avertissements photos
    for msg in err_photos:
        if msg.startswith('⚠️'):
            avertissements_globales.append(msg)
        else:
            erreurs_globales.append(msg)
    
    # 7. Statistiques
    valide_stats, err_stats = valider_statistiques(data)
    resultats['statistiques'] = valide_stats
    erreurs_globales.extend(err_stats)
    
    # Résultat global
    valide_global = all(resultats.values())
    
    return {
        'valide': valide_global,
        'centrale_id': centrale_id,
        'centrale_nom': centrale_nom,
        'type': type_centrale,
        'erreurs': erreurs_globales,
        'avertissements': avertissements_globales,
        'details': resultats
    }


# ====================================================================================================
# 🎯 TRAITEMENT BATCH
# ====================================================================================================

def afficher_resultat_validation(resultat: Dict[str, Any], index: int, total: int):
    """Affiche résultat validation formaté"""
    
    centrale_id = resultat['centrale_id']
    centrale_nom = resultat['centrale_nom']
    type_centrale = resultat['type']
    valide = resultat['valide']
    erreurs = resultat['erreurs']
    avertissements = resultat['avertissements']
    
    # En-tête
    statut = "✅ VALIDE" if valide else "❌ INVALIDE"
    print(f"\n[{index}/{total}] {statut} - {centrale_id} ({type_centrale})")
    print(f"   📍 {centrale_nom}")
    
    # Détails validations
    details = resultat['details']
    print(f"   📋 Validations :")
    print(f"      • Version     : {'✅' if details.get('version') else '❌'}")
    print(f"      • Structure   : {'✅' if details.get('structure') else '❌'}")
    print(f"      • Metadata    : {'✅' if details.get('metadata') else '❌'}")
    print(f"      • Centrale    : {'✅' if details.get('centrale') else '❌'}")
    print(f"      • Audit CDC   : {'✅' if details.get('audit_cdc') else '❌'}")
    print(f"      • Photos      : {'✅' if details.get('photos') else '❌'}")
    print(f"      • Statistiques: {'✅' if details.get('statistiques') else '❌'}")
    
    # Erreurs
    if erreurs:
        print(f"   ⚠️  Erreurs ({len(erreurs)}) :")
        for err in erreurs[:5]:  # Limiter affichage
            print(f"      {err}")
        if len(erreurs) > 5:
            print(f"      ... et {len(erreurs) - 5} autres erreurs")
    
    # Avertissements
    if avertissements:
        print(f"   ℹ️  Avertissements ({len(avertissements)}) :")
        for warn in avertissements[:3]:
            print(f"      {warn}")


def main():
    """Fonction principale - validation batch JSON V4"""
    
    print("="*80)
    print("✅ VALIDATEUR JSON V4 - GIRASOLE 2025")
    print("="*80)
    print()
    
    # Dossier JSON exports
    json_dir = Path(__file__).parent.parent / 'exports_json'
    
    if not json_dir.exists():
        print(f"❌ Dossier exports_json introuvable : {json_dir}")
        print(f"   Créez le dossier et placez-y vos fichiers JSON V4")
        return
    
    # Lister JSON
    json_files = sorted(json_dir.glob('*.json'))
    
    if not json_files:
        print(f"❌ Aucun fichier JSON trouvé dans : {json_dir}")
        return
    
    print(f"📂 Dossier source : {json_dir}")
    print(f"📄 Fichiers JSON : {len(json_files)}")
    print()
    
    # Traitement batch
    resultats_validation = []
    nb_valides = 0
    nb_invalides = 0
    
    for i, json_path in enumerate(json_files, 1):
        resultat = valider_json_v4_complet(json_path)
        resultats_validation.append(resultat)
        
        if resultat['valide']:
            nb_valides += 1
        else:
            nb_invalides += 1
        
        afficher_resultat_validation(resultat, i, len(json_files))
    
    # Statistiques finales
    print()
    print("="*80)
    print("📊 STATISTIQUES VALIDATION")
    print("="*80)
    print(f"   Total fichiers  : {len(json_files)}")
    print(f"   ✅ Valides      : {nb_valides}")
    print(f"   ❌ Invalides    : {nb_invalides}")
    print(f"   📈 Taux succès  : {round(nb_valides / len(json_files) * 100, 1)}%")
    print()
    
    # Recommandations
    if nb_invalides > 0:
        print("⚠️  RECOMMANDATIONS :")
        print("   • Corriger les erreurs détectées avant génération rapports")
        print("   • Vérifier conformité CDC 54 points (audit)")
        print("   • Contrôler quotas photos par type centrale")
        print()
    
    # Génération rapport validation (optionnel)
    rapport_path = json_dir.parent / 'rapport_validation_v4.json'
    try:
        with open(rapport_path, 'w', encoding='utf-8') as f:
            json.dump({
                'date_validation': datetime.now().isoformat(),
                'nb_fichiers': len(json_files),
                'nb_valides': nb_valides,
                'nb_invalides': nb_invalides,
                'resultats': resultats_validation
            }, f, ensure_ascii=False, indent=2)
        print(f"💾 Rapport validation sauvegardé : {rapport_path.name}")
    except Exception as e:
        print(f"⚠️  Erreur sauvegarde rapport : {e}")
    
    print()
    print("="*80)
    print("✅ Validation terminée !")
    print("="*80)


if __name__ == '__main__':
    main()
