#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

install_atom() {
  ATOM_DEB="$SOFTWARE_DIR/atom.deb"

  if [ ! -f "$ATOM_DEB" ]; then
    wget https://atom.io/download/deb -O $ATOM_DEB
  fi

  sudo dpkg -i $ATOM_DEB
}

install_prog atom "Atom" install_atom

# Atom packages
# Params
#   $1 -> Package ID
install_atom_pkg() {
  apm install $1
}

ATOM_PKGS=(
  dracula-syntax
  file-icons
)

print_title "Installing Atom packages"
for ext in "${ATOM_PKGS[@]}"; do
  install_atom_pkg $ext
done
