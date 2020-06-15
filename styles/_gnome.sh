#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

print_title "Some nice settings for Gnome"
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface monospace-font-name "Ubuntu Mono Regular 16"
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
gsettings set org.gnome.nautilus.icon-view default-zoom-level 'large'