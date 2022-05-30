#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/..}/vars.sh"

. "$INIT_REPO/shared/init.sh"

. `get-impl-path "gui/cmder.sh"`
. `get-impl-path "gui/rapidee.sh"`
