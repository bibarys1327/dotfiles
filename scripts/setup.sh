#!/usr/bin/env bash
set -euo pipefail

if [ "$EUID" -eq 0 ]; then
  echo "❌ Do not run this script as root. Please run as normal user."
  exit 1
fi

echo "📦 Installing project dependencies..."

# Установка pnpm, если не установлен
if ! command -v pnpm &> /dev/null; then
  echo "🔧 Installing pnpm..."
  npm install -g pnpm
fi

# Установка зависимостей проекта
if [ -f package.json ]; then
  echo "📦 Installing Node.js dependencies..."
  pnpm install
fi

# Генерация Prisma клиент
if [ -f prisma/schema.prisma ]; then
  echo "🛠 Generating Prisma client..."
  npx prisma generate
fi

# Настройка pre-commit хуков
if [ -f .pre-commit-config.yaml ]; then
  echo "⚡ Installing pre-commit hooks..."
  pre-commit install
fi

echo "✅ Setup complete!"
