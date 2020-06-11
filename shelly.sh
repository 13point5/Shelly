#!/bin/sh

# Making all scripts executable
find ./ -name "*.sh" -exec chmod u+rx {} \;

# Load util functions
source _utils.sh

# Softwares dir
SOFTWARE_DIR=~/Softwares

if [ -d "$SOFTWARE_DIR" ]; then
  print_title "Software directory already exists!"
else
  print_title "Making directory to store softwares at $SOFTWARE_DIR"
  mkdir -p $SOFTWARE_DIR
fi

# Update and Upgrade
print_title "Updating and Upgrading"
sudo apt-get update -y
sudo apt-get upgrade -y

# Utils
print_title "Installing utils"
sudo apt-get install curl xclip figlet tree -y

# Script dirs
PROG_DIR=./programs
TOOL_DIR=./tools
STYLE_DIR=./styles

# Styling
bash $STYLE_DIR/style.sh 

# Git and Github
bash $TOOL_DIR/github.sh

# Chrome
bash $PROG_DIR/chrome.sh

# VS Code
bash $PROG_DIR/vscode.sh

# Atom
bash $PROG_DIR/atom.sh
