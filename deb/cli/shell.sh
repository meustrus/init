#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

. "$INIT_REPO/shared/cli/shell.sh"

apt-install jq
