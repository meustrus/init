#!/bin/sh

if [ ! -d "/Applications/VLC.app" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew cask install --appdir="$MAC_APPS" vlc
    fi
fi
