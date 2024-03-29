# not interactively do anything
[[ $- != *i* ]] && return

# colors
autoload -U colors && colors

# history setup
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt appendhistory
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
#setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
#setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
#setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
#setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
#setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
#setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# exports
if [ -f $HOME/.exports ]; then
  . $HOME/.exports
fi
# alias
if [ -f $HOME/.aliases ]; then
  . $HOME/.aliases
fi
# functions
if [ -f $HOME/.functions ]; then
  . $HOME/.functions
fi
# keybindings
if [ -f $HOME/.inputrc ]; then
  . $HOME/.inputrc
fi
# zplug
if [ -f ${HOME}/.zplug/init.zsh ]; then
  source ${HOME}/.zplug/init.zsh
fi
# alias checker
if [ -f $(brew --prefix)/share/zsh-you-should-use/you-should-use.plugin.zsh ]; then
  source $(brew --prefix)/share/zsh-you-should-use/you-should-use.plugin.zsh
fi

# enable completions
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  # for some reason the following line fixes the error
  # 'zsh compinit: insecure directories, run compaudit for list.'
  # but is not needed to be executed every time, only one to be fixed
  # compaudit | xargs chmod g-w
  compinit
fi
zmodload zsh/complist

# enable fzf-tab
zplug "Aloxaf/fzf-tab", from:github
zplug "supercrabtree/k", from:github, as:plugin
zplug 'wfxr/forgit', from:github, as:plugin

zplug "zsh-users/zsh-completions", depth:1
zplug "zsh-users/zsh-autosuggestions", from:github
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:2
zplug "zsh-users/zsh-history-substring-search", from:github, defer:3

zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# tab cambletion shows folder contents
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 --color=always $realpath'
# activate menu selection
zstyle ':completion:*' menu select

# install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# source plugins and add commands to $PATH
zplug load

# enable starship
# https://github.com/starship/starship
eval "$(starship init zsh)"
