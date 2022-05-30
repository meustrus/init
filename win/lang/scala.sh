#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

choco install sbt -y

. refreshenv
. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"
. "$INIT_REPO/shared/lang/scala.sh"
