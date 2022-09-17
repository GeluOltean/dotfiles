# utils
alias py='python3'
alias del='trash -v'
alias cp='cp -vi'
alias mv='mv -vi'
alias l='ls -lh'
alias la='l -a'
alias upgrade='sudo apt update && sudo apt upgrade'
alias mkdir='mkdir -pv'

# git
alias gadd='git add'
alias gadda='git add .'
alias gstat='git status'
alias glast='git show'
alias gpush='git push'
alias gpull='git pull'
alias gcomm='git commit --message'
alias glog='git log'

# services
alias sys='systemctl'
alias ser='service'

alias apacheup='service apache2 start'
alias apachedown='service apache2 stop'

alias dockerup='sys start docker docker.socket'
alias dockerdown='sys stop docker docker.socket'

# programs
alias emc="emacsclient -c -a 'emacs'"
