#!/bin/sh

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
