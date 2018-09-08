#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

source source-shared "cli/shell.sh"

brew-install gawk
brew-install wget
