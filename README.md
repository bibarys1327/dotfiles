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

Запусти автоматическую установку:

chmod +x scripts/setup.sh
./scripts/setup.sh

🚀🚀🚀Как это работает

· scripts/setup.sh — идемпотентный скрипт, который можно запускать повторно. Он устанавливает системные пакеты, копирует конфиги, клонирует необходимые репозитории.
· dotfiles/ — конфигурационные файлы, которые применяются с помощью stow.
· SSH — после установки сгенерируй ключ (ssh-keygen -t ed25519) и добавь его на сервер (ssh-copy-id). В dotfiles/.ssh/config уже есть пример алиаса myserver.
· Neovim настроен на автоматическое обновление плагинов. Для ручного обновления нажми <leader>L и выбери sync.

Горячие клавиши (основные)

Tmux

· Ctrl+a — префикс (вместо Ctrl+b)
· префикс + I — установить плагины
· префикс + f — меню fzf (сессии, окна)
· Alt + стрелки — переключение панелей

Neovim

· <leader>ff — поиск файлов
· <leader>fg — поиск по тексту
· <leader>fb — список буферов
· <leader>gg — Git (Neogit)
· <leader>hp — показать изменения в блоке (hunk)
· <leader>hb — blame строки
· <leader>xx — список ошибок (Trouble)
· gd — перейти к определению
· K — показать документацию

Обновление

Когда ты меняешь конфиги на сервере:

```bash
cd ~/dotfiles
git add -A
git commit -m "обновил настройки"
git push
```

На новом сервере просто git pull и запусти scripts/setup.sh снова (или только скопируй нужные файлы вручную).
