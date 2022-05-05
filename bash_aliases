# Quality of life/generic
alias cls="/usr/bin/clear"
alias ls="/usr/bin/ls --color=auto --group-directories-first -lF"
alias count="/usr/bin/find . -type f | /usr/bin/wc -l"

# Package manager aliases
alias update="/usr/bin/sudo /usr/bin/apt update && /usr/bin/sudo /usr/bin/apt update"
alias upgrade="/usr/bin/sudo /usr/bin/apt update && /usr/bin/sudo /usr/bin/apt upgrade"

# Git-specific
alias grab="/usr/bin/git add"
alias commit="/usr/bin/git commit -m"
alias yeet="/usr/bin/git push"
alias yoink="/usr/bin/git pull"

# Extract function
extract() {
  if [ -f $1 ]
  then
    case $1 in
      *.tar.bz2)  tar xjf $1    ;;
      *.tar.gz)   tar xzf $1    ;;
      *.bz2)      bunzip2 $1    ;;
      *.rar)      unrar x $1    ;;
      *.gz)       gunzip $1     ;;
      *.tar)      tar xf $1     ;;
      *.tbz2)     tar xjf $1    ;;
      *.tgz)      tar xzf $1    ;;
      *.zip)      unzip $1      ;;
      *.Z)        uncompress $1 ;;
      *.7z)       7z x $1       ;;
      *.deb)      ar x $1       ;;
      *.tar.xz)   tar xf $1     ;;
      *.tar.zst)  unzstd $1     ;;
      *)          echo "'$1' cannot be extracted with extract()..." ;;
    esac
  else
    echo "'$1' is not a valid file..."
  fi
}
