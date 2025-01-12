#!/bin/bash

set -uo pipefail

PKGS=(
  xfce4
  lxappearance
)

echo "Installing packages"

for PKG in "${PKGS[@]}"; do
  echo "Installing package: $PKG"
  yay -S "$PKG" --noconfirm --needed
done
