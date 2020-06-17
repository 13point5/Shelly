#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

# VS Code
install_sublime() {
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  sudo apt-get install apt-transport-https -y
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt-get update -y
  sudo apt-get install sublime-text -y
}

install_prog subl "Sublime text" install_sublime
