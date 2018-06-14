#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/../.." && pwd)}

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    sh "$INIT_REPO/mac/bin/brew-cask-install.sh" java
elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
    choco install jdk8 -y
fi
