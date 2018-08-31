#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

choco install jdk8 -y
choco install maven -y

source "$INIT_REPO/shared/lang/java.sh"
