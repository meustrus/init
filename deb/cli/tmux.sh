#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

sudo apt install tmux

. source-shared "cli/tmux.sh"
