#!/bin/sh

# Making all scripts executable
chmod a+rx *.sh

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

# Git and Github
bash _github.sh

# Chrome
bash _chrome.sh

# VS Code
bash _vscode.sh

# Atom
bash _atom.sh
