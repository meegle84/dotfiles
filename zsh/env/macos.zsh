# macOS-specific environment.

# Terminal: preserve the value set by the terminal app; fallback only if missing.
if [ -z "${TERM:-}" ]; then
  export TERM=xterm-256color
fi

# Homebrew paths. Normally set by brew shellenv in .zprofile; this covers
# shells where that did not run. path_prepend is idempotent.
if command -v brew >/dev/null 2>&1; then
  homebrew_prefix="$(brew --prefix 2>/dev/null)"
elif [ -x /opt/homebrew/bin/brew ]; then
  homebrew_prefix=/opt/homebrew
elif [ -x /usr/local/bin/brew ]; then
  homebrew_prefix=/usr/local
fi

if [ -n "${homebrew_prefix:-}" ]; then
  path_prepend "$homebrew_prefix/sbin"
  path_prepend "$homebrew_prefix/bin"
  export PATH
fi
unset homebrew_prefix
