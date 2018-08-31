#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew-install scala
brew-install sbt

source "$INIT_REPO/shared/lang/scala.sh"
