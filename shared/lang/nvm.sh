#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

NVM_DIR=${NVM_DIR:-$BENCH/lib/.nvm}
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} mkdir -p "$NVM_DIR"
install-var NVM_DIR "$NVM_DIR"
