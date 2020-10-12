#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

# nvm
install_nvm() {
  nvm_version=$(get_latest_release "nvm-sh/nvm")
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/$nvm_version/install.sh | bash
  sleep 2
  nvm install --lts
}

# yarn
install_yarn() {
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update -y
  sudo apt-get install yarn -y
}

# install
install_prog nvm "nvm" install_nvm
install_prog yarn "Yarn" install_yarn
