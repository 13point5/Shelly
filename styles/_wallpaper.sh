#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

# Set wallpaper in Ubuntu gnome
# Params
#   $1 -> file location
set_wallpaper() {
    FILE="'file://$(readlink -e "$1" )'"
    if [ "$FILE" != "'file://'" ]
    then
        gsettings set org.gnome.desktop.background picture-uri "$FILE"
    else
        echo "File doesn't exist"
    fi
}

print_title "Setting wallpaper"
set_wallpaper "$ROOT_DIR/images/wallpapers/dragon1.jpg"
