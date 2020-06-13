#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
CURR_DIR="$ROOT_DIR/tools"
source "$ROOT_DIR/_utils.sh"

# Random utility tools
print_title "Installing utility tools"
sudo apt-get install curl rar xclip xz-utils p7zip-full figlet tree -y

# Git and Github
bash $CURR_DIR/_github.sh
