# Shell helper functions loaded from .zshrc.

# Create a new directory and enter it.
mkd() {
  mkdir -p "$1" && cd "$1"
}

# Print the first README file found in the current directory.
readme() {
  local f
  for f in {readme,README}.{md,MD,markdown,mkd,txt,TXT}; do
    if [[ -f "$f" ]]; then
      if command -v glow >/dev/null 2>&1; then
        glow "$f"
      else
        cat "$f"
      fi
      break
    fi
  done
}

# Weather report (defaults to Barcelona).
weather() {
  curl -s "https://wttr.in/${1:-Barcelona}?M2F&format=v2"
}

# Merge/remove AppleDouble (._*) files on a volume (defaults to cwd).
cleandots() {
  dot_clean -m "${1:-.}"
}

# Delete all local Time Machine snapshots.
tmdeletelocalsnapshots() {
  local d
  for d in $(tmutil listlocalsnapshotdates | grep "-"); do
    sudo tmutil deletelocalsnapshots "$d"
  done
}

# Extract compressed files by extension.
extract() {
  if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|lzma|exe|dmg>"
    return 1
  fi
  if [ ! -f "$1" ]; then
    echo "$1 - file does not exist"
    return 1
  fi
  case "$1" in
    *.tar.bz2) tar xvjf "$1" ;;
    *.tar.gz)  tar xvzf "$1" ;;
    *.tar.xz)  tar xvJf "$1" ;;
    *.lzma)    unlzma "$1" ;;
    *.bz2)     bunzip2 "$1" ;;
    *.dmg)     hdiutil mount "$1" ;;
    *.rar)     unrar x -ad "$1" ;;
    *.gz)      gunzip "$1" ;;
    *.tar)     tar xvf "$1" ;;
    *.tbz2)    tar xvjf "$1" ;;
    *.tgz)     tar xvzf "$1" ;;
    *.zip)     unzip "$1" ;;
    *.Z)       uncompress "$1" ;;
    *.7z)      7z x "$1" ;;
    *.xz)      unxz "$1" ;;
    *.exe)     cabextract "$1" ;;
    *)         echo "extract: '$1' - unknown archive method"; return 1 ;;
  esac
}
