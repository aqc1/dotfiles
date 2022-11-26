### Bash Aliases ###

# Quality of life
alias cls="/usr/bin/clear"
alias {quit,:q}="exit"
alias root="/usr/bin/sudo -i"
alias reboot="/usr/bin/sudo /usr/sbin/reboot"
alias reload="source \"$HOME/.bashrc\""

# Editing and debugging
alias gdb="/usr/bin/gdb -q"
alias vi="/usr/bin/vim"

# Network
alias ports="/usr/bin/netstat -tulanp"
alias serve="/usr/bin/python3 -m http.server"

# Pipe into these
alias xclip="/usr/bin/xclip -selection clipboard"
alias uppercase="/usr/bin/tr '[:lower:]' '[:upper:]'"
alias lowercase="/usr/bin/tr '[:upper:]' '[:lower:]'"

# Rust versions of GNU utilities
alias cat="/usr/bin/batcat"
alias ls="/usr/bin/exa --color=auto --group-directories-first -lF"
alias grep='/usr/bin/rg'
alias find='/usr/bin/fdfind'

# Package manager aliases
alias update="/usr/bin/sudo /usr/bin/apt update && /usr/bin/sudo /usr/bin/apt update"
alias upgrade="/usr/bin/sudo /usr/bin/apt update && /usr/bin/sudo /usr/bin/apt upgrade"
alias clean="/usr/bin/sudo /usr/bin/apt clean && /usr/bin/sudo /usr/bin/apt autoclean && /usr/bin/sudo /usr/bin/apt autoremove"
alias install="/usr/bin/sudo /usr/bin/apt -y install"

# Git-specific
alias add="/usr/bin/git add"
alias commit="/usr/bin/git commit -m"
alias {push,yeet}="/usr/bin/git push"
alias {pull,yoink}="/usr/bin/git pull"
alias clone="/usr/bin/git clone"
alias status="/usr/bin/git status"


### Bash Functions ###

# Makes extracting various files easier
# :param $1: File to be extracted
extract() {
  if [ $# -ne 1 ]; then
    echo "Usage: extract <archive>"
  else
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
  fi
}

# Creates backup copy of file
# :param $1: File to create a .bak copy of
backup() {
    if [ $# -ne 1 ]; then
        echo "Usage: backup <file>"
    else
        /usr/bin/cp "$1"{,.bak}
    fi
}

# Quickly grep through man pages
# :param $1: Command to search
# :param $2: Search pattern
rtfm() {
    if [ $# -ne 2 ]; then
        echo "Usage: rtfm <command> <search query>"
    else
        /usr/bin/man "$1" | /usr/bin/grep "$2"
    fi
}

# Docker functions
# :param $@: Any switches for forwarding + image
docker_bash() {
    if [ $# -lt 1 ]; then
        echo "Usage: docker_bash <image> [<docker params>, ...]"
    else
        /usr/bin/sudo /usr/bin/docker run --rm -it "$@" /bin/bash
    fi
}

docker_shell() {
    if [ $# -lt 1 ]; then
        echo "Usage: docker_shell <image> [<docker params>, ...]"
    else
        /usr/bin/sudo /usr/bin/docker run --rm -it "$@" /bin/sh
    fi
}

# Make moving up several directories easier
# :param $1: Number of directories to traverse
up() {
    if [ $# -ne 1 ]; then
        echo "Usage: up <num of directories>"
    else
        NUM=$1
        if [[ $NUM =~ ^[\-0-9]+$ ]]; then
            if (( NUM < 0 )); then
                NUM=${NUM#-}
                NUM=$((NUM+1))
                cd "$(/usr/bin/echo "$PWD" | /usr/bin/cut -d/ -f1-$NUM)"
            else
                for ((i=1; i <= NUM; i++)); do
                    cd ../
                done
            fi
        fi
    fi
}
