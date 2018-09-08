#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

brew-install scala
brew-install sbt

source source-shared "lang/scala.sh"
