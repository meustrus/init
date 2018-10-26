#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

apt-install emacs

. source-shared "cli/emacs.sh"
