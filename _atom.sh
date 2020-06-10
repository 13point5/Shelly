#!/bin/sh

# Load util functions
source _utils.sh

print_title "Atom"

install_atom() {
  ATOM_DEB=$SOFTWARE_DIR/atom.deb

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
for ext in "${ATOM_PKGS[@]}"
do
  install_atom_pkg $ext
done
