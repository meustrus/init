#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/..}/vars.sh"

source source-shared "init.sh"

source source-impl "gui/cmder.sh"
source source-impl "gui/rapidee.sh"
