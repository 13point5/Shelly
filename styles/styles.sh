#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
CURR_DIR="$ROOT_DIR/styles"
source "$ROOT_DIR/_utils.sh"

# GNOME Shell stuff
install_apt dconf-editor "dconf Editor"
install_apt gnome-tweaks "GNOME Tweak tools"
install_apt gnome-shell-extensions "GNOME shell extensions tool"

# Install extensions
bash "$CURR_DIR/_extension.sh"

# Shell theme
bash "$CURR_DIR/_shell.sh"

# Add GTK theme
bash "$CURR_DIR/_gtk.sh"

# Add Icon pack
bash "$CURR_DIR/_icon.sh"

# Cursor pack
bash "$CURR_DIR/_cursor.sh"

# Set wallpaper
bash "$CURR_DIR/_wallpaper.sh"

# Set lockscreen
bash "$CURR_DIR/_lockscreen.sh"

# Gnome settings
bash "$CURR_DIR/_gnome.sh"
