#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

. install-var MAVEN_OPTS "-Xms1024m -Xmx2048m"

mkdir -p "$BENCH/lib/gradle"
. install-var GRADLE_USER_HOME "$BENCH/lib/gradle"
