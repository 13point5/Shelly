#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

# Set bash aliases from file
# Params
#   $1 -> Path to alias file
set_aliases() {
  if [ ! -f "$1" ]; then
    log_err "Alias file not found!"
  fi

  if [ -f "$HOME/.bash_aliases" ]; then
    log_err "Alias file already exists!"
  fi

  cp "$1" "$HOME/.bash_aliases"
  source "$HOME/.bashrc"
}

log_title "Setting Bash aliases"
set_aliases "$ROOT_DIR/resources/.bash_aliases"
