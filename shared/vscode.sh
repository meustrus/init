#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/.." && pwd)}

finalizeVSCode() {
    ln -s -f "$INIT_REPO/shared/vscode/settings.json" "$1/settings.json"
    ln -s -f "$INIT_REPO/shared/vscode/keybindings.json" "$1/keybindings.json"

    git config --global diff.tool code
    git config --global merge.tool code
    git config --global difftool.code.cmd "code --wait --new-window --diff \$LOCAL \$REMOTE"
    git config --global mergetool.code.cmd "code --wait --new-window -- \$MERGED"
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    if [ ! -d "/Applications/Visual Studio Code.app" ]; then
        brew cask install --appdir="$MAC_APPS" visual-studio-code
    fi
    finalizeVSCode "~/Library/Application Support/Code/User/"
elif [[ "$OSTYPE" == "msys"* ]]; then
    choco install vscode -y
    finalizeVSCode "$APPDATA/Code/User/"
fi
