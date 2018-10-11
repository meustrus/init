#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

choco install scala -y
choco install sbt -y

. source-shared "lang/scala.sh"
