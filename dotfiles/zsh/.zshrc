# --- Powerlevel10k instant prompt (оставляем наверху) ---
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Oh My Zsh setup ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# --- User configuration ---

# Preferred editor
export EDITOR="nvim"

# Custom PATH
export PATH="$HOME/.local/bin:$PATH"

# fzf (если установлен)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
alias ll="ls -la"
alias gs="git status"
alias gc="git commit"

# Docker shortcuts
alias dco="docker compose"
alias dps="docker ps"
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dcb="docker-compose build"
alias dcl="docker-compose logs -f"

# pnpm shortcuts
alias p="pnpm"
alias pd="pnpm dev"
alias pb="pnpm build"
alias pi="pnpm install"
alias pa="pnpm add"

# Функция вместо alias для v (открывает файл или папку)
v() {
  if [ -d "$1" ]; then
    nvim "$1"
  else
    nvim "$@"
  fi
}

# --- NVM ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# --- Powerlevel10k config ---
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
