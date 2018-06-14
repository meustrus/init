#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/../.." && pwd)}

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    sh "$INIT_REPO/mac/bin/brew-install.sh" python@2
elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
    choco install python2 -y
    call refreshenv
fi

${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} pip install --quiet --upgrade pip setuptools
