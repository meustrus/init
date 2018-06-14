#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/../.." && pwd)}
source "$INIT_REPO/shared/vars.sh"

${SUDO_USER:+sudo -u "$SUDO_USER"} cp -f "$INIT_REPO/shared/config/.initrc" "$BENCH/.initrc"

sh "$INIT_REPO/shared/bin/append" "source \"$BENCH/.initrc\"" "$HOME/.profile"
sh "$INIT_REPO/shared/bin/append" "source \"$BENCH/.initrc\"" "$HOME/.bash_profile"
sh "$INIT_REPO/shared/bin/append" "source \"$BENCH/.initrc\"" "$HOME/.bashrc"
sh "$INIT_REPO/shared/bin/append" "source \"$BENCH/.initrc\"" "$HOME/.zprofile"
sh "$INIT_REPO/shared/bin/append" "source \"$BENCH/.initrc\"" "$HOME/.zshrc"
