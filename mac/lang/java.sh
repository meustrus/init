#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew-install java
brew-cask-install maven

source "$INIT_REPO/shared/lang/java.sh"
