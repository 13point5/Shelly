#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

# Set wallpaper in Ubuntu gnome
# Params
#   $1 -> file location
set_wallpaper() {
  DESK_BG_NAME=$(basename -- "$1")
  DESK_BG_DIR="$HOME/Pictures/shelly-imgs/wallpapers"
  DESK_BG_PATH="$DESK_BG_DIR/$DESK_BG_NAME"

  if [ ! -d "$DESK_BG_DIR" ]; then
    mkdir -p $DESK_BG_DIR
  fi

  cp "$1" $DESK_BG_PATH

  FILE="'file://$(readlink -e "$DESK_BG_PATH")'"
  if [ "$FILE" != "'file://'" ]; then
    gsettings set org.gnome.desktop.background picture-uri "$FILE"
  else
    log_err "Wallpaper doesn't exist"
  fi
}

log_title "Setting wallpaper"
set_wallpaper "$ROOT_DIR/resources/images/wallpapers/sheldon.jpg"
