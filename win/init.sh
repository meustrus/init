#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/..}/vars.sh"

. source-shared "init.sh"

. source-impl "gui/cmder.sh"
. source-impl "gui/rapidee.sh"
