#!/bin/bash
set -e

echo "🚀 Running post-create setup..."

# Устанавливаем зависимости (если вдруг они не в кэше)
pnpm install

# Генерируем Prisma Client
pnpm prisma generate

# Инициализируем git если нужно
if [ ! -d .git ]; then
  git init
fi

echo "✅ Devcontainer setup complete!"
