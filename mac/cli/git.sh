#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

. source-shared "cli/git.sh"

brew-install diff-so-fancy
git config --global pager.diff "diff-so-fancy | less --tabs=4 -RFX"
git config --global pager.show "diff-so-fancy | less --tabs=4 -RFX"
