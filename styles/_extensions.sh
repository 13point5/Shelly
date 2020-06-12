
# Install downloaded GNOME shell extensions
# Params
#   $1 -> Directory where extensions are stored
install_extensions() {
  extensions="$1/*.zip"

  for ext in $extensions
  do
    ext_uuid=$(unzip -c "$ext" metadata.json | grep uuid | cut -d \" -f4)
    ext_path="$HOME/.local/share/gnome-shell/extensions/$ext_uuid"

    if [ ! -d "$ext_path" ] ; then
      mkdir -p $ext_path
      unzip -q $ext -d $ext_path
      gnome-shell-extension-tool -e "$ext_uuid"
    else
      echo "$ext_uuid is already installed! Enable manually if needed"
    fi
  done

  # Restart your Display Manager, mine is gdm
  sudo systemctl restart gdm
}
