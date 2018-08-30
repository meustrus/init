#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/..}/vars.sh"

source "$INIT_REPO/shared/init.sh"

source source-impl "gui/cmder.sh"
source source-impl "gui/rapidee.sh"
