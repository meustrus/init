#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/..}/vars.sh"

source "$INIT_REPO/mac/brew.sh"
source "$INIT_REPO/shared/init.sh"

if [ "$INIT_GUI" = "ON" ]; then
    source "$INIT_REPO/mac/gui/caffeine.sh"
    source "$INIT_REPO/mac/gui/multiclipboard.sh"
fi
