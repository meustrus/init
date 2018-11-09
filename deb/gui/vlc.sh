#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if ! test -f /etc/apt/sources.list.d/sublime-text.list; then
    wget -qO - http://download.videolan.org/pub/debian/videolan-apt.asc | sudo apt-key add -
    printf 'deb http://download.videolan.org/pub/debian/stable/ /\ndeb-src http://download.videolan.org/pub/debian/stable/ /\n' \
        | sudo tee /etc/apt/sources.list.d/vlc.list >/dev/null
    sudo apt update
fi

apt-install vlc libdvdcss
