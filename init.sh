#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")}/vars.sh"

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    source "$INIT_REPO/mac/init.sh"
fi

source "$INIT_REPO/shared/extra.sh"
