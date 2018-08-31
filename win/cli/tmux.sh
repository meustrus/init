#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

printf "Skipping tmux on Windows\n"

# choco install tmux -y
# source "$INIT_REPO/shared/cli/tmux.sh"
