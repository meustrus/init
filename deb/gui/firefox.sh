#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if apt-exists firefox-esr; then
    apt-install firefox-esr
elif apt-exists firefox; then
    apt-install firefox
else
    printf 'ERROR: No debian package found for Firefox\n' 1>&2
fi
