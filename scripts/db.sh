#!/usr/bin/env bash
set -euo pipefail

case "$1" in
  migrate)
    echo ">>> Running Prisma migrations..."
    npx prisma migrate dev
    ;;
  studio)
    echo ">>> Starting Prisma Studio..."
    npx prisma studio
    ;;
  reset)
    echo ">>> Resetting database..."
    npx prisma migrate reset
    ;;
  *)
    echo "Usage: $0 {migrate|studio|reset}"
    ;;
esac
