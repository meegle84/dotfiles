[[ $- != *i* ]] && return

# env (fallback for shells where .zprofile did not run)
if [ -z "${DOTFILES_ENV_LOADED:-}" ]; then
  [ -f "$ZDOTDIR/env/base.zsh" ] && . "$ZDOTDIR/env/base.zsh"
  [ -f "$ZDOTDIR/env/macos.zsh" ] && . "$ZDOTDIR/env/macos.zsh"
fi

# history
[ -f "$ZDOTDIR/history.zsh" ] && . "$ZDOTDIR/history.zsh"

# aliases
[ -f "$ZDOTDIR/aliases/base.zsh" ] && . "$ZDOTDIR/aliases/base.zsh"
[ -f "$ZDOTDIR/aliases/macos.zsh" ] && . "$ZDOTDIR/aliases/macos.zsh"

# functions
[ -f "$ZDOTDIR/functions.zsh" ] && . "$ZDOTDIR/functions.zsh"

# keybindings
[ -f "$ZDOTDIR/keybindings.zsh" ] && . "$ZDOTDIR/keybindings.zsh"

# completions
[ -f "$ZDOTDIR/completions.zsh" ] && . "$ZDOTDIR/completions.zsh"
