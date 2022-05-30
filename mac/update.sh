#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")}/vars.sh"

APPDATA="$HOME/Library/Application Support" . "$INIT_REPO/shared/update.sh"
