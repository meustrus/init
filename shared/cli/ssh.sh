#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if [ ! -f "$HOME/.ssh/id_rsa" ]; then
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} ssh-keygen -t rsa -b 4096 -C "$INIT_GITEMAIL"
fi

if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} ssh-keygen -o -a 100 -t ed25519 -C "$INIT_GITEMAIL"
fi
