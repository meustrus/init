#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/..}/vars.sh"

source source-impl "bench.sh"

source source-impl "cli/shell.sh"
source source-impl "cli/git.sh"
source source-impl "cli/ssh.sh"
source source-impl "cli/tmux.sh"

source source-impl "lang/python.sh"
source source-impl "lang/java.sh"
source source-impl "lang/nodejs.sh"
source source-impl "lang/ruby.sh"

source source-impl "gui/multiclipboard.sh"
source source-impl "gui/chrome.sh"
source source-impl "gui/firefox.sh"
source source-impl "gui/vlc.sh"
source source-impl "gui/vscode.sh"
source source-impl "gui/sourcetree.sh"
source source-impl "gui/libreoffice.sh"
