#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")}/vars.sh"

APPDATA="$HOME/Library/Application Support" . source-shared "update.sh"
