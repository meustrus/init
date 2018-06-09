#!/bin/sh

if ! [ -x "$(command -v brew)" ]; then
    mkdir ~/homebrew
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ~/homebrew
    MAC_APPS="~/Applications"

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
