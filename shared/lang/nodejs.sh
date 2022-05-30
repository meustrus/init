#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

INIT_LANG_NVM=ON . `get-impl-path "lang/nvm.sh"`

nvm install node --reinstall-packages-from=node
nvm use node
