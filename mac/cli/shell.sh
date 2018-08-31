#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

source "$INIT_REPO/shared/cli/shell.sh"

brew-install gawk
brew-install wget
