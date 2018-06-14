#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")" && pwd)}
INIT_FORUSER=${INIT_FORUSER:-ALL}
INIT_GUI=${INIT_GUI:-ON}
INIT_SSHCOPY=${INIT_SSHCOPY:-GITHUB}

if [ "x$INIT_FORUSER" = "xROOT" ]; then
    if [ $(id -u) != 0 ]; then
        printf "You are trying to run \`init\` for \`INIT_FORUSER=ROOT\`, but you are not logged in as the root user.\n"
        printf "If you intend to configure the root user, run this script again as root.\n"
        printf "Otherwise, set \`INIT_FORUSER=ALL\` to install for all users or \`INIT_FORUSER=CURRENT\` to install for only the current user, then run this script again.\n"
        exit 1
    fi
    SUDO_USER=
elif [ $(id -u) = 0 ] && ( [ -z "$SUDO_USER" ] || ! id "$SUDO_USER" >/dev/null 2>&1 ) ; then
    printf "You are logged in as root, and there is no valid non-root \$SUDO_USER to fall back on.\n"
    printf "This script should not be run for root unless you intend to configure the root user.\n"
    printf "If you *do* intend to configure the root user, set \`INIT_FORUSER=ROOT\` and run this script again.\n"
    exit 1
fi

if [ -x "$(command -v git)" ]; then
    INIT_GITNAME=${INIT_GITNAME:-$(git config user.name)}
    INIT_GITNAME=${INIT_GITNAME:-$(id -un)}

    INIT_GITEMAIL=${INIT_GITEMAIL:-$(git config user.email)}
    [ -n "${INIT_GITEMAIL}" ] || read -p "Enter your new \`git config user.email\`: " INIT_GITEMAIL
fi

HOME=$(eval cd "~${SUDO_USER:-$USER}" && pwd)
BENCH=${BENCH:-$HOME/bench}
