#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

source source-shared "cli/ssh.sh"

if printf '%s' "$INIT_SSHCOPY" | grep -q GITHUB 2>/dev/null; then
    pbcopy < "$HOME/.ssh/id_ed25519.pub"
    printf "\n\nCopied public key to clipboard.\nAdd public key to GitHub now.\n"
    open "https://github.com/settings/keys"
    read -p "Press any key to continue..." -n 1 -s
    printf "\n\n"
}
