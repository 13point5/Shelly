#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
CURR_DIR="$ROOT_DIR/styles"
source "$ROOT_DIR/_utils.sh"

# Install downloaded GNOME shell extensions
# Params
#   $1 -> Directory where extensions are stored
install_extensions() {
  EXTENSIONS="$1/*.zip"

  for EXT in $EXTENSIONS ; do
    EXT_UUID=$(unzip -c "$EXT" metadata.json | grep uuid | cut -d \" -f4)
    EXT_PATH="$HOME/.local/share/gnome-shell/extensions/$EXT_UUID"

    if [ ! -d "$EXT_PATH" ] ; then
      mkdir -p $EXT_PATH
      unzip -q $EXT -d $EXT_PATH
      gnome-shell-extension-tool -e "$EXT_UUID"
    else
      echo "$EXT_UUID is already installed! Enable manually if needed"
    fi
  done
}

print_title "Installing GNOME Shell extensions"
install_apt gnome-shell-extension-user-theme "GNOME Shell user-theme extension"
install_extensions "$ROOT_DIR/resources/shell-extensions"
