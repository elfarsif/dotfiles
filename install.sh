#!/bin/bash
DOTFILES="$(cd "$(dirname "$0")" && pwd)"

mkdir -p ~/.config

# Neovim
ln -sfn "$DOTFILES/nvim" ~/.config/nvim
echo "Linked nvim -> ~/.config/nvim"

# Tmux
ln -sf "$DOTFILES/tmux.conf" ~/.tmux.conf
echo "Linked tmux.conf -> ~/.tmux.conf"

# Alacritty
mkdir -p ~/.config/alacritty
ln -sf "$DOTFILES/alacritty.toml" ~/.config/alacritty/alacritty.toml
echo "Linked alacritty.toml -> ~/.config/alacritty/alacritty.toml"

# Zsh
ln -sf "$DOTFILES/zshrc" ~/.zshrc
echo "Linked zshrc -> ~/.zshrc"

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh already installed"
fi

# Zsh plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "zsh-autosuggestions already installed"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "zsh-syntax-highlighting already installed"
fi

echo "Done!"
