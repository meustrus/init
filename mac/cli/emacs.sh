#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew tap d12frosted/emacs-plus
brew-install emacs-plus --HEAD --with-natural-title-bars
brew linkapps emacs-plus

. source-shared "cli/emacs.sh"
