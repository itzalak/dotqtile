#!/bin/bash

set -uo pipefail

PKGS=(
  calibre
  obsidian
  vivaldi
  spotify-launcher
  ticktick
)

echo "Installing packages"

for PKG in "${PKGS[@]}"; do
  echo "Installing package: $PKG"
  yay -S "$PKG" --noconfirm --needed
done
