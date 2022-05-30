#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

apt-install tmux

. "$INIT_REPO/shared/cli/tmux.sh"
