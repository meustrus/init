#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

apt-install python2.7 python-pip

. "$INIT_REPO/shared/lang/python.sh"
