#!/bin/sh

if ! test -f /etc/apt/sources.list.d/docker.list; then
    apt-install apt-transport-https ca-certificates gnupg2 software-properties-common
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    sudo sh -c 'printf "deb [arch=amd64] https://download.docker.com/linux/debian `lsb_release -cs` stable\n" > /etc/apt/sources.list.d/docker.list'
    sudo apt update
fi

apt-install docker-ce docker-compose

sudo usermod -aG docker "$USER"
