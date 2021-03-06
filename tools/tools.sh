#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
CURR_DIR="$ROOT_DIR/tools"
source "$ROOT_DIR/_utils.sh"

# Random utility tools
log_title "Installing and removing random stuff"
sudo apt-get install curl rar xclip xz-utils figlet tree dconf-cli uuid-runtime -y
sudo apt-get purge apport -y

# Bash aliases
bash "$CURR_DIR/_aliases.sh"

# Git and Github
bash "$CURR_DIR/_github.sh"

# nvm, node and yarn
bash "$CURR_DIR/_nodejs.sh"
