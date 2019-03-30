#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew-cask-install java8
brew-cask-install maven

. source-shared "lang/java.sh"
