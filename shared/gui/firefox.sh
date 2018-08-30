#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    brew-cask-install firefox
elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
    choco install firefox -y
fi
