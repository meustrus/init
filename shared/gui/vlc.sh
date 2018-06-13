#!/bin/sh

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    brew cask list vlc >/dev/null 2>&1 || brew cask install --appdir="$MAC_APPS" vlc
elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
    choco install vlc -y
fi
