#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

choco install vscode -y
source source-impl "gui/vscode.sh"
