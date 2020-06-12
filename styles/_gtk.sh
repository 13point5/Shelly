#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
CURR_DIR="$ROOT_DIR/styles"
source "$ROOT_DIR/_utils.sh"

# Set GTK theme
# Params
#   $1 -> Path of theme
install_gtk() {

  if [ ! -f $1 ] ; then
    echo "Theme source not found!"
    return 1
  fi

  if [[ $1 != *.zip ]] ; then
    echo "Only zip files supported!"
    return 1
  fi

  THEME="$(basename $1 .zip)"
  THEME_BASE_DIR="$HOME/.themes"
  THEME_DIR="$THEME_BASE_DIR/$THEME"

  if [ ! -d $THEME_BASE_DIR ] ; then
    mkdir -p $THEME_BASE_DIR
  fi

  if [ -d $THEME_DIR ] ; then
    echo "Theme already exists!"
    return 1
  fi

  unzip -q $1 -d $THEME_BASE_DIR
  gsettings set org.gnome.desktop.interface gtk-theme "$THEME"
  gsettings set org.gnome.desktop.wm.preferences theme "$THEME"
}

print_title "Installing GTK theme"
install_gtk "$CURR_DIR/theme/gtk/Yaru-Blue-dark.zip"
