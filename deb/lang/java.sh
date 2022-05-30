#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

apt-install default-jdk
apt-install maven

. "$INIT_REPO/shared/lang/java.sh"
