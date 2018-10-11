#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew-install tmux

. source-shared "cli/tmux.sh"
