#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")" && pwd)}
source "$INIT_REPO/shared/vars.sh"

copyIfExists() {
    [ -f "$1" ] && ${SUDO_USER:+sudo -u "$SUDO_USER"} cp -f "$1" "$2"
}

copyIfExists "$BENCH/shellrc.d/initrc.sh" "$INIT_REPO/shared/config/initrc.sh"
copyIfExists "$BENCH/.gitignore-global" "$INIT_REPO/shared/config/.gitignore-global"

updateVSCode() {
    copyIfExists "$1/settings.json" "$INIT_REPO/shared/config/vscode-settings.json"
    copyIfExists "$1/keybindings.json" "$INIT_REPO/shared/config/vscode-keybindings.json"
}

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    updateVSCode "$HOME/Library/Application Support/Code/User"
elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
    updateVSCode "$APPDATA/Code/User/"
fi
