#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

INIT_LANG_NVM=ON . source-impl "lang/nvm.sh"

install-var UV_THREADPOOL_SIZE "$UV_THREADPOOL_SIZE"

nvm install node
nvm install node --reinstall-packages-from=node
nvm use node
npm install -g grunt-cli
