# Aliases I actually use

# normal stuff
alias l="ls -lhaF"
alias ..="cd .."
alias ...="cd ../.."

mkcd () {
  mkdir -pv -- "$1" && cd -- "$1"
}

# apt
alias apt="sudo apt-get -y"

# code
alias c="code ."

# react
alias ncra="npx create-react-app"

# git
alias ga="git add"
alias gaa="ga ."
alias gcm="git commit"
alias gpush="git push"
alias gacm="gaa && gcm"
alias gacp="gaa && gcm && gpush"
alias gstat="git status"
alias gpull="git pull"
alias gmerge="git merge"
alias gbranch="git branch"
alias gchout="git checkout"
