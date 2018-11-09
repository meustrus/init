#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/..}/vars.sh"

sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq upgrade
apt-install curl gawk

. source-shared "init.sh"
