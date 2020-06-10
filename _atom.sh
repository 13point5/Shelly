#!/bin/sh

# Load util functions
source utils.sh

print_title "Atom"

install_atom() {
  ATOM_DEB=$SOFTWARE_DIR/atom.deb

  if [ ! -f "$ATOM_DEB" ]; then
    wget https://atom.io/download/deb -O $ATOM_DEB
  fi

  sudo dpkg -i $ATOM_DEB
}

install_prog atom "Atom" install_atom
