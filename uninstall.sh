#!/usr/bin/env bash

set -euo pipefail

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

# Remove the symlinks declared in install.conf.yaml, but only when they
# actually point into this repository. Everything else is left untouched.
sed -n 's/^[[:space:]]*\(~\/[^:]*\):.*/\1/p' "${BASEDIR}/install.conf.yaml" |
while IFS= read -r target; do
  path="${target/#~/$HOME}"
  if [ -L "$path" ]; then
    dest="$(readlink "$path")"
    case "$dest" in
      "$BASEDIR"/* | "$BASEDIR")
        rm "$path"
        echo "removed  $path"
        ;;
      *)
        echo "skipped  $path (symlink to $dest, not this repo)"
        ;;
    esac
  elif [ -e "$path" ]; then
    echo "skipped  $path (not a symlink)"
  else
    echo "absent   $path"
  fi
done

echo "Uninstall complete. Repository and Homebrew packages left untouched."
