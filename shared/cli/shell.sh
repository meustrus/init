#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} mkdir -p "$BENCH/shellrc.d"
copy-impl "etc/initrc.sh" "$BENCH/shellrc.d/initrc.sh"

loadrc="for filename in \"$BENCH\"/shellrc.d/*.sh; do source \"\$filename\"; done"
append "$loadrc" "$HOME/.profile"
append "$loadrc" "$HOME/.bash_profile"
append "$loadrc" "$HOME/.bashrc"
append "$loadrc" "$HOME/.zshenv"
