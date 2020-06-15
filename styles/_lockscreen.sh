#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

# Set wallpaper in Ubuntu gnome
# Params
#   $1 -> file location
set_wallpaper() {
  LOCK_BG_NAME=$(basename -- "$1")
  LOCK_BG_DIR="$HOME/Pictures/shelly-imgs/lockscreens"
  LOCK_BG_PATH="$LOCK_BG_DIR/$LOCK_BG_NAME"

  if [ ! -d "$LOCK_BG_DIR" ]; then
    mkdir -p $LOCK_BG_DIR
  fi

  cp "$1" $LOCK_BG_PATH

  FILE="'file://$(readlink -e "$LOCK_BG_PATH")'"
  if [ "$FILE" != "'file://'" ]; then
    gsettings set org.gnome.desktop.screensaver picture-uri "$FILE"
  else
    echo "Lockscreen doesn't exist"
    return 1
  fi
}

log_title "Setting lockscreen"
set_wallpaper "$ROOT_DIR/resources/images/wallpapers/sheldon.jpg"
