#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

choco install python2 -y --package-parameters="/InstallDir:$BENCH\\lib\\python2"

. "$INIT_REPO/shared/lang/python.sh"
