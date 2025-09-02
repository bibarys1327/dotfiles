FROM debian:12

# Устанавливаем зависимости
RUN apt update && apt install -y \
    git curl wget build-essential \
    neovim tmux zsh fzf ripgrep \
    python3 python3-pip \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем Node.js + pnpm + TypeScript
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt install -y nodejs && \
    npm install -g pnpm typescript ts-node prisma && \
    rm -rf /var/lib/apt/lists/*

# Создаём пользователя dev
RUN useradd -ms /bin/zsh dev
USER dev
WORKDIR /home/dev

# Копируем dotfiles
COPY --chown=dev:dev dotfiles/ /home/dev/.dotfiles/

# Настраиваем symlink-и
RUN mkdir -p /home/dev/.config/nvim && \
    ln -s /home/dev/.dotfiles/nvim/init.lua /home/dev/.config/nvim/init.lua && \
    ln -s /home/dev/.dotfiles/tmux/.tmux.conf /home/dev/.tmux.conf && \
    ln -s /home/dev/.dotfiles/zsh/.zshrc /home/dev/.zshrc

# Устанавливаем глобальные тулзы для Fullstack
RUN pnpm add -g next eslint @types/node @typescript-eslint/parser @typescript-eslint/eslint-plugin \
    && pnpm add -g prisma @prisma/client \
    && pnpm add -g nodemon

# Создаём папку под проект
WORKDIR /home/dev/app

# Копируем package.json и lock-файлы заранее (для кэша зависимостей)
COPY --chown=dev:dev package.json pnpm-lock.yaml* ./

# Устанавливаем зависимости проекта
RUN pnpm install

# Копируем исходники проекта
COPY --chown=dev:dev . .

# Генерируем Prisma Client
RUN pnpm prisma generate

# Открываем порт для Next.js
EXPOSE 3000

# По умолчанию запускаем dev-сервер
CMD ["pnpm", "dev"]

COPY --chown=dev:dev scripts/ /home/dev/scripts/
COPY --chown=dev:dev docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
