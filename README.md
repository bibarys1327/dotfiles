# 🚀 Dotfiles & Dev Environment

Мое универсальное окружение для Full Stack разработки на TypeScript, React, Next.js, Node.js и не только.

## Что внутри

- **Zsh** с Oh My Zsh и автодополнениями
- **Tmux** с умными плагинами (сохранение сессий, fzf, открытие ссылок)
- **Neovim** как полноценная IDE:
  - LSP (TypeScript, Tailwind CSS, ESLint, Emmet)
  - Автодополнение и сниппеты
  - Отладчик (vscode-js-debug)
  - Тестирование (Jest)
  - Git-интеграция (Neogit, Gitsigns)
- **SSH** с ключами и алиасами
- **Утилиты**: lazygit, bottom, eza, ripgrep, fzf

## Быстрый старт

1. Клонируй репозиторий:
   ```bash
   git clone https://github.com/bibarys1327/dotfiles.git ~/dotfiles
   cd ~/dotfiles

## Fast start
```bash
git clone https://github.com/bibarys1327/my-dev-env.git
cd my-dev-env
cp .env.example .env
make install
make up

