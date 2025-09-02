#!/usr/bin/env bash
set -e

if [ "$EUID" -ne 0 ]; then
  echo "❌ Please run as root (use sudo)"
  exit 1
fi

echo "📦 Installing dependencies..."
apt-get update -qq && apt-get install -y \
  curl git zsh tmux neovim starship

echo "✅ Setup complete!"
