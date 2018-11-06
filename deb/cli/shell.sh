#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

. source-shared "cli/shell.sh"

apt-install jq
