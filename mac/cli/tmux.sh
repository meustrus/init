#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew-install tmux

source "$INIT_REPO/shared/cli/tmux.sh"
