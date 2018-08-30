#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/..}/vars.sh"

if [ "x$INIT_FORUSER" = "xALL" ] && ! [ -x "$(command -v brew)" ]; then
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! [ -x "$(command -v brew)" ]; then
    if [ "x$INIT_FORUSER" = "xALL" ]; then
        printf "Failed to install Homebrew for all users; falling back to INIT_FORUSER=CURRENT\n"
        export INIT_FORUSER=CURRENT
    fi

    mkdir -p "$BENCH/homebrew"
    curl -L https://github.com/Homebrew/brew/tarball/master | ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} tar xz --strip 1 -C "$BENCH/homebrew"

    sh "$INIT_REPO/shared/bin/install-path" "$BENCH/homebrew/bin" "$BENCH/homebrew/sbin"
fi

${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} brew update
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} brew tap caskroom/cask
