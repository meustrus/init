#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/.." && pwd)}
source "$INIT_REPO/shared/vars.sh"

if [ "x$INIT_FORUSER" = "xALL" ] && ! [ -x "$(command -v brew)" ]; then
    ${SUDO_USER:+sudo -u "$SUDO_USER"} /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! [ -x "$(command -v brew)" ]; then
    if [ "x$INIT_FORUSER" = "xALL" ]; then
        printf "Failed to install Homebrew for all users; falling back to INIT_FORUSER=CURRENT\n"
        export INIT_FORUSER=CURRENT
    fi

    mkdir "$HOME/homebrew"
    curl -L https://github.com/Homebrew/brew/tarball/master | ${SUDO_USER:+sudo -u "$SUDO_USER"} tar xz --strip 1 -C "$HOME/homebrew"

    export PATH="$HOME/homebrew/bin:$HOME/homebrew/sbin:$PATH"

    sh "$INIT_REPO/shared/bin/append" "# Homebrew\nexport PATH=\"$HOME/homebrew/bin:$HOME/homebrew/sbin:\$PATH\"" "$HOME/.profile"
    sh "$INIT_REPO/shared/bin/append" "# Homebrew\nexport PATH=\"$HOME/homebrew/bin:$HOME/homebrew/sbin:\$PATH\"" "$HOME/.bash_profile"
    sh "$INIT_REPO/shared/bin/append" "# Homebrew\nexport PATH=\"$HOME/homebrew/bin:$HOME/homebrew/sbin:\$PATH\"" "$HOME/.zprofile"
fi

${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} brew update
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} brew tap caskroom/cask
