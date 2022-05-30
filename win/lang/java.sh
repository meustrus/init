#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

choco install jdk8 -y
choco install maven -y

. "$INIT_REPO/shared/lang/java.sh"
