#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

INIT_LANG_NVM=ON . `get-impl-path "lang/nvm.sh"`

nvm install latest
nvm use $(nvm list | sed -n -e 's/^[^0-9]*\([0-9]\+\.[0-9]\+\.[0-9]\+\).*$/\1/p' | head -n1)
