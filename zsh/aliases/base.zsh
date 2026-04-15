# sudo
alias sudo='sudo ' # expand alias completion after sudo

# environment
alias reload='exec $SHELL -l'

# editor
type nvim > /dev/null 2>&1 && alias vim='nvim'
alias v='vim'

# list
type lsd > /dev/null 2>&1 && alias ls='lsd -h --group-dirs first'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
if type lsd > /dev/null 2>&1; then
  alias l.='lsd -a | grep -E "^\."'
else
  alias l.='ls -d .[!.]* ..?* 2>/dev/null'
fi

# pager
alias less='less -R'

# file management
alias mv='mv -iv'
alias rm='rm -iv'
alias cp='cp -iv'
alias mkdir='mkdir -pv'

# list (legacy)
alias dir='ls'

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
alias publicip='curl ifconfig.co'
alias localip='ifconfig -l | xargs -n1 ipconfig getifaddr'

# grep
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'

# tail
alias t='tail -f'

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
alias bn='brew info'
alias bl='brew list'
alias br='brew remove'
alias bd='brew doctor'
alias bu='brew update'
alias bp='brew upgrade'
