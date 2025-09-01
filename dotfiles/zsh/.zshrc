# --- Powerlevel10k instant prompt (оставляем наверху) ---
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Oh My Zsh setup ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)

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
alias v="nvim"

# --- NVM ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# --- Powerlevel10k config ---
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
