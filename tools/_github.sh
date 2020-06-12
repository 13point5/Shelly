#!/bin/sh

# Get util functions
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
source "$ROOT_DIR/_utils.sh"

# Install Git
install_apt git git "Git"

# Setup Git
print_title "Setting up Git"
GIT_USER_INFO=$(git config -l)

# Set name if not set
if [ ! "$(grep user.name <<< \"$GIT_USER_INFO)\"" ] ; then
  echo -n "[Git] Enter your name: " ; read GIT_NAME
  git config --global user.name "$GIT_NAME"
fi

# Set email if not set. Otherwise read it for the SSH key
GIT_EMAIL_INFO=$(grep user.email <<< "$GIT_USER_INFO")
if [ ! $GIT_EMAIL_INFO ] ; then
  echo -n "[Git] Enter your email address: " ; read GIT_EMAIL
  git config --global user.email "$GIT_EMAIL"
else
  IFS='='
  read -a GIT_EMAIL_INFO <<< "$GIT_EMAIL_INFO"
  GIT_EMAIL=${GIT_EMAIL_INFO[1]}
fi

# Add SSH key to Github
SSH_KEY_PATH=${HOME}/.ssh/id_rsa.pub

if [ ! -f "$SSH_KEY_PATH" ]; then
  print_title "Adding SSH key to Github"
  echo -n "[Github] Enter your username: " ; read GIT_USERNAME
  echo -n "[Github] Enter your unique machine name for SSH KEY: " ; read GIT_MACHINE_NAME
  ssh-keygen -t rsa -b 4096 -C $GIT_EMAIL
  ssh-add ~/.ssh/id_rsa
  curl -u $GIT_USERNAME --data '{"title":"'"$GIT_MACHINE_NAME"'","key":"'"$(cat $SSH_KEY_PATH)"'"}' https://api.github.com/user/keys
else
  print_title "SSH key already exists locally!"
fi
