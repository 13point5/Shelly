#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
CURR_DIR="$ROOT_DIR/styles"
source "$ROOT_DIR/_utils.sh"

# Backup current gdm theme and apply new theme
# Params
#   $1 -> Path to new theme
install_gdm_theme() {
  print_title "Backing up old gdm theme"
  old_gdm_path="/usr/share/gnome-shell/theme"
  backup_gdm_path="/usr/share/gnome-shell/theme-$(date)"
  sudo cp -r $old_gdm_path $backup_gdm_path

  print_title "Setting new gdm theme"
  new_gdm_path=$1
  sudo rm -rf $old_gdm_path
  sudo cp -r $new_gdm_path $old_gdm_path
}

install_gdm_theme "$CURR_DIR/theme/gdm/theme"
