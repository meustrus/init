#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

choco install emacs64 -y
mkdir -p "$HOME/.emacs.d/server"
takeown //f $(winpath "$HOME/.emacs.d/server")

. source-shared "cli/emacs.sh"