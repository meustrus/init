#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew cask list libreoffice >/dev/null 2>&1 || brew cask install --appdir="$MAC_APPS" libreoffice
elif [[ "$OSTYPE" == "msys"* ]]; then
    choco install libreoffice -y
fi
