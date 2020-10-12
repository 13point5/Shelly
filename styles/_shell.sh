#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

# Set Shell theme
# Params
#   $1 -> Path of theme
install_shell_theme() {

  if [ ! -f "$1" ]; then
    log_err "Shell theme source not found!"
  fi

  THEME=$(get_basename "$1")

  if ! is_last_ok; then
    log_err "Could not identify Shell theme source"
  fi

  THEME_BASE_DIR="$HOME/.themes"

  if [ ! -d "$THEME_BASE_DIR" ]; then
    mkdir -p "$THEME_BASE_DIR"
  fi

  if [ -d "$THEME_BASE_DIR/$THEME" ]; then
    log_err "Shell theme already exists! Aborting Installation"
  fi

  decompress "$1" "$THEME_BASE_DIR"
  if ! is_last_ok; then
    log_err "Could not install shell theme!"
  fi

  gsettings set org.gnome.shell.extensions.user-theme name "$THEME"

}

log_title "Installing Shell theme"
install_shell_theme "$ROOT_DIR/resources/styling/shell-theme/XO_Catalina_NightGR.tar.xz"
