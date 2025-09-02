#!/usr/bin/env bash
set -euo pipefail

CMD="${1:-}"

case "$CMD" in
  migrate)
    echo ">>> Running Prisma migrations..."
    npx prisma migrate dev --name init
    ;;
  studio)
    echo ">>> Starting Prisma Studio..."
    npx prisma studio
    ;;
  reset)
    echo ">>> Resetting database (all data will be lost)..."
    npx prisma migrate reset --force
    ;;
  push)
    echo ">>> Pushing schema to database (no migrations)..."
    npx prisma db push
    ;;
  seed)
    echo ">>> Running Prisma seed..."
    npx prisma db seed
    ;;
  *)
    echo "Usage: $0 {migrate|studio|reset|push|seed}"
    ;;
esac
