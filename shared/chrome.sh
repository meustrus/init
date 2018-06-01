#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]] && [ ! -d "/Applications/Google Chrome.app" ]; then
    brew cask install --appdir="$MAC_APPS" google-chrome
elif [[ "$OSTYPE" == "msys"* ]]; then
    choco install GoogleChrome -y
fi
