#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/..}/vars.sh"

. `get-impl-path "bench.sh"`

. `get-impl-path "cli/shell.sh"`
. `get-impl-path "cli/direnv.sh"`
. `get-impl-path "cli/git.sh"`
. `get-impl-path "cli/ssh.sh"`
. `get-impl-path "cli/spacemacs.sh"`
. `get-impl-path "cli/tmux.sh"`

. `get-impl-path "lang/python.sh"`
. `get-impl-path "lang/java.sh"`
. `get-impl-path "lang/nodejs.sh"`
. `get-impl-path "lang/ruby.sh"`
. `get-impl-path "lang/scala.sh"`

. `get-impl-path "gui/multiclipboard.sh"`
. `get-impl-path "gui/chrome.sh"`
. `get-impl-path "gui/firefox.sh"`
. `get-impl-path "gui/vlc.sh"`
. `get-impl-path "gui/vscode.sh"`
. `get-impl-path "gui/smerge.sh"`
. `get-impl-path "gui/libreoffice.sh"`

. `get-impl-path "srv/syncthing.sh"`
