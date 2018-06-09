#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew cask list vlc >/dev/null 2>&1 || brew cask install --appdir="$MAC_APPS" vlc
elif [[ "$OSTYPE" == "msys"* ]]; then
    choco install vlc -y
fi
