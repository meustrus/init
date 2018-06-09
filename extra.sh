#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")" && pwd)}

BASHRC="$INIT_REPO/shared/home/.bashrc"

if ! [ -f ~/.zshrc ]  || grep -xq "$BASHRC" ~/.zshrc ; then
    echo >> ~/.zshrc
    echo source "$BASHRC" >> ~/.zshrc
fi
if ! [ -f ~/.bashrc ] || grep -xq "$BASHRC" ~/.bashrc ; then
    echo >> ~/.bashrc
    echo source "$BASHRC" >> ~/.bashrc
fi

source "$INIT_REPO/shared/git.sh"
source "$INIT_REPO/shared/my.sh"
source "$INIT_REPO/shared/ssh.sh"
source "$INIT_REPO/shared/python.sh"
source "$INIT_REPO/shared/powerline.sh"
source "$INIT_REPO/shared/tmux.sh"
# source "$INIT_REPO/shared/ohmyzsh.sh"
source "$INIT_REPO/shared/java.sh"
source "$INIT_REPO/shared/chrome.sh"
source "$INIT_REPO/shared/firefox.sh"
source "$INIT_REPO/shared/vlc.sh"
source "$INIT_REPO/shared/vscode.sh"
source "$INIT_REPO/shared/dropbox.sh"
source "$INIT_REPO/shared/libreoffice.sh"

if [[ "$OSTYPE" == "darwin"* ]]; then
    source "$INIT_REPO/mac/extra.sh"
elif [[ "$OSTYPE" == "msys"* ]]; then
    source "$INIT_REPO/win/extra.sh"    
fi
