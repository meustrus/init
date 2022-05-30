#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/..}/vars.sh"

. `get-impl-path "brew.sh"`
. "$INIT_REPO/shared/init.sh"
. `get-impl-path "gui/caffeine.sh"`
