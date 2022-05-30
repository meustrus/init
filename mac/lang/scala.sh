#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew-install scala
brew-install sbt

. "$INIT_REPO/shared/lang/scala.sh"
