

# Print title/message of what's going on
print_title() {
  echo
  echo "[$1]"
  echo
}

# Check if a program is installed
is_prog() {
  command -v "$1" >/dev/null 2>&1
}

# Install a program from apt if not installed
# Params:
#   $1 -> program name in terminal
#   $2 -> program name to display
install_apt() {
  if is_prog $1 ; then
    print_title "$2 is already installed"
  else
    print_title "Installing $2"
    sudo apt-get install $1 -y
    sudo apt-get install -f -y
  fi
}


# Install a program with custom instructions if not installed
# Params:
#   $1 -> program name in terminal
#   $2 -> program name to display
#   $3 -> function to install the program
install_prog() {
  if is_prog $1 ; then
    print_title "$2 is already installed"
  else
    print_title "Installing $2"
    $3
    sudo apt-get install -f -y
  fi
}
