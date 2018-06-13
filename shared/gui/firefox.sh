#!/bin/sh

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    brew cask list firefox >/dev/null 2>&1 || brew cask install --appdir="$MAC_APPS" firefox
elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
    choco install firefox -y
fi
