#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
CURR_DIR="$ROOT_DIR/tools"
source "$ROOT_DIR/_utils.sh"

# Git and Github
bash $CURR_DIR/_github.sh
