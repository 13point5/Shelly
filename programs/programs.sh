#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
CURR_DIR="$ROOT_DIR/programs"
source "$ROOT_DIR/_utils.sh"

# Softwares dir
if [ -d "$SOFTWARE_DIR" ]; then
  log_title "Software directory already exists!"
else
  log_title "Making software directory at $SOFTWARE_DIR"
  mkdir -p $SOFTWARE_DIR
fi

# Chrome
bash $CURR_DIR/_chrome.sh

# VS Code
bash $CURR_DIR/_vscode.sh

# Atom
bash $CURR_DIR/_atom.sh

# Slack
bash $CURR_DIR/_slack.sh

# Spotify
bash $CURR_DIR/_spotify.sh
