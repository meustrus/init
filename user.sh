#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")" && pwd)}

if [[ "$OSTYPE" == "darwin"* ]]; then
    source "$INIT_REPO/mac/user.sh"
fi

source "$INIT_REPO/extra.sh"