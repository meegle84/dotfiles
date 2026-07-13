#!/usr/bin/env bash
# Remap F5/F6 (dictation/DND on Apple Silicon keyboards) to brightness
# down/up. Opt-in: NOT part of the bootstrap because it needs sudo.
#
# Installs a system LaunchAgent that applies the hidutil mapping at every
# login, and applies it immediately for the current session.

set -euo pipefail

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
PLIST_NAME="com.local.KeyRemapping.plist"
PLIST_SRC="${BASEDIR}/${PLIST_NAME}"
PLIST_DST="/Library/LaunchAgents/${PLIST_NAME}"

# F5 (0xC000000CF dictation) -> brightness down (0xFF00000009)
# F6 (0x10000009B DND)       -> brightness up   (0xFF00000008)
MAPPING='{"UserKeyMapping":[
  {"HIDKeyboardModifierMappingSrc":0xC000000CF,"HIDKeyboardModifierMappingDst":0xFF00000009},
  {"HIDKeyboardModifierMappingSrc":0x10000009B,"HIDKeyboardModifierMappingDst":0xFF00000008}
]}'

echo "==> Installing ${PLIST_DST} (needs sudo)"
sudo cp "$PLIST_SRC" "$PLIST_DST"
sudo chown root:wheel "$PLIST_DST"
sudo chmod 644 "$PLIST_DST"

echo "==> Applying mapping for the current session"
hidutil property --set "$MAPPING" > /dev/null

echo "==> Done. F5/F6 now control brightness (persists across logins)."
