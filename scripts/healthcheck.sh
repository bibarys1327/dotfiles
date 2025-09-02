#!/usr/bin/env bash
set -e

containers=$(docker ps -q)

if [ -z "$containers" ]; then
  echo "⚠️  No running containers found."
  exit 0
fi

echo "🔍 Checking Docker status..."
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo "🔍 Checking containers health..."
for c in $containers; do
  name=$(docker inspect --format='{{.Name}}' "$c" | sed 's/^\/\?//')
  health=$(docker inspect --format='{{.State.Health.Status}}' "$c" 2>/dev/null || echo "no-healthcheck")
  echo "📦 $name: $health"
done
