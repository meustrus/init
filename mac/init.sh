#!/bin/sh

INIT_REPO="${INIT_REPO:-$(dirname $0)/..}"
MAC_APPS="${MAC_APPS:-/Applications}"

if ! [ -x "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

source "$INIT_REPO/mac/brew.sh"
