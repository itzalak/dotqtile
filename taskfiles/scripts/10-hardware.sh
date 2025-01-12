#!/bin/bash

set -uo pipefail

PKGS=(
  # AMD
  xf86-video-amdgpu
  mesa
  mesa-utils
  lib32-mesa
  libva-mesa-driver
  vulkan-radeon
  lib32-vulkan-radeon
  # Nvidia
  dkms
  nvidia-open-dkms
  nvidia-utils
  nvidia-settings
  lib32-nvidia-utils
  libva-nvidia-driver
)

echo "Installing packages"

for PKG in "${PKGS[@]}"; do
  echo "Installing package: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

# Monitor AMD GPU like nvidia-smi
# yay -S amdgpu_top
