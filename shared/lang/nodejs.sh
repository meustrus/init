#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

INIT_LANG_NVM=ON . source-impl "lang/nvm.sh"

nvm install node --reinstall-packages-from=node
nvm use node
