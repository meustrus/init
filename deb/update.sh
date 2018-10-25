#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")}/vars.sh"

APPDATA="$HOME/.config" . source-shared "update.sh"
