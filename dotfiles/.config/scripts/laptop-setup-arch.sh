#!/bin/bash

echo "==> Installing necessary laptop packages..."
sudo pacman -S --needed zsh ripgrep fd wget alacritty tmux networkmanager ffmpeg gst-libav

echo "==> Enabling NetworkManager..."
sudo systemctl enable --now NetworkManager

echo "==> Booting sound systems..."
systemctl --user enable --now pipewire pipewire-pulse wireplumber

echo "==> Pulling dotfiles..."
cd ~
git clone git@github.com:f4lt3ring/arch_config.git dotfiles

echo "==> Symlinking necessary .config folders..."
CONFIGS=(nvim hypr waybar kitty rofi scripts)

for cfg in "${CONFIGS[@]}"; do
  rm -rf ~/.config/$cfg
  ln -s ~/dotfiles/.config/$cfg ~/.config/$cfg
done

echo "==> System base is now complete!"
