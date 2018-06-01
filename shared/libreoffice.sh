#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]] && [ ! -d "/Applications/LibreOffice.app" ]; then
    brew cask install --appdir="$MAC_APPS" libreoffice
elif [[ "$OSTYPE" == "msys"* ]]; then
    choco install libreoffice -y
fi
