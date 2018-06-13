#!/bin/sh

if [ ! -f "$HOME/.ssh/id_rsa" ]; then
    ssh-keygen -t rsa -b 4096 -C "$(git config user.email)"
fi

if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
    ssh-keygen -o -a 100 -t ed25519 -C "$(git config user.email)"
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    pbcopy < "$HOME/.ssh/id_ed25519.pub"

    echo
    echo "Copied public key to clipboard."
    echo "Add public key to Github now."

    open https://github.com/settings/keys

    read -p "Press any key to continue..." -n 1 -s
    echo
    echo
fi
