#!/bin/bash
# Script pour créer les 52 missions en 6 appels (6 x 10 missions)

BASE_URL="https://63d55586.girasole-diagpv.pages.dev"

echo "🚀 Création des 52 missions GIRASOLE avec checklists adaptées..."
echo ""

for offset in 10 20 30 40 50; do
  echo "📦 Batch offset=$offset..."
  curl -s -X POST "${BASE_URL}/api/missions/create-52?offset=$offset" -H "Content-Type: application/json" | jq .
  echo ""
  sleep 2
done

echo "✅ Toutes les missions créées ! Vérification..."
curl -s "${BASE_URL}/api/planning/missions-count" | jq .
