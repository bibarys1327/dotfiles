eval "$(starship init zsh)"

# --- Oh My Zsh setup ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker
  docker-compose
)

source $ZSH/oh-my-zsh.sh

# --- User configuration ---

# Safe sourcing function
source_if_exists() {
  [[ -f "$1" ]] && source "$1"
}

# Preferred editor
export EDITOR="nvim"

# Custom PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# fzf
source_if_exists ~/.fzf.zsh

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt share_history
setopt hist_ignore_all_dups

# Completion
autoload -U compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

# --- Aliases ---

# System
alias ll="ls -la"
alias c="clear"
alias h="history"
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"

# Git
alias gs="git status"
alias gc="git commit"
alias gd="git diff"
alias gco="git checkout"
alias gp="git push"
alias gl="git pull"
alias ga="git add"
alias gaa="git add --all"
alias gcm="git commit -m"
alias gpl="git pull"
alias gps="git push"
alias gst="git stash"
alias gsp="git stash pop"

<<<<<<< HEAD
# Docker shortcuts
alias dco="docker compose"
alias dps="docker ps"
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dcb="docker-compose build"
alias dcl="docker-compose logs -f"
=======
# --- Modern Docker Compose Aliases ---
alias dco='docker compose'  # Base command for any operations
alias dcb='docker compose build'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcl='docker compose logs -f'
alias dcp='docker compose ps'
alias dce='docker compose exec'
alias dcr='docker compose run --rm'
alias dcssh='docker compose stop'
alias dcrestart='docker compose restart'
alias dct='docker compose top'
alias dci='docker compose images'
alias dcpull='docker compose pull'
alias dcconfig='docker compose config'
alias dcrecreate='docker compose up -d --force-recreate'
>>>>>>> refs/remotes/origin/main

# Docker general aliases
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dimg='docker images'
alias dvol='docker volume ls'
alias dnet='docker network ls'
alias dlog='docker logs'
alias dstop='docker stop'
alias dstart='docker start'
alias drm='docker rm'
alias drmi='docker rmi'

# pnpm
alias p="pnpm"
alias pd="pnpm dev"
alias pb="pnpm build"
alias pi="pnpm install"
alias pa="pnpm add"
alias pr="pnpm run"
alias pui="pnpm upgrade-interactive"
alias ptest="pnpm test"
alias plint="pnpm lint"

# Safe operations
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# --- Enhanced Functions ---

# Smart nvim opener with file creation
v() {
  if [[ $# -eq 0 ]]; then
    nvim .
  else
    for arg in "$@"; do
      if [[ -d "$arg" ]]; then
        nvim "$arg"
      else
        if [[ ! -f "$arg" ]]; then
          mkdir -p "$(dirname "$arg")" 2>/dev/null
          touch "$arg"
        fi
        nvim "$arg"
      fi
    done
  fi
}

# Docker Compose functions for specific services
function dcup() {
    docker compose up -d "$@"
}

function dcex() {
    local service=$1
    shift
    docker compose exec "$service" "$@"
}

function dclog() {
    docker compose logs -f "$@"
}

function dcreset() {
    docker compose down -v --remove-orphans
    docker compose up -d --build
}

function dcrebuild() {
    docker compose down
    docker compose build --no-cache
    docker compose up -d
}

# Quick directory listing after cd
function cd() {
  builtin cd "$@" && ll
}

# Create directory and cd into it
function mkcd() {
  mkdir -p "$1" && cd "$1"
}

# --- NVM ---
export NVM_DIR="$HOME/.nvm"
source_if_exists "$NVM_DIR/nvm.sh"
source_if_exists "$NVM_DIR/bash_completion"

# --- Powerlevel10k config ---
source_if_exists ~/.p10k.zsh

# --- Platform-specific settings ---
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias ls="ls -G"
  # Homebrew
  export PATH="/opt/homebrew/bin:$PATH"
else
  alias ls="ls --color=auto"
fi

# --- Environment variables ---
export BAT_THEME="TwoDark"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

# --- Final cleanup ---
unset -f source_if_exists
