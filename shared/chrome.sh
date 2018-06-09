#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew cask list google-chrome >/dev/null 2>&1 || brew cask install --appdir="$MAC_APPS" google-chrome
elif [[ "$OSTYPE" == "msys"* ]]; then
    choco install GoogleChrome -y
fi
