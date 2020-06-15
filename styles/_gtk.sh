#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

# Set GTK theme
# Params
#   $1 -> Path of theme
install_gtk() {

  if [ ! -f "$1" ]; then
    echo "GTK theme source not found!"
    return 1
  fi

  THEME=$(get_basename "$1")

  if ! is_last_ok; then
    return 1
  fi

  THEME_BASE_DIR="$HOME/.themes"

  if [ ! -d "$THEME_BASE_DIR" ]; then
    mkdir -p "$THEME_BASE_DIR"
  fi

  if [ -d "$THEME_BASE_DIR/$THEME" ]; then
    echo "GTK theme already exists!"
    return 1
  fi

  decompress "$1" "$THEME_BASE_DIR"
  if ! is_last_ok; then
    echo "Could not install GTK theme!"
    return 1
  fi
  gsettings set org.gnome.desktop.interface gtk-theme "$THEME"
  gsettings set org.gnome.desktop.wm.preferences theme "$THEME"

}

log_title "Installing GTK theme"
install_gtk "$ROOT_DIR/resources/gtk-theme/Mojave-dark.tar.xz"
