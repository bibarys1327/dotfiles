FROM debian:12

RUN apt update && apt install -y \ 
  git curl wget build-essential \ 
  neovim tmux zsh fzf ripgrep \
  nodejs npm \
  python3 python3-pip \
  docker.io \
  && rm -rf /var/lib/apt/lists/*

  RUN npm install -g pnpm typescript ts-node 

  RUN useradd -ms /bin/zsh dev 
  USER dev 
  WORKDIR /home/dev  

  COPY --chown=dev:dev dotfiles/ /home/dev/.dotfiles/ 

  RUN ln -s ~/.dotfiles/nvim ~/.config/nvim && \ 
      ln -s ~/.dotfiles/tmux.conf  ~/.tmux.conf && \  
      ln -s ~/.dotfiles/zshrc ~/dotfiles/.zshrc  
CMD ["zsh"] 
