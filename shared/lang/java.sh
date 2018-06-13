#!/bin/sh

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    brew cask list java >/dev/null 2>&1 || brew cask install java
elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
    choco install jdk8 -y
fi
