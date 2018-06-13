#!/bin/sh

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    brew cask list google-chrome >/dev/null 2>&1 || brew cask install --appdir="$MAC_APPS" google-chrome
elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
    choco install GoogleChrome -y
fi
