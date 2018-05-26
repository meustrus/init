#!/bin/sh

if [ ! -d "/Applications/Google Chrome.app" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew cask install --appdir="$MAC_APPS" google-chrome
    fi
fi
