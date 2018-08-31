#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if [ -x "$(command -v pip)" ]; then
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} pip install --quiet --upgrade pip setuptools
else
    printf 'ERROR: Python not installed!\n' 1>&2
fi
