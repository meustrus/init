#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

apt-install default-jdk
apt-install maven

. source-shared "lang/java.sh"
