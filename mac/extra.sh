#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/.." && pwd)}

sh "$INIT_REPO/mac/bin/brew-install.sh" gawk
sh "$INIT_REPO/mac/bin/brew-install.sh" wget

if [ "x$INIT_GUI" = "xON" ]; then
    sh "$INIT_REPO/mac/bin/brew-cask-install.sh" caffeine
    sh "$INIT_REPO/mac/bin/brew-cask-install.sh" flycut
fi

# Terminal > Preferences... > (Profile) > Advanced, "Declare terminal as:" xterm-256color
