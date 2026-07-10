# Zsh history settings. Runtime state lives in XDG state, not $HOME.
_zsh_state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/zsh"
mkdir -p "$_zsh_state_dir"
HISTFILE="$_zsh_state_dir/history"
HISTSIZE=100000
SAVEHIST=100000
unset _zsh_state_dir

# SHARE_HISTORY imports and appends commands between sessions.
# Do not combine with INC_APPEND_HISTORY / INC_APPEND_HISTORY_TIME.
setopt SHARE_HISTORY
unsetopt INC_APPEND_HISTORY
unsetopt INC_APPEND_HISTORY_TIME

setopt BANG_HIST              # Treat '!' specially during expansion.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming.
setopt HIST_IGNORE_DUPS       # Don't record an entry recorded just before.
setopt HIST_IGNORE_ALL_DUPS   # Delete old entry if new one is a duplicate.
setopt HIST_IGNORE_SPACE      # Don't record entries starting with a space.
setopt HIST_BEEP              # Beep when accessing nonexistent history.
