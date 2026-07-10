# Completion system. Dump file lives in XDG state, not $HOME.
autoload -Uz compinit
_zsh_state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/zsh"
mkdir -p "$_zsh_state_dir"
compinit -d "$_zsh_state_dir/zcompdump"
unset _zsh_state_dir

# Case-insensitive matching and menu selection.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
