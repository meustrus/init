#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

choco install emacs64 -y
mkdir -p "$HOME/.emacs.d/server"
takeown //f $(cygpath --windows "$HOME/.emacs.d/server")

. "$INIT_REPO/shared/cli/emacs.sh"
