#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew-cask-install firefox
