#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
CURR_DIR="$ROOT_DIR/styles"
source "$ROOT_DIR/_utils.sh"

# Get functions for styling
source "$CURR_DIR/_wallpaper.sh"

# Set wallpaper
set_wallpaper "$ROOT_DIR/images/wallpapers/dragon1.jpg"

# GNOME Shell stuff
install_apt gnome-tweak-tools "GNOME Tweak tools"
install_apt gnome-shell-extensions "GNOME shell extensions tool"

# Install extensions
print_title "Installing GNOME Shell extensions"
source "$CURR_DIR/_extensions.sh"
install_extensions "$CURR_DIR/shell-extensions"
