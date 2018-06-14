#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/../.." && pwd)}
source "$INIT_REPO/shared/vars.sh"

PREFIX=${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"}
ARGS=$([ "$INIT_FORUSER" != "ALL" ] && printf '--appdir="%s"' "$HOME/Applications")
$PREFIX brew cask list "$1" >/dev/null 2>&1 || $PREFIX brew cask install $ARGS "$1"
