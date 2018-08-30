#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/..}/vars.sh"

brew-install gawk
brew-install wget

if [ "x$INIT_GUI" = "xON" ]; then
    brew-cask-install caffeine
    brew-cask-install flycut
fi

# Terminal > Preferences... > (Profile) > Advanced, "Declare terminal as:" xterm-256color
