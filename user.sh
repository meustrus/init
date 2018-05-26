#!/bin/sh

INIT_REPO="${INIT_REPO:-$(dirname $0)}"

if [[ "$OSTYPE" == "darwin"* ]]; then
    source "$INIT_REPO/mac/user.sh"
fi

source "$INIT_REPO/extra.sh"
