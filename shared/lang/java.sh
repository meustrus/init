#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if [ -x "$(command -v java)" ]; then
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} mkdir -p "$BENCH/lib/maven/bin"
    install-var M2 "$BENCH/lib/maven"
    install-var M2_HOME "$BENCH/lib/maven/bin"
    install-var MAVEN_OPTS "-Xms1024m -Xmx2048m"
    install-path "$BENCH/lib/maven/bin"
else
    printf 'ERROR: Java not installed!\n' 1>&2
fi
