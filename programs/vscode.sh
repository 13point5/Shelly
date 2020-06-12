#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

# VS Code
install_vscode() {
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
  sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
  sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
  sudo apt-get install apt-transport-https -y
  sudo apt-get update -y
  sudo apt-get install code -y
}

install_prog code "VS Code" install_vscode

# VS Code extensions
# Params
#   $1 -> Extension ID
install_vscode_ext() {
  code --install-extension $1
}

VSCODE_EXTS=(
  dbaeumer.vscode-eslint
  ms-python.python
  vscodevim.vim
  dracula-theme.theme-dracula
  esbenp.prettier-vscode
  coenraads.bracket-pair-colorizer
  formulahendry.auto-rename-tag
  xabikos.javascriptsnippets
)

print_title "Installing VS Code Extensions"
for ext in "${VSCODE_EXTS[@]}" ; do
  install_vscode_ext $ext
done
