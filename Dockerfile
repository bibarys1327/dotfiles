FROM debian:12

# Устанавливаем зависимости
RUN apt update && apt install -y \
    git curl wget build-essential \
    neovim tmux zsh fzf ripgrep \
    python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем Node.js + pnpm + TypeScript
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt install -y nodejs && \
    npm install -g pnpm typescript ts-node && \
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

CMD ["zsh"]
