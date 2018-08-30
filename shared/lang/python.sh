#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    brew-install python@2
elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
    choco install python2 -y
fi

${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} pip install --quiet --upgrade pip setuptools
