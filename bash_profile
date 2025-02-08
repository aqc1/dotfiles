### Bash Prompt ###
PS1='\[\e[0;38;5;32m\][\[\e[0;92m\]\u\[\e[0;38;5;32m\]@\[\e[0;92m\]\H\[\e[0;38;5;32m\]: \[\e[0;38;5;214m\]\W\[\e[0;38;5;32m\]] \[\e[0;92m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\n\[\e[0;38;5;32m\]\$ \[\e[0m\]'

### Bash Aliases ###

# Quality of life
alias cls="clear"
alias {quit,:q}="exit"
alias root="sudo -i"
alias reload="source \"$HOME/.bashrc\""

# Editing and debugging
alias gdb="gdb -q"
alias vi="vim"

# Network
alias ports="netstat -tulanp"
alias serve="python3 -m http.server"

# Pipe into these
alias xclip="xclip -selection clipboard"
alias uppercase="tr '[:lower:]' '[:upper:]'"
alias lowercase="tr '[:upper:]' '[:lower:]'"

# Git-specific
alias add="git add"
alias commit="git commit -m"
alias {push,yeet}="git push"
alias {pull,yoink}="git pull"
alias clone="git clone"
alias status="git status"

### Bash Functions ###

# Since I forget to use sudo
oops() {
    sudo $(history | tail -n 2 | head -n 1 | cut -c8- )
}

# Makes extracting various files easier
# :param $1: File to be extracted
extract() {
  if [ $# -ne 1 ]; then
    echo "Usage: extract <archive>"
  else
    if [ -f "$1" ]; then
        case "$1" in
        *.tar.bz2)  tar xjf "$1"    ;;
        *.tar.gz)   tar xzf "$1"    ;;
        *.bz2)      bunzip2 "$1"    ;;
        *.rar)      unrar x "$1"    ;;
        *.gz)       gunzip "$1"     ;;
        *.tar)      tar xf "$1"     ;;
        *.tbz2)     tar xjf "$1"    ;;
        *.tgz)      tar xzf "$1"    ;;
        *.zip)      unzip "$1"      ;;
        *.Z)        uncompress "$1" ;;
        *.7z)       7z x "$1"       ;;
        *.deb)      ar x "$1"       ;;
        *.tar.xz)   tar xf "$1"     ;;
        *.tar.zst)  unzstd "$1"     ;;
        *)          echo "'$1' cannot be extracted with extract()..." ;;
        esac
    else
        echo "'$1' is not a valid file..."
    fi
  fi
}

# Creates backup copy of file
# :param $1: File to create a .bak copy of
backup() {
    if [ $# -ne 1 ]; then
        echo "Usage: backup <file>"
    else
        cp "$1"{,.bak}
    fi
}

# Quickly grep through man pages
# :param $1: Command to search
# :param $2: Search pattern
rtfm() {
    if [ $# -ne 2 ]; then
        echo "Usage: rtfm <command> <search query>"
    else
        man "$1" | grep "$2"
    fi
}
