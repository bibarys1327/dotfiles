#!/usr/bin/env bash
set -euo pipefail

containers=$(docker ps -q)

if [ -z "$containers" ]; then
  echo "⚠️  No running containers found."
  exit 0
fi

echo "🔍 Checking Docker status..."
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo ""
echo "🔍 Checking containers health..."
for c in $containers; do
  name=$(docker inspect --format='{{.Name}}' "$c" | sed 's/^\/\?//')
  health=$(docker inspect --format='{{.State.Health.Status}}' "$c" 2>/dev/null || echo "no-healthcheck")
  echo "📦 $name: $health"
done

echo ""
echo "🔍 Checking PostgreSQL connection..."
if docker exec -it db pg_isready -U postgres >/dev/null 2>&1; then
  echo "✅ PostgreSQL is ready"
else
  echo "❌ PostgreSQL is not responding"
fi

echo ""
echo "🔍 Checking Next.js server..."
if curl -fs http://localhost:3000 >/dev/null 2>&1; then
  echo "✅ Next.js is running at http://localhost:3000"
else
  echo "❌ Next.js is not responding"
fi
