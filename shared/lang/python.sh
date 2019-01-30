#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if [ -x "$(command -v pip)" ]; then
    pip install --quiet --upgrade setuptools pipenv
else
    printf 'ERROR: Python not installed!\n' 1>&2
fi
