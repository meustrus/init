#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

printf "Skipping tmux on Windows\n"

# choco install tmux -y
# . "$INIT_REPO/shared/cli/tmux.sh"
