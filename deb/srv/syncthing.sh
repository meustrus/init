#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if ! test -f /etc/apt/sources.list.d/syncthing.list; then
    apt-install gnupg apt-transport-https
    curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
    echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
    sudo apt-get update
fi

apt-install syncthing
