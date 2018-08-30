#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")" && pwd)} export INIT_REPO

while ! [ -f "$INIT_REPO/vars.sh" ]; do
    if [ "$INIT_REPO" == "/" ]; then
        printf 'ERROR: Could not find location of `init` repository\n' 1>&2
        exit 1
    fi
    INIT_REPO=`dirname "$INIT_REPO"` export INIT_REPO
done

INIT_FORUSER=${INIT_FORUSER:-ALL} export INIT_FORUSER
INIT_GUI=${INIT_GUI:-ON} export INIT_GUI
INIT_SSHCOPY=${INIT_SSHCOPY:-GITHUB} export INIT_SSHCOPY

if [ "$INIT_FORUSER" = "ROOT" ]; then
    if [ $(id -u) != 0 ]; then
        printf "You are trying to run \`init\` for \`INIT_FORUSER=ROOT\`, but you are not logged in as the root user.\n"
        printf "If you intend to configure the root user, run this script again as root.\n"
        printf "Otherwise, set \`INIT_FORUSER=ALL\` to install for all users or \`INIT_FORUSER=CURRENT\` to install for only the current user, then run this script again.\n"
        exit 1
    fi
    SUDO_USER= export SUDO_USER
elif [ $(id -u) = 0 ] && ( [ -z "$SUDO_USER" ] || ! id "$SUDO_USER" >/dev/null 2>&1 ) ; then
    printf "You are logged in as root, and there is no valid non-root \$SUDO_USER to fall back on.\n"
    printf "This script should not be run for root unless you intend to configure the root user.\n"
    printf "If you *do* intend to configure the root user, set \`INIT_FORUSER=ROOT\` and run this script again.\n"
    exit 1
fi

if [ -x "$(command -v git)" ]; then
    INIT_GITNAME=${INIT_GITNAME:-$(git config --global user.name)}
    INIT_GITNAME=${INIT_GITNAME:-$(id -un)}
    export INIT_GITNAME

    INIT_GITEMAIL=${INIT_GITEMAIL:-$(git config --global user.email)}
    [ -n "${INIT_GITEMAIL}" ] || read -p "Enter your new \`git config --global user.email\`: " INIT_GITEMAIL
    export INIT_GITEMAIL
fi

HOME=$(eval cd "~${SUDO_USER:-$USER}" && pwd) export HOME
BENCH=${BENCH:-$HOME/bench} export BENCH
