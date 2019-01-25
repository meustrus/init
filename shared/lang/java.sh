#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

install-var MAVEN_OPTS "-Xms1024m -Xmx2048m"
