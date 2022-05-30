#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew-install tmux

. "$INIT_REPO/shared/cli/tmux.sh"
