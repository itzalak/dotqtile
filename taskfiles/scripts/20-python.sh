#!/bin/bash

set -uo pipefail

PYTHON_PKGS=(
  python
  pyenv
  python-pip
  python-pipx
)

echo "Installing required python packages"

for PKG in "${PYTHON_PKGS[@]}"; do
  echo "Installing package: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

echo "Installation of python packages completed successfully."
