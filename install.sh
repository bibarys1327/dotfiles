#!/usr/bin/env bash
set -euo pipefail

INSTALL_LAZYGIT=true
USE_DOCKER_COMPOSE_FALLBACK=true
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/my-dev-env/dotfiles}"

echo ">>> Updating system..."
sudo apt update && sudo apt upgrade -y

echo ">>> Installing base packages..."
sudo apt install -y \
  git curl wget ncdu build-essential stow \
  zsh tmux neovim htop ripgrep fd-find fzf \
  ca-certificates gnupg lsb-release software-properties-common \
  unzip jq tree

# --- Oh My Zsh ---
echo ">>> Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo ">>> Installing Zsh plugins..."
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" || true

# --- Starship prompt ---
echo ">>> Installing Starship prompt..."
if ! command -v starship >/dev/null 2>&1; then
  curl -fsSL https://starship.rs/install.sh | sh -s -- -y
fi

# --- NVM + Node.js ---
echo ">>> Installing NVM..."
if [ ! -d "$HOME/.nvm" ]; then
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi

export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if ! command -v node >/dev/null 2>&1; then
  nvm install --lts
  nvm alias default 'lts/*'
fi
npm install -g pnpm

# --- JS/TS Dev Tools ---
echo ">>> Installing global npm tools..."
npm install -g typescript ts-node nodemon eslint prettier \
  @eslint/js eslint-config-prettier eslint-plugin-import \
  eslint-plugin-react eslint-plugin-react-hooks \
  eslint-plugin-jsx-a11y \
  prisma @prisma/client \
  vercel

# --- Python + pipx ---
echo ">>> Installing Python + pipx..."
sudo apt install -y python3 python3-pip pipx
pipx ensurepath

# --- Docker ---
echo ">>> Installing Docker..."
if ! command -v docker >/dev/null 2>&1; then
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo \
   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
   https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
  sudo usermod -aG docker $USER
fi

# --- Docker Compose fallback ---
if $USE_DOCKER_COMPOSE_FALLBACK; then
  if ! docker compose version >/dev/null 2>&1; then
    echo ">>> Installing Docker Compose standalone (fallback)..."
    DOCKER_COMPOSE_VERSION="$(
      curl -fsSL https://api.github.com/repos/docker/compose/releases/latest \
        | sed -n 's/.*"tag_name":[[:space:]]*"\(v\?[0-9][^"]*\)".*/\1/p' | head -n1
    )"
    sudo curl -fsSL \
      "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" \
      -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
  fi
fi

# --- Lazygit (optional) ---
if $INSTALL_LAZYGIT; then
  echo ">>> Installing lazygit..."
  if ! command -v lazygit >/dev/null 2>&1; then
    sudo add-apt-repository -y ppa:lazygit-team/release
    sudo apt update
    sudo apt install -y lazygit
  fi
fi

# --- Pre-commit hooks ---
echo ">>> Installing pre-commit..."
if ! command -v pre-commit >/dev/null 2>&1; then
  pipx install pre-commit
fi
pre-commit install || true

# --- Dotfiles ---
if [ -d "$DOTFILES_DIR" ]; then
  echo ">>> Linking dotfiles from: $DOTFILES_DIR"
  cd "$DOTFILES_DIR"
  stow -v zsh || true
  stow -v nvim || true
  stow -v tmux || true
  stow -v git || true
  stow -v starship || true
else
  echo ">>> No dotfiles dir at $DOTFILES_DIR - skipping stow"
fi

# --- Run custom scripts ---
if [ -f "$HOME/my-dev-env/scripts/setup.sh" ]; then
  echo ">>> Running extra setup script..."
  bash "$HOME/my-dev-env/scripts/setup.sh"
fi

echo ">>> All Done!"
echo "ℹ️ Log out (or run 'newgrp docker') to make the docker group work"
echo "ℹ️ Enable Zsh now: run 'exec zsh'"
echo "ℹ️ Docs available in: ./docs/USAGE.md"
