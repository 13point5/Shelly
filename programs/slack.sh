#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

install_slack() {
  SLACK_DEB="$SOFTWARE_DIR/slack.deb"
  SLACK_VER="4.4.3"

  if [ ! -f "$SLACK_DEB" ]; then
    wget "https://downloads.slack-edge.com/linux_releases/slack-desktop-$SLACK_VER-amd64.deb" -O $SLACK_DEB
  fi

  sudo dpkg -i $SLACK_DEB
}

install_prog slack "Slack" install_slack
