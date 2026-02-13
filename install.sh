#!/bin/bash
DOTFILES="$(cd "$(dirname "$0")" && pwd)"

mkdir -p ~/.config

# Neovim
ln -sfn "$DOTFILES/nvim" ~/.config/nvim
echo "Linked nvim -> ~/.config/nvim"

# Tmux
ln -sf "$DOTFILES/tmux.conf" ~/.tmux.conf
echo "Linked tmux.conf -> ~/.tmux.conf"

echo "Done!"
