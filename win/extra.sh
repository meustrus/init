#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/..}/vars.sh"

if [ "x$INIT_GUI" = "xON" ]; then
    choco install cmder -y
    choco install rapidee -y --package-parameters="NoShortcut"
    choco install clcl.portable -y
fi
