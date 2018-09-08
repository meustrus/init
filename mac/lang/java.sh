#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew-install java
brew-cask-install maven

source source-shared "lang/java.sh"
