#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]] && [ ! -d "/Applications/Firefox.app" ]; then
    brew cask install --appdir="$MAC_APPS" firefox
elif [[ "$OSTYPE" == "msys"* ]]; then
    choco install firefox -y
fi
