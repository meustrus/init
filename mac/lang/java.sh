#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew-install java
brew-cask-install maven

. source-shared "lang/java.sh"
