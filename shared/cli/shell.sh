#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/../.." && pwd)}

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
