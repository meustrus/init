#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/..}/vars.sh"

. source-impl "bench.sh"

. source-impl "cli/shell.sh"
. source-impl "cli/git.sh"
. source-impl "cli/ssh.sh"
. source-impl "cli/tmux.sh"

. source-impl "lang/python.sh"
. source-impl "lang/java.sh"
. source-impl "lang/nodejs.sh"
. source-impl "lang/ruby.sh"
. source-impl "lang/scala.sh"

. source-impl "gui/multiclipboard.sh"
. source-impl "gui/chrome.sh"
. source-impl "gui/firefox.sh"
. source-impl "gui/vlc.sh"
. source-impl "gui/vscode.sh"
. source-impl "gui/sourcetree.sh"
. source-impl "gui/libreoffice.sh"
