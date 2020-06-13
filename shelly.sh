#!/bin/sh

# Make all scripts executable
find ./ -name "*.sh" -exec chmod u+rx {} \;

# Load util functions
source _utils.sh

# Dir vars
PROJECT_DIR=$(dirname $(realpath $0))
PROG_DIR="$PROJECT_DIR/programs"
TOOL_DIR="$PROJECT_DIR/tools"
STYLE_DIR="$PROJECT_DIR/styles"

# Update and Upgrade
print_title "Updating and Upgrading"
sudo apt-get update -y
sudo apt-get upgrade -y

# Tools
bash $TOOL_DIR/tools.sh

# Styling
bash $STYLE_DIR/styles.sh

# Programs
bash $PROG_DIR/programs.sh
