#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew cask list firefox >/dev/null 2>&1 || brew cask install --appdir="$MAC_APPS" firefox
elif [[ "$OSTYPE" == "msys"* ]]; then
    choco install firefox -y
fi
