#!/bin/sh

INIT_REPO="${INIT_REPO:-$(dirname $0)/..}"

if [[ "$OSTYPE" == "darwin"* ]]; then
    if [ ! -d "/Applications/Visual Studio Code.app" ]; then
        brew cask install --appdir="$MAC_APPS" visual-studio-code
    fi
    pushd "$HOME/Library/Application Support/Code/User/"
fi

ln -s -f "$INIT_REPO/shared/vscode/settings.json" .
ln -s -f "$INIT_REPO/shared/vscode/keybindings.json" .

popd
