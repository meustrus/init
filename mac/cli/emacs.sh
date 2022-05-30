#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew tap d12frosted/emacs-plus
brew-install emacs-plus --HEAD --with-natural-title-bars
brew-linkapp /usr/local/opt/emacs-plus/Emacs.app

. "$INIT_REPO/shared/cli/emacs.sh"
