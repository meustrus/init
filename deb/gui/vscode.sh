#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if ! test -f /etc/apt/sources.list.d/vscode.list; then
    apt-install gnupg apt-transport-https
    sudo sh -c 'curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg'
    sudo sh -c 'printf "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main\n" > /etc/apt/sources.list.d/vscode.list'
    sudo apt update
fi

apt-install libgl1-mesa-glx libasound2 libgtk2.0-0 libxss1 code

APPDATA="$HOME/.config" . source-shared "gui/vscode.sh"
