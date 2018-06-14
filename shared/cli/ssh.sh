#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")" && pwd)}
source "$INIT_REPO/shared/vars.sh"

if [ ! -f "$HOME/.ssh/id_rsa" ]; then
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} ssh-keygen -t rsa -b 4096 -C "$INIT_GITEMAIL"
fi

if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} ssh-keygen -o -a 100 -t ed25519 -C "$INIT_GITEMAIL"
fi

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    pbcopy < "$HOME/.ssh/id_ed25519.pub"

    echo
    echo "Copied public key to clipboard."
    echo "Add public key to Github now."

    open https://github.com/settings/keys

    read -p "Press any key to continue..." -n 1 -s
    echo
    echo
fi
