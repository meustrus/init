#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

. "$INIT_REPO/shared/lang/nvm.sh"

brew-install nvm

. "$(brew --prefix nvm)/nvm.sh"

append "# NVM\n. \$(brew --prefix nvm)/nvm.sh" "$HOME/.profile"
append "# NVM\n. \$(brew --prefix nvm)/nvm.sh" "$HOME/.bash_profile"
append "# NVM\n. \$(brew --prefix nvm)/nvm.sh" "$HOME/.zshenv"
