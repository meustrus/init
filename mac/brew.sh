#!/bin/sh

if ! [ -x "$(command -v brew)" ]; then
    mkdir ~/homebrew
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ~/homebrew
    MAC_APPS="~/Applications"
    echo "# Homebrew" >> ~/.bash_profile
    echo "export PATH=\"~/homebrew/bin:~/homebrew/sbin:\$PATH\"" >> ~/.bash_profile
    source ~/.bash_profile
fi

brew update
brew tap caskroom/cask
