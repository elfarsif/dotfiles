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

echo "Done!"
