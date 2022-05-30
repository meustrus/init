#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew-install python@2

. "$INIT_REPO/shared/lang/python.sh"
