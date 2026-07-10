# Login-shell environment.

# Homebrew shellenv, architecture-aware (arm64 prefers /opt/homebrew).
if [ "$(uname -m)" = "arm64" ]; then
  brew_candidates=(/opt/homebrew/bin/brew /usr/local/bin/brew)
else
  brew_candidates=(/usr/local/bin/brew /opt/homebrew/bin/brew)
fi
for brew_bin in "${brew_candidates[@]}"; do
  if [ -x "$brew_bin" ]; then
    eval "$("$brew_bin" shellenv)"
    break
  fi
done
unset brew_candidates brew_bin

# Login-time environment from modular files.
if [ -f "$ZDOTDIR/env/base.zsh" ]; then
  . "$ZDOTDIR/env/base.zsh"
  [ -f "$ZDOTDIR/env/macos.zsh" ] && . "$ZDOTDIR/env/macos.zsh"
  export DOTFILES_ENV_LOADED=1
fi
