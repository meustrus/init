#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/../.." && pwd)}

finalizeVSCode() {
    ${SUDO_USER:+sudo -u "$SUDO_USER"} cp -f "$INIT_REPO/shared/config/vscode-settings.json" "$1/settings.json"
    ${SUDO_USER:+sudo -u "$SUDO_USER"} cp -f "$INIT_REPO/shared/config/vscode-keybindings.json" "$1/keybindings.json"

    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global core.editor "code --wait --new-window"
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global diff.tool code
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global merge.tool code
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global difftool.code.cmd "code --wait --new-window --diff \$LOCAL \$REMOTE"
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global mergetool.code.cmd "code --wait --new-window -- \$MERGED"
}

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    sh "$INIT_REPO/mac/bin/brew-cask-install.sh" visual-studio-code
    finalizeVSCode "$HOME/Library/Application Support/Code/User"
elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
    choco install vscode -y
    finalizeVSCode "$APPDATA/Code/User/"
fi
