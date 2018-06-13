#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")" && pwd)}

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    source "$INIT_REPO/mac/init.sh"
fi

source "$INIT_REPO/shared/extra.sh"
