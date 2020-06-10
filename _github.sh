#!/bin/sh

# Load util functions
source utils.sh

print_title "Git & Github"

# Install Git
install_apt git "Git"

# Setup Git
print_title "Setting up Git"
GIT_USER_INFO=$(git config -l)

if [ ! $(grep user.name <<< "$GIT_USER_INFO") ] ; then
  echo -n "[Git] Enter your name: " ; read GIT_NAME
  git config --global user.name "$GIT_NAME"
fi

if [ ! $(grep user.email <<< "$GIT_USER_INFO") ] ; then
  echo -n "[Git] Enter your email address: " ; read GIT_EMAIL
  git config --global user.email "$GIT_EMAIL"
fi

# Add SSH key to Github
print_title "Adding SSH key to Github"
SSH_KEY_PATH=~/.ssh/id_rsa.pub

if [ ! -f "$SSH_KEY_PATH" ]; then
  echo -n "[Github] Enter your username: " ; read GIT_USERNAME
  echo -n "[Github] Enter your unique machine name for SSH KEY: " ; read GIT_MACHINE_NAME
  ssh-keygen -t rsa -b 4096 -C $GIT_EMAIL
  ssh-add ~/.ssh/id_rsa
  curl -u $GIT_USERNAME --data '{"title":"'"$GIT_MACHINE_NAME"'","key":"'"$(cat $SSH_KEY_PATH)"'"}' https://api.github.com/user/keys
else
  print_title "SSH key already exists locally!"
fi
