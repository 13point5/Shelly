#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

# Get functions for styling
source "$ROOT_DIR/styles/_wallpaper.sh"

# Set wallpaper
set_wallpaper "$ROOT_DIR/images/wallpapers/dragon1.jpg"
