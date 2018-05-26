#!/bin/sh

if [ ! -d "/Applications/Dropbox.app" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew cask install --appdir="$MAC_APPS" dropbox
    fi
fi
