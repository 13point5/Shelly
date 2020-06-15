# Aliases I actually use

# normal stuff
alias l="ls -lhaF"
alias ..="cd .."
alias ...="cd ../.."

mkcd () {
  mkdir -pv -- "$1" && cd -Pe -- "$1"
}

# apt
alias apt="sudo apt-get -y"

# react
alias ncra="npx cra"

# git
alias ga="git add"
alias gaa="ga ."
alias gstat="git status"
alias gcm="git commit"
alias gpush="git push"
alias gpull="git pull"
alias gmerge="git merge"
alias gbranch="git branch"
alias gchout="git checkout"
