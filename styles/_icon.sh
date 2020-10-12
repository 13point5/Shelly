#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

# Set Icon pack
# Params
#   $1 -> Path of icon pack
install_icons() {

  if [ ! -f "$1" ]; then
    log_err "Icon pack not found!"
  fi

  ICON=$(get_basename "$1")

  if ! is_last_ok; then
    log_err "Could not identify Icon pack source"
  fi

  ICON_BASE_DIR="$HOME/.icons"

  if [ ! -d "$ICON_BASE_DIR" ]; then
    mkdir -p "$ICON_BASE_DIR"
  fi

  if [ -d "$ICON_BASE_DIR/$ICON" ]; then
    log_err "Icon pack already exists! Aborting Installation"
  fi

  decompress "$1" "$ICON_BASE_DIR"
  if ! is_last_ok; then
    log_err "Could not install icon pack!"
  fi
  
  gsettings set org.gnome.desktop.interface icon-theme "$ICON"
}

log_title "Installing Icon pack"
install_icons "$ROOT_DIR/resources/styling/icon-pack/Papirus.tar.xz"
