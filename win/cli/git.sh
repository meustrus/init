#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

source "$INIT_REPO/shared/cli/git.sh"

${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global core.autocrlf true
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git config --global core.fscache true
