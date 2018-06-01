#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]] && [ ! -d "/Applications/Sourcetree.app" ]; then
    brew cask install --appdir="$MAC_APPS" sourcetree
elif [[ "$OSTYPE" == "msys"* ]]; then
    choco install sourcetree -y
fi
