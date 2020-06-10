#!/bin/sh

# Load util functions
source utils.sh

print_title "Chrome"

install_chrome() {
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
  sudo apt-get update -y
  sudo apt-get install google-chrome-stable -y
}

install_prog google-chrome "Google Chrome" install_chrome
