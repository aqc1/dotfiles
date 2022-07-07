# Quality of life/generic
alias cls="/usr/bin/clear"
alias ls="/usr/bin/ls --color=auto --group-directories-first -lF"
alias cat="/usr/bin/batcat"
alias xclip="/usr/bin/xclip -selection clipboard"
alias gdb="/usr/bin/gdb -q"
alias vi="/usr/bin/vim"
alias grep="/usr/bin/grep --color=auto"
alias fgrep="/usr/bin/fgrep --color=auto"
alias egrep="/usr/bin/egrep --color=auto"
alias what="/usr/bin/apropos"

# Package manager aliases
alias update="/usr/bin/sudo /usr/bin/apt update && /usr/bin/sudo /usr/bin/apt update"
alias upgrade="/usr/bin/sudo /usr/bin/apt update && /usr/bin/sudo /usr/bin/apt upgrade"
alias clean="/usr/bin/sudo /usr/bin/apt clean && /usr/bin/sudo /usr/bin/apt autoclean && /usr/bin/sudo /usr/bin/apt autoremove"
alias cowabunga="/usr/bin/sudo /usr/bin/apt -y install"

# Git-specific
alias grab="/usr/bin/git add"
alias commit="/usr/bin/git commit -m"
alias yeet="/usr/bin/git push"
alias yoink="/usr/bin/git pull"
alias clone="/usr/bin/git clone"
alias status="/usr/bin/git status"

# Makes extracting various files easier
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)  /usr/bin/tar xjf "$1"    ;;
      *.tar.gz)   /usr/bin/tar xzf "$1"    ;;
      *.bz2)      /usr/bin/bunzip2 "$1"    ;;
      *.rar)      /usr/bin/unrar x "$1"    ;;
      *.gz)       /usr/bin/gunzip "$1"     ;;
      *.tar)      /usr/bin/tar xf "$1"     ;;
      *.tbz2)     /usr/bin/tar xjf "$1"    ;;
      *.tgz)      /usr/bin/tar xzf "$1"    ;;
      *.zip)      /usr/bin/unzip "$1"      ;;
      *.Z)        /usr/bin/uncompress "$1" ;;
      *.7z)       /usr/bin/7z x "$1"       ;;
      *.deb)      /usr/bin/ar x "$1"       ;;
      *.tar.xz)   /usr/bin/tar xf "$1"     ;;
      *.tar.zst)  /usr/bin/unzstd "$1"     ;;
      *)          /usr/bin/echo "'$1' cannot be extracted with extract()..." ;;
    esac
  else
    /usr/bin/echo "'$1' is not a valid file..."
  fi
}

# Creates backup copy of file
backup() {
    /usr/bin/cp "$1"{,.bak}
}

# Quickly grep through man pages
rtfm() {
    /usr/bin/man "$1" | /usr/bin/grep "$2"
}

# Docker functions
docker_bash() {
    /usr/bin/sudo /usr/bin/docker run --rm -it "$@" /bin/bash
}

docker_shell() {
    /usr/bin/sudo /usr/bin/docker run --rm -it "$@" /bin/sh
}

# Make moving up several directories easier
up() {
    NUM=$1
    if [[ $NUM =~ ^[\-0-9]+$ ]]; then
        if (( NUM < 0 )); then
            NUM=${NUM#-}
            NUM=$((NUM+1))
            cd "$(/usr/bin/echo "$PWD" | /usr/bin/cut -d/ -f1-$NUM)" || exit
        else
            cd "$(/usr/bin/printf "%.0s../" "$(/usr/bin/seq 1 ${NUM})")" || exit
        fi
    fi
}
