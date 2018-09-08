#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

printf "Skipping tmux on Windows\n"

# choco install tmux -y
# source source-shared "cli/tmux.sh"
