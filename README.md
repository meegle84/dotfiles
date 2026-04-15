# dotfiles

Personal macOS dotfiles managed with [dotbot](https://github.com/anishathalye/dotbot).

## Goal

Bootstrap a new Mac from scratch with a single command:

```sh
git clone https://github.com/meegle84/dotfiles ~/.dotfiles && ~/.dotfiles/install.sh
```

## Prerequisites

Must be installed manually before running `install.sh`:

| Tool | Install |
|------|---------|
| Xcode Command Line Tools | `xcode-select --install` |
| Homebrew | `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` |

## What the bootstrap does

**Symlinks** via dotbot:

| Symlink | Source |
|---------|--------|
| `~/.zshenv` | `zsh/.zshenv` |
| `~/.zsh` | `zsh/` |
| `~/.gitconfig` | `git/.gitconfig` |

**Homebrew** — installs all taps, formulae and casks:

```sh
brew bundle --file brew/Brewfile
```

## Structure

```
~/.dotfiles/
├── dotbot/               # submodule
├── install.conf.yaml
├── install.sh
├── zsh/
│   ├── .zshenv
│   └── .zshrc
├── git/
│   └── .gitconfig
└── brew/
    └── Brewfile
```

## Idempotence

`install.sh` is safe to run multiple times — dotbot relinks any missing or
broken symlinks without touching files it did not create.

## Background

This repository is a clean rewrite of a previous dotfiles setup that grew
organically without a proper install mechanism, making it unreliable to
bootstrap a new machine. This rewrite adopts
[dotbot](https://github.com/anishathalye/dotbot) as the single source of truth
for symlink management and aims to stay properly maintained going forward.
