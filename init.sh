#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")}/vars.sh"

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    source "$INIT_REPO/mac/init.sh"
elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
    source "$INIT_REPO/win/init.sh"
else
    source "$INIT_REPO/shared/init.sh"
fi
