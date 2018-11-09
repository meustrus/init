#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if apt-exists chromium-browser; then
    apt-install chromium-browser
elif apt-exists chromium; then
    apt-install chromium chromium-l10n
else
    printf 'ERROR: No debian package found for Chromium\n' 1>&2
fi
