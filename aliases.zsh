# General
alias o="open"

# Secure your moviments and commands
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"

# Git
alias gs='git status'
alias new-branch='git checkout -b'
alias uncommit="git reset --soft HEAD^"

# NeoVim
alias n="nvim"

# Oni vim
alias v="/Applications/Oni.app/Contents/Resources/app/oni.sh"

# Docker
alias d="docker"
alias dc="docker-compose"
alias dm="docker-machine"

# Kubernetes
alias k=kubectl

# Others
alias flush="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Function to get aws secret
function awssecret {
  if [[ "$1" == "" ]]
  then
    echo "awssecret <secret-name> <key>"
    return
  fi

  aws secretsmanager get-secret-value --secret-id $1 | jq '.SecretString | fromjson' | jq -r .$2
}
