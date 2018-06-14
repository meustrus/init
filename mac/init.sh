#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/.." && pwd)}
source "$INIT_REPO/shared/vars.sh"

MAC_APPS=${MAC_APPS:-$([ "$INIT_FORUSER" == "ALL" ] && printf '/Applications' || printf '~/Applications')}

if [ "x$INIT_FORUSER" = "xALL" ] && ! [ -x "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! [ -x "$(command -v brew)" ]; then
    if [ "x$INIT_FORUSER" = "xALL" ]; then
        printf "Failed to install Homebrew for all users; falling back to INIT_FORUSER=CURRENT\n"
        export INIT_FORUSER=CURRENT
    fi

    mkdir ~/homebrew
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ~/homebrew

    echo >> ~/.bash_profile
    echo "# Homebrew" >> ~/.bash_profile
    echo "export PATH=\"~/homebrew/bin:~/homebrew/sbin:\$PATH\"" >> ~/.bash_profile

    echo >> ~/.zprofile
    echo "# Homebrew" >> ~/.zprofile
    echo "export PATH=\"~/homebrew/bin:~/homebrew/sbin:\$PATH\"" >> ~/.zprofile
    
    source ~/.bash_profile
fi

brew update
brew tap caskroom/cask
