#!/usr/bin/env bash
# macOS system defaults — applied during bootstrap and safe to re-run.
# Only consciously chosen settings live here (audited against factory values
# on the main machine). Tested on macOS Sequoia 15.x, 2026-07-13.
#
# Each entry notes the factory value; revert any of them with
# `defaults delete <domain> <key>` (falls back to factory).

set -euo pipefail

section() {
  echo "==> $1"
}

section "Global"
defaults write -g AppleInterfaceStyle Dark                    # factory: Light
defaults write -g AppleShowAllExtensions -bool true           # factory: false
defaults write -g com.apple.swipescrolldirection -bool false  # factory: true (natural)

section "Finder"
defaults write com.apple.finder AppleShowAllFiles -bool true       # factory: false
defaults write com.apple.finder ShowPathbar -bool true             # factory: false
defaults write com.apple.finder ShowStatusBar -bool true           # factory: false
defaults write com.apple.finder FXPreferredViewStyle -string Nlsv  # factory: icnv (icons); Nlsv = list
defaults write com.apple.finder FXDefaultSearchScope -string SCcf  # factory: SCev (this Mac); SCcf = current folder
defaults write com.apple.finder _FXSortFoldersFirst -bool true     # factory: false

section "Dock"
defaults write com.apple.dock autohide -bool true       # factory: false
defaults write com.apple.dock tilesize -int 16          # factory: 64
defaults write com.apple.dock magnification -bool true  # factory: false
defaults write com.apple.dock show-recents -bool false  # factory: true

section "AppleDouble/.DS_Store on external volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true  # factory: false
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true      # factory: false

section "Keyboard input source (Spanish ISO)"
# Note: on a fresh machine this may only take effect after logout/reboot;
# session restore (TALLogoutSavesState) is deliberately left untouched.
defaults write com.apple.HIToolbox AppleEnabledInputSources -array \
  '{"InputSourceKind" = "Keyboard Layout"; "KeyboardLayout ID" = -27119; "KeyboardLayout Name" = "Spanish - ISO"; }' \
  '{"Bundle ID" = "com.apple.CharacterPaletteIM"; "InputSourceKind" = "Non Keyboard Input Method"; }'
defaults write com.apple.HIToolbox AppleSelectedInputSources -array \
  '{"InputSourceKind" = "Keyboard Layout"; "KeyboardLayout ID" = -27119; "KeyboardLayout Name" = "Spanish - ISO"; }'

section "Restarting affected apps"
for app in Finder Dock; do
  killall "$app" 2>/dev/null || true
done

echo "==> macOS defaults applied."
