#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

INIT_CLI_NVM=ON source source-impl "lang/nvm.sh"


${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} nvm install node
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} nvm install node --reinstall-packages-from=node
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} nvm use node
