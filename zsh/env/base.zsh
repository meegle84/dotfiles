# colors
export CLICOLOR=1

# locale
export LANG=es_ES.UTF-8
[ -z "${LC_CTYPE:-}" ] && export LC_CTYPE="$LANG"

# editor
export EDITOR=code
export VISUAL=code

# pager
export PAGER='less -X'

path_prepend() {
  [ -n "$1" ] || return 0
  [ -d "$1" ] || return 0
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$1:$PATH" ;;
  esac
}

path_prepend "$HOME/.local/bin"
path_prepend "$HOME/bin"
export PATH
