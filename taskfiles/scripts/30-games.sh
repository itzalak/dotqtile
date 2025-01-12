#!/bin/bash

set -uo pipefail

PKGS=(
  steam
  minecraft-launcher
)

echo "Installing packages"

for PKG in "${PKGS[@]}"; do
  echo "Installing package: $PKG"
  yay -S "$PKG" --noconfirm --needed
done
