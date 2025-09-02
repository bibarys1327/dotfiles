#!/usr/bin/env bash
set -euo pipefail

echo "🚀 Starting container..."

# Ждём пока база будет доступна
echo "⏳ Waiting for database..."
until nc -z db 5432; do
  sleep 1
done

echo "✅ Database is up!"

# Прогоняем миграции
echo "📦 Running Prisma migrations..."
pnpm prisma migrate deploy

# Наполняем базу данными
echo "🌱 Seeding database..."
pnpm prisma db seed || echo "⚠️  Seed skipped (maybe already seeded)"

# Запускаем Next.js
echo "▶️ Starting Next.js dev server..."
exec pnpm dev
