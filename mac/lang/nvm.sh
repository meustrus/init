#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

source source-shared "lang/nvm.sh"

brew-install nvm

source $(brew --prefix nvm)/nvm.sh

append "# NVM\nsource \$(brew --prefix nvm)/nvm.sh" "$HOME/.profile"
append "# NVM\nsource \$(brew --prefix nvm)/nvm.sh" "$HOME/.bash_profile"
append "# NVM\nsource \$(brew --prefix nvm)/nvm.sh" "$HOME/.zshenv"
