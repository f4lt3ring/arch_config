#!/bin/bash

CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$HOME/dotfiles"

mkdir -p "$DOTFILES_DIR/.config"

echo "==> Copying .config into a repository..."

CONFIGS=(
  scripts
  nvim
  hypr
  waybar
  rofi
  tofi
  kitty
  obsidian
  yay
  gtk-3.0
  gtk-4.0
  autostart
  wal
  waypaper
  wlogout
)

for cfg in "${CONFIGS[@]}"; do
  src="$CONFIG_DIR/$cfg"
  dest="$DOTFILES_DIR/.config/$cfg"
  if [ -e "$src" ]; then
    echo "  -> $cfg"
    rsync -a --delete "$src/" "$dest/"
  else
    echo "  -> $cfg not found, skipping..."
  fi
done

cd "$DOTFILES_DIR"
git add .
git commit -m "Update .config backup on $(date '+%Y-%m-%d')"
