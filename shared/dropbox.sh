#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew cask list dropbox >/dev/null 2>&1 || brew cask install --appdir="$MAC_APPS" dropbox
elif [[ "$OSTYPE" == "msys"* ]]; then
    choco install dropbox -y
fi
