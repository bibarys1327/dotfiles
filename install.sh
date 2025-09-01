!/bin/bash
set -e 

echo ">>>Updating system..."
sudo apt update && sudo apt upgrade -y

echo ">>>Installing base packages..."
sudo apt install -y \
  git curl wget ncdu build-essential stow \
  zsh tmux neovim htop ripgrep fd-find fzf \
  ca-certificates gnupg lsb-release 

echo ">>>Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo ">>>Installing Zsh plugins..."
ZSH_CUSTOM=${ZSH_CUSTOM: -$HOME/.oh-my-zsh/custom}
git clone  https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting || true 
echo ">>> Installing NVM"
if [ !  -d "$HOME/.nvm"]; then
  curl -o- 
https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh / bash 
fi 

export  NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ]  && \. "$NVM_DIR/nvm.sh" 
nvm install --lts 
nvm alias default 'lts/*'
npm install -g pnpm 

echo ">>> Installing Docker..."
if ! command -v  docker &>/dev/null; then
  sudo mkdir -m 0755 -p /etc/apt/keyrings 
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg 
  echo \
   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
   https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | 
   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 
  sudo apt update 
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin 
  sudo usermod -aG docker $USER 
fi 

echo "Linking configs from dotfiles..."
cd ~/dotfiles 
stow zsh 
stow nvim 
stow tmux 
stow git 

echo "Ready"
echo "Restart terminal or enter 'exec zsh' to turn on Zsh" 


echo ">>> Installing Docker Compose..."
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/release/latest | grep tag_name | cut -d '"' -f 4)
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" \ -o /usr/local/bin/docker-compose 
sudo chmod +x /usr/local/bin/docker-compose  


### FRONTEND ( NEXT.JS / REACT ) 

pnpm create next-app myapp 
cd myapp 
pnpm dev 

### BACKEND ( NESTJS / EXPRESS ) 
pnpm add -g @nestjs/cli 
nest  new backend 
pnpm run start:dev  

### CLI-instruments
sudo add-apt-repository ppa:lazygit-team/release -y 
sudo apt udpate
sudo apt install lazygit -y 

echo "Installing packages"
sudo apt update && sudo apt install -y \
  git curl wget build-essential \ 
  neovim tmux zsh fzf ripgrep \ 
  nodejs npm docker.io 

echo "Copying dotfiles" 
sudo npm install -g pnpm typescript ts-node 

echo "Cloning dotfiles" 
if [ ! -d "$HOME/.dotfiles" ]; then 
    git clone https://github.com/username/dotfiles ~/.dotfiles 
fi 

echo "Create hrefs" 
mkdir -p ~/.config 
ln -sf ~/.dotfiles/nvim ~/.config/nvim 
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf 
ln -sf ~/.dotfiles/zshrc ~/.zshrc  

sudo apt install -y git 
git clone git@github.com:bibarys1327/dotfiles.git ~/dotfiles 
cd ~/dotfiles 
chmod +x install.sh 
./install.sh 

curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
source ~/.zshrc
nvm install --lts
nvm alias default lts/*
node -v
npm -v 
nvm list


