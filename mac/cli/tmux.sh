#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew-install tmux

source source-shared "cli/tmux.sh"
