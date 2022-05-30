#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

apt-install emacs

. "$INIT_REPO/shared/cli/emacs.sh"
