# sudo
alias sudo='sudo ' # expand alias completion after sudo

# environment
alias reload='exec $SHELL -l'

# editor
type nvim > /dev/null 2>&1 && alias vim='nvim'

# list
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias l.='ls -d .[!.]* ..?* 2>/dev/null'

# list (legacy)
alias dir='ls'

# pager
alias less='less -R'

# file management
alias mv='mv -iv'
alias rm='rm -iv'
alias cp='cp -iv'
alias mkdir='mkdir -pv'

# navigation
alias -- -='cd -'
alias ..='cd ../'
alias ...='cd ../../'

# clear
alias clr='clear'

# kill
alias k9='kill -9'

# size
alias du='du -ch'

# network
alias wget='wget -c'
alias publicip='curl -s ifconfig.co 2>/dev/null || curl -s icanhazip.com'
alias localip='ifconfig -l | xargs -n1 ipconfig getifaddr'

# grep
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'

# tail
alias tf='tail -f'

# pipes
alias G='| grep'
alias H='| head'
alias L='| less'
alias T='| tail'
alias NE='2> /dev/null'
alias NUL='> /dev/null 2>&1'

# brew
alias bs='brew search'
alias bi='brew install'
alias binfo='brew info'
alias bls='brew list'
alias brm='brew remove'
alias bd='brew doctor'
alias bu='brew update'
alias bpg='brew upgrade'
