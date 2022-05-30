#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew-cask-install visual-studio-code
APPDATA="$HOME/Library/Application Support" . "$INIT_REPO/shared/gui/vscode.sh"
