#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

# Set Cursor pack
# Params
#   $1 -> Path of cursor pack
install_cursors() {

  if [ ! -f "$1" ]; then
    log_err "Cursor pack not found!"
  fi

  CURSOR=$(get_basename "$1")

  if ! is_last_ok; then
    log_err "Couldn't identify cursor pack source"
  fi

  CURSOR_BASE_DIR="$HOME/.icons"

  if [ ! -d "$CURSOR_BASE_DIR" ]; then
    mkdir -p "$CURSOR_BASE_DIR"
  fi

  if [ -d "$CURSOR_BASE_DIR/$CURSOR" ]; then
    log_err "Cursor pack already exists! Aborting Installation"
  fi

  decompress "$1" "$CURSOR_BASE_DIR"
  if ! is_last_ok; then
    log_err "Could not install cursor pack!"
  fi

  gsettings set org.gnome.desktop.interface cursor-theme "$CURSOR"
}

log_title "Installing Cursor pack"
install_cursors "$ROOT_DIR/resources/cursor-pack/material_light_cursors.tar.gz"
