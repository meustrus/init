#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew-cask-install visual-studio-code
APPDATA="$HOME/Library/Application Support" source source-shared "gui/vscode.sh"
