#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew-cask-install visual-studio-code
APPDATA="$HOME/Library/Application Support" . source-shared "gui/vscode.sh"
