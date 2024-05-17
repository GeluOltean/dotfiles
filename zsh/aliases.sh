# utils
alias py='python3'
alias cp='cp -vi'
alias mv='mv -vi'
alias l='ls -lh'
alias la='l -a'
alias mkdir='mkdir -pv'

  # Ubuntu
  if [[ $(uname -v) == *"Ubuntu"* ]]; then
    alias upgrade='sudo apt update && sudo apt upgrade'
    alias del='trash -v'
  fi

# git
alias gadd='git add'
alias gadda='git add .'
alias gstat='git status'
alias glast='git show'
alias gpush='git push'
alias gpull='git pull'
alias gcomm='git commit --message'
alias glog='git log'
alias gstash='git stash'

# services
  # Linux/systemd
  if [[ $(uname) == "Linux" ]]; then
    alias sys='systemctl'
    alias ser='service'

    alias apacheup='service apache2 start'
    alias apachedown='service apache2 stop'

    alias dockerup='sys start docker docker.socket'
    alias dockerdown='sys stop docker docker.socket'
  fi

# programs
alias emc="emacsclient -c -a 'emacs --debug-init'"
