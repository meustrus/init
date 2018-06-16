#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/../.." && pwd)}
source "$INIT_REPO/shared/vars.sh"

${SUDO_USER:+sudo -u "$SUDO_USER"} mkdir -p "$BENCH/shellrc.d"
${SUDO_USER:+sudo -u "$SUDO_USER"} cp -f "$INIT_REPO/shared/config/initrc.sh" "$BENCH/shellrc.d/initrc.sh"

loadrc="for filename in \"$BENCH\"/shellrc.d/*.sh; do source \"\$filename\"; done"
sh "$INIT_REPO/shared/bin/append" "$loadrc" "$HOME/.profile"
sh "$INIT_REPO/shared/bin/append" "$loadrc" "$HOME/.bash_profile"
sh "$INIT_REPO/shared/bin/append" "$loadrc" "$HOME/.bashrc"
sh "$INIT_REPO/shared/bin/append" "$loadrc" "$HOME/.zprofile"
sh "$INIT_REPO/shared/bin/append" "$loadrc" "$HOME/.zshrc"
