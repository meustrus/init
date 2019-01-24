#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

. source-shared "lang/nvm.sh"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

. "$NVM_DIR/nvm.sh"
