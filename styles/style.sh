#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
CURR_DIR="$ROOT_DIR/styles"
source "$ROOT_DIR/_utils.sh"

# Set wallpaper
bash "$CURR_DIR/_wallpaper.sh"

# GNOME Shell stuff
install_apt gnome-tweak-tools "GNOME Tweak tools"
install_apt gnome-shell-extensions "GNOME shell extensions tool"

# Install extensions
bash "$CURR_DIR/_extensions.sh"
