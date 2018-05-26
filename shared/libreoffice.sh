#!/bin/sh

if [ ! -d "/Applications/LibreOffice.app" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew cask install --appdir="$MAC_APPS" libreoffice
    fi
fi
