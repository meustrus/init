#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

. source-shared "cli/shell.sh"

brew-install gawk
brew-install wget
brew-install jq
