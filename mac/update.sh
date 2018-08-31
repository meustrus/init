#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")}/vars.sh"

APPDATA="$HOME/Library/Application Support" source "$INIT_REPO/shared/update.sh"
