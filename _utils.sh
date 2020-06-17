
# Dir vars for other scripts
SOFTWARE_DIR="$HOME/Softwares"


# Log Title of what's going on
# Params
#   $1 -> Title
log_title() {
  echo
  echo "[$1]"
  echo
}


# Log warning
# Params
#   $1 -> Warning message
log_warn() {
  echo
  echo "##Warning## $1"
  echo
}


# Print error message and exit
# Params
#   $1 -> Error message
log_err() {
  echo
  echo "!!Error!! $1" 1>&2
  echo
  exit 1
}


# Check if last command ran gave an error
is_last_ok() {
  [[ $? -eq 0 ]]
}


# Check if a program is installed
# Params
#   $1 -> Program name
is_prog() {
  command -v "$1" >/dev/null 2>&1
}


# Install a program from apt if not installed
# Params:
#   $1 -> program name to install
#   $2 -> program name to display
install_apt() {
  if is_prog $1 ; then
    log_warn "$2 is already installed"
  else
    log_title "Installing $2"
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
    log_warn "$2 is already installed"
  else
    log_title "Installing $2"
    $3
    sudo apt-get install -f -y
  fi
}


# Extract any compressed file
# Params:
#   $1 -> source file path
#   $2 -> destination path
decompress() {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2)  tar xf "$1" -C $2 ;;
      *.tar.gz)   tar xf "$1" -C $2 ;;
      *.tar.xz)   tar xf "$1" -C $2 ;;
      *.bz2)      tar xf "$1" -C $2 ;;
      *.gz)       gunzip -c "$1" > $2 ;;
      *.tar)      tar xf "$1" -C $2 ;;
      *.tbz2)     tar xf "$1" -C $2 ;;
      *.tgz)      tar xf "$1" -C $2 ;;
      *.zip)      unzip -q "$1" -d $2 ;;
      *)          log_err "Contents of '$1' cannot be decompressed" ;;
    esac
  else
    log_err "'$1' is not recognized as a compressed file"
  fi
}


# Basename of compressed file
# Params:
#   $1 -> source file path
get_basename() {
  FILE=$(basename -- "$1")
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2)  echo "${FILE%%.tar.bz2}"   ;;
      *.tar.gz)   echo "${FILE%%.tar.gz}"   ;;
      *.tar.xz)   echo "${FILE%%.tar.xz}"   ;;
      *.bz2)      echo "${FILE%%.bz2}"   ;;
      *.rar)      echo "${FILE%%.rar}"   ;;
      *.gz)       echo "${FILE%%.gz}"   ;;
      *.tar)      echo "${FILE%%.tar}"   ;;
      *.tbz2)     echo "${FILE%%.tbz2}"   ;;
      *.tgz)      echo "${FILE%%.tgz}"   ;;
      *.xz)       echo "${FILE%%.xz}"   ;;
      *.zip)      echo "${FILE%%.zip}"   ;;
      *.Z)        echo "${FILE%%.Z}"   ;;
      *.7z)       echo "${FILE%%.7z}"   ;;
      *)          log_err "Basename of '$1' cannot be identified" ;;
    esac
  else
    log_err "'$1' is not recognized as a compressed file"
  fi
}

# Get latest release version of a github repo
# Params:
#   $1 -> <user_name>/<repo_name>
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}
