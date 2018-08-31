#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

RBENV_DIR=${RBENV_DIR:-$BENCH/lib/rbenv}
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git clone https://github.com/nak1114/rbenv-win.git "$RBENV_DIR"
install-var RBENV_DIR "$RBENV_DIR"
install-path "$RBENV_DIR/bin" "$RBENV_DIR/shims"
