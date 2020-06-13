#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

# Set wallpaper in Ubuntu gnome
# Params
#   $1 -> file location
set_wallpaper() {
  WALLP_NAME=$(basename -- "$1")
  WALLP_DIR="$HOME/Pictures/shelly-wallpapers"
  WALLP_PATH="$WALLP_DIR/$WALLP_NAME"

  if [ ! -d "$WALLP_DIR" ] ; then
    mkdir -p $WALLP_DIR
  fi

  cp "$1" $WALLP_PATH

  FILE="'file://$(readlink -e "$WALLP_PATH" )'"
  if [ "$FILE" != "'file://'" ] ; then
    gsettings set org.gnome.desktop.background picture-uri "$FILE"
  else
    echo "Wallpaper doesn't exist"
    return 1
  fi
}

print_title "Setting wallpaper"
set_wallpaper "$ROOT_DIR/resources/images/wallpapers/sheldon.jpg"
