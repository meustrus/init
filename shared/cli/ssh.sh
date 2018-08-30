#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if [ ! -f "$HOME/.ssh/id_rsa" ]; then
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} ssh-keygen -t rsa -b 4096 -C "$INIT_GITEMAIL"
fi

if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} ssh-keygen -o -a 100 -t ed25519 -C "$INIT_GITEMAIL"
fi

sshcopy() {
    if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
        pbcopy < "$HOME/.ssh/$1.pub"
        printf "\n\nCopied public key to clipboard.\nAdd public key to %s now.\n" "$2"
        shift ; shift ; $*
        read -p "Press any key to continue..." -n 1 -s
        printf "\n\n"
    else
        printf "Skipping SSHCOPY to %s because this script has no implementation for OS '%s'." "$2" "$OSTYPE"
    fi
}

if printf '%s' "$INIT_SSHCOPY" | grep -q GITHUB 2>/dev/null; then
    sshcopy id_ed25519 GitHub open https://github.com/settings/keys
fi
