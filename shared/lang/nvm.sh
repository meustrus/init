#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

. install-var NVM_DIR "${NVM_DIR:-$BENCH/lib/nvm}"
mkdir -p "$NVM_DIR"
