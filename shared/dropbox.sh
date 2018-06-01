#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]] && [ ! -d "/Applications/Dropbox.app" ]; then
    brew cask install --appdir="$MAC_APPS" dropbox
elif [[ "$OSTYPE" == "msys"* ]]; then
    choco install dropbox -y
fi
