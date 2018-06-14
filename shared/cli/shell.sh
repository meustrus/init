#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/../.." && pwd)}

BASHRC="$INIT_REPO/shared/home/.bashrc"

sh "$INIT_REPO/shared/bin/append" "source \"$BASHRC\"" "$HOME/.profile"
sh "$INIT_REPO/shared/bin/append" "source \"$BASHRC\"" "$HOME/.bash_profile"
sh "$INIT_REPO/shared/bin/append" "source \"$BASHRC\"" "$HOME/.bashrc"
sh "$INIT_REPO/shared/bin/append" "source \"$BASHRC\"" "$HOME/.zprofile"
sh "$INIT_REPO/shared/bin/append" "source \"$BASHRC\"" "$HOME/.zshrc"
