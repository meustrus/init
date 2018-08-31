#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew-install python@2

source "$INIT_REPO/shared/lang/python.sh"
