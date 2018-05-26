#!/bin/sh

if [ ! -d "/Applications/Firefox.app" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew cask install --appdir="$MAC_APPS" firefox
    fi
fi
