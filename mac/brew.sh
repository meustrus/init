#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/..}/vars.sh"

if [ "$INIT_FORUSER" = "ALL" ] && ! [ -x "$(command -v brew)" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"

    loadbrew='eval "$(/opt/homebrew/bin/brew shellenv)"'
    append "$loadbrew" "$HOME/.profile"
    append "$loadbrew" "$HOME/.bash_profile"
    append "$loadbrew" "$HOME/.bashrc"
    append "$loadbrew" "$HOME/.zshenv"
fi

#if ! [ -x "$(command -v brew)" ]; then
#    if [ "$INIT_FORUSER" = "ALL" ]; then
#        printf "Failed to install Homebrew for all users; falling back to INIT_FORUSER=CURRENT\n"
#        INIT_FORUSER=CURRENT export INIT_FORUSER
#    fi
#
#    mkdir -p "$BENCH/homebrew"
#    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C "$BENCH/homebrew"
#
#    install-path "$BENCH/homebrew/bin" "$BENCH/homebrew/sbin"
#fi

brew update
brew tap homebrew/cask
brew tap homebrew/cask-versions

# sudo launchctl config user path "/usr/local/bin:$PATH"
