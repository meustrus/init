#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew cask list sourcetree >/dev/null 2>&1 || brew cask install --appdir="$MAC_APPS" sourcetree
elif [[ "$OSTYPE" == "msys"* ]]; then
    choco install sourcetree -y
fi
