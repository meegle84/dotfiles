#!/usr/bin/env bash

set -euo pipefail

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

step="starting"
trap 'echo "ERROR: install failed during: ${step}" >&2' ERR

step="Homebrew install"
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

step="brew bundle"
# Modular manifests, applied in dependency order. The mas module is
# non-fatal: it needs an App Store session, which cannot be automated.
for manifest in Brewfile.taps Brewfile.formulae Brewfile.casks; do
  brew bundle --file "${BASEDIR}/brew/${manifest}"
done
brew bundle --file "${BASEDIR}/brew/Brewfile.mas" ||
  echo "WARN: mas apps not installed (sign in to the App Store and re-run)" >&2

step="backup of pre-existing files"
# A regular file or directory at a link target makes dotbot fail (force is
# off by design). Move it aside once, keeping the data next to the target.
sed -n 's/^[[:space:]]*\(~\/[^:]*\):.*/\1/p' "${BASEDIR}/install.conf.yaml" |
while IFS= read -r target; do
  path="${target/#~/$HOME}"
  if [ -e "$path" ] && [ ! -L "$path" ]; then
    mv "$path" "${path}.pre-dotfiles"
    echo "backed up $path -> ${path}.pre-dotfiles"
  fi
done

step="dotbot"
dotbot -d "${BASEDIR}" -c "${BASEDIR}/install.conf.yaml" "$@"

step="pre-commit hooks"
(cd "${BASEDIR}" && pre-commit install --install-hooks)

trap - ERR
echo "Install complete."
