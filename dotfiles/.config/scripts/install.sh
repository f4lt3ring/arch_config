#!/bin/bash

echo "==> Installing necessary packages..."

PKGS=(
  # 🧱 System and kernel
  base
  linux-headers
  sof-firmware
  grub
  cups
  unzip
  curl

  # 🌐 Network and sound
  bluez-utils
  nm-connection-editor
  pavucontrol
  pipewire
  pipewire-pulse
  wireplumber
  blueberry

  # Hyprland desktop
  hyprland
  hypridle
  hyprlock
  hyprpicker
  hyprpolkitagent
  hyprsunset
  waybar
  swaync
  nwg-look
  udiskie
  ly
  swww

  # 🎨 Themes
  adw-gtk-theme
  ttf-jetbrains-mono
  ttf-nerd-fonts-symbols
  python-pywal

  # 📁 File management and GUI
  nautilus
  decibels
  eog
  kooha
  obsidian

  # PrtSc
  grim
  slurp
  swappy
  wl-clipboard

  # 🌐 Internet and media
  firefox
  discord

  # Terminal and CLI
  kitty
  neovim
  nano
  htop
  rsync
  wget
  fd
  rofi-calc
  rofi-emoji
  lazygit

  # 🎮 Visual additions
  cava
  cmatrix
  lolcat
  sl
  asciiquarium

  # Development
  maven
  luarocks
)

AUR_PKGS=(
  # 🎨 Looks and visuals
  bibata-cursor-theme
  waypaper
  wlogout
  tofi

  # 📺 Media and XWayland
  xwaylandvideobridge

  # CLI games and tools
  cbonsai
  pipes.sh
  neofetch

  # Fonts
  ttf-jetbrains-mono-nerd 
  ttf-nerd-fonts-symbols
  ttf-nerd-fonts-symbols-mono


  # 💻 Development tools
  aseprite
  
  # 🧪 Python AUR modules
  python-imageio-ffmpeg
  python-screeninfo

  # AUR helpers
  yay
  yay-debug
)

# Install pacman packages
sudo pacman -S --needed "${PKGS[@]}"

# Install yay if necessary
if ! command -v yay &> /dev/null; then
  echo "==> Installing yay..."
  sudo pacman -S --needed git base-devel
  if [ -d "$HOME/yay" ]; then
    echo "==> Removing existing yay directory..."
    rm -rf "$HOME/yay"
  fi
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd ..
fi

# Install AUR packages
echo "==> Installing AUR packages..."
for pkg in "${AUR_PKGS[@]}"; do
  yay -S --needed "$pkg"
done
