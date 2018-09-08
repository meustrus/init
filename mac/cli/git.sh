#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

source source-shared "cli/git.sh"

brew-install diff-so-fancy
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global pager.diff "diff-so-fancy | less --tabs=4 -RFX"
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global pager.show "diff-so-fancy | less --tabs=4 -RFX"
