# not interactively do anything
[[ $- != *i* ]] && return

# colors
autoload -U colors && colors

# history setup
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZ

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt share_history # share history between different instances of the shell
setopt inc_append_history # save history entries as soon as they are entered

# exports
if [ -f $HOME/.env ]; then
  . $HOME/.env
fi
# alias
if [ -f $HOME/.aliases ]; then
  . $HOME/.aliases
fi
# keybindings
if [ -f $HOME/.inputrc ]; then
  . $HOME/.inputrc
fi

# enable completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
zmodload zsh/complist

# enabla fzf-tab
source $HOME/.zsh/fzf-tab/fzf-tab.plugin.zsh

zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'

# enable autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# enable syntax highlight
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# enable aliases suggestions
source $(brew --prefix)/share/zsh-you-should-use/you-should-use.plugin.zsh

# enable starship
eval "$(starship init zsh)"
