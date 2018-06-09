#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")" && pwd)}

BASHRC="$INIT_REPO/shared/home/.bashrc"

if ! [ -f ~/.zshrc ] || ! grep -x "source \"$BASHRC\"" ~/.zshrc >/dev/null 2>&1 ; then
    echo >> ~/.zshrc
    echo source \"$BASHRC\" >> ~/.zshrc
fi
if ! [ -f ~/.zprofile ] || ! grep -x "source \"$BASHRC\"" ~/.zprofile >/dev/null 2>&1 ; then
    echo >> ~/.zprofile
    echo source \"$BASHRC\" >> ~/.zprofile
fi
if ! [ -f ~/.bashrc ] || ! grep -x "source \"$BASHRC\"" ~/.bashrc >/dev/null 2>&1 ; then
    echo >> ~/.bashrc
    echo source \"$BASHRC\" >> ~/.bashrc
fi
if ! [ -f ~/.bash_profile ] || ! grep -x "source \"$BASHRC\"" ~/.bash_profile >/dev/null 2>&1 ; then
    echo >> ~/.bash_profile
    echo source \"$BASHRC\" >> ~/.bash_profile
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
source "$INIT_REPO/shared/sourcetree.sh"
source "$INIT_REPO/shared/dropbox.sh"
source "$INIT_REPO/shared/libreoffice.sh"

if [[ "$OSTYPE" == "darwin"* ]]; then
    source "$INIT_REPO/mac/extra.sh"
elif [[ "$OSTYPE" == "msys"* ]]; then
    source "$INIT_REPO/win/extra.sh"    
fi
