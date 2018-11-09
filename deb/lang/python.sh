#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

apt-install python2.7 python-pip

. source-shared "lang/python.sh"
