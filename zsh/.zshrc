[[ $- != *i* ]] && return

# env
[ -f "$ZDOTDIR/env/base.zsh" ] && . "$ZDOTDIR/env/base.zsh"

# aliases
[ -f "$ZDOTDIR/aliases/base.zsh" ] && . "$ZDOTDIR/aliases/base.zsh"

# keybindings
[ -f "$ZDOTDIR/keybindings.zsh" ] && . "$ZDOTDIR/keybindings.zsh"

# completions
[ -f "$ZDOTDIR/completions.zsh" ] && . "$ZDOTDIR/completions.zsh"
