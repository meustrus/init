#!/bin/sh

if [ ! -d "/Applications/Sourcetree.app" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew cask install --appdir="$MAC_APPS" sourcetree
    fi
fi
