#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

# Set Icon pack
# Params
#   $1 -> Path of icon pack
install_icons() {

  if [ ! -f $1 ] ; then
    echo "Icon pack not found!"
    return 1
  fi

  ICON=$(get_basename $1)

  if ! is_last_ok ; then
    return 1
  fi

  ICON_BASE_DIR="$HOME/.icons"

  if [ ! -d "$ICON_BASE_DIR" ] ; then
    mkdir -p "$ICON_BASE_DIR"
  fi

  if [ -d "$ICON_BASE_DIR/$ICON" ] ; then
    echo "Icon pack already exists!"
    return 1
  fi

  decompress "$1" "$ICON_BASE_DIR"
  if ! is_last_ok ; then
    echo "Could not install icon pack!"
    return 1
  fi
  gsettings set org.gnome.desktop.interface icon-theme "$ICON"
}

print_title "Installing Icon pack"
install_icons "$ROOT_DIR/resources/icon/Papirus.tar.xz"
