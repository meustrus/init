#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")}/vars.sh"

APPDATA="$HOME/.config" . "$INIT_REPO/shared/update.sh"
