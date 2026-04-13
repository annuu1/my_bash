#!/bin/bash

echo "🚀 Setting up Zsh environment..."

# Install dependencies
sudo apt update
sudo apt install -y zsh git curl wget

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Download Meslo Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

fc-cache -fv

echo "✅ Setup complete!"
echo "👉 Now run: chsh -s \$(which zsh)"
echo "👉 Then restart terminal and run: p10k configure"
