#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

choco install scala -y
choco install sbt -y

source "$INIT_REPO/shared/lang/scala.sh"
