#!/usr/bin/env bash

set -euo pipefail

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

# Remove the symlinks declared in install.conf.yaml, but only when they
# actually point into this repository. Everything else is left untouched.
# Files that install.sh moved aside (<path>.pre-dotfiles) are restored once
# their slot is free again.
restore_backup() {
  if [ -e "$1.pre-dotfiles" ] && [ ! -e "$1" ]; then
    mv "$1.pre-dotfiles" "$1"
    echo "restored $1 (from $1.pre-dotfiles)"
  fi
}

sed -n 's/^[[:space:]]*\(~\/[^:]*\):.*/\1/p' "${BASEDIR}/install.conf.yaml" |
while IFS= read -r target; do
  path="${target/#~/$HOME}"
  if [ -L "$path" ]; then
    dest="$(readlink "$path")"
    case "$dest" in
      "$BASEDIR"/* | "$BASEDIR")
        rm "$path"
        echo "removed  $path"
        restore_backup "$path"
        ;;
      *)
        echo "skipped  $path (symlink to $dest, not this repo)"
        ;;
    esac
  elif [ -e "$path" ]; then
    echo "skipped  $path (not a symlink)"
  else
    echo "absent   $path"
    restore_backup "$path"
  fi
done

echo "Uninstall complete. Repository and Homebrew packages left untouched."
