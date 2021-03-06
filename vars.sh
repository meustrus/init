#!/bin/sh

INIT_REPO=$(cd "${INIT_REPO:-$(dirname "$0")}" && pwd) export INIT_REPO

while ! [ -f "$INIT_REPO/vars.sh" ]; do
    if [ "$INIT_REPO" == "/" ]; then
        printf 'ERROR: Could not find location of `init` repository\n' 1>&2
        exit 1
    fi
    INIT_REPO=`dirname "$INIT_REPO"` export INIT_REPO
done

INIT_FORUSER=${INIT_FORUSER:-ALL} export INIT_FORUSER
INIT_SSHCOPY=${INIT_SSHCOPY:-GITHUB} export INIT_SSHCOPY

if [ "$INIT_FORUSER" = "ROOT" ]; then
    if [ "$(id -u)" != 0 ]; then
        printf "You are trying to run \`init\` for \`INIT_FORUSER=ROOT\`, but you are not logged in as the root user.\n"
        printf "If you intend to configure the root user, run this script again as root.\n"
        printf "Otherwise, set \`INIT_FORUSER=ALL\` to install for all users or \`INIT_FORUSER=CURRENT\` to install for only the current user, then run this script again.\n"
        exit 1
    fi
elif [ "$(id -u)" = 0 ]; then
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

if [ -z "$HOME" ]; then
    HOME=$(eval cd "~$USER" && pwd) export HOME
fi
BENCH=${BENCH:-$HOME/bench} export BENCH

case "$PATH" in
    *"$INIT_REPO/shared/bin/"*) ;;
    *)
        if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
            PATH="$INIT_REPO/mac/bin/:$INIT_REPO/shared/bin/:$PATH" export PATH
        elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
            PATH="$INIT_REPO/win/bin/:$INIT_REPO/shared/bin/:$PATH" export PATH
        elif [ -f "/etc/debian_version" ]; then
            PATH="$INIT_REPO/deb/bin/:$INIT_REPO/shared/bin/:$PATH" export PATH
        else
            PATH="$INIT_REPO/shared/bin/:$PATH" export PATH
        fi
        ;;
esac
