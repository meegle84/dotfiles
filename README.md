# dotfiles

Personal macOS dotfiles managed with [dotbot](https://github.com/anishathalye/dotbot).
A clean rewrite of a previous setup, grown incrementally.

## Bootstrap

```sh
git clone https://github.com/meegle84/dotfiles ~/.dotfiles && ~/.dotfiles/install.sh
```

Requires Xcode Command Line Tools (`xcode-select --install`); Homebrew is
installed automatically if missing.

`install.sh` runs, in order:

1. `brew bundle` — taps, formulae and casks from `brew/Brewfile`
2. Backup — pre-existing regular files at link targets are moved aside to
   `<path>.pre-dotfiles` (never deleted)
3. dotbot — symlinks (`~/.zshenv`, `~/.zsh`, `~/.gitconfig`) per `install.conf.yaml`
4. `pre-commit install` — repo quality gates

If a step fails, the error names it (`install failed during: <step>`).

Safe to run multiple times: dotbot relinks only what is missing and
`brew bundle` skips what is already installed.

## Uninstall

```sh
~/.dotfiles/uninstall.sh
```

Removes only the symlinks that point into `~/.dotfiles`, restoring any
`<path>.pre-dotfiles` backup that install moved aside. Safe to run
multiple times.

Install and uninstall are deliberately asymmetric: `install.sh` installs
packages and links config; `uninstall.sh` only unlinks config. It never
removes the repository, Homebrew packages or applications.
