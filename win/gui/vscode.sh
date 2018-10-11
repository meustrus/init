#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

choco install vscode -y
. source-impl "gui/vscode.sh"
