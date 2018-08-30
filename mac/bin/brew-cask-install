#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

PREFIX=${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"}
ARGS=$([ "$INIT_FORUSER" != "ALL" ] && printf '--appdir="%s"' "$HOME/Applications")
$PREFIX brew cask list "$1" >/dev/null 2>&1 || $PREFIX brew cask install $ARGS "$1"
