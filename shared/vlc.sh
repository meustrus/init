#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]] && [ ! -d "/Applications/VLC.app" ]; then
    brew cask install --appdir="$MAC_APPS" vlc
elif [[ "$OSTYPE" == "msys"* ]]; then
    choco install vlc -y
fi
