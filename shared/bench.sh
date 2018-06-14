#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/.." && pwd)}
source "$INIT_REPO/shared/vars.sh"

mkdir -p "$BENCH/ext"
mkdir -p "$BENCH/lib"
mkdir -p "$BENCH/repo"
mkdir -p "$BENCH/usr"

sh "$INIT_REPO/shared/bin/append" "export PATH=\"$BENCH:\$PATH\"" "$HOME/.profile"
sh "$INIT_REPO/shared/bin/append" "export PATH=\"$BENCH:\$PATH\"" "$HOME/.bash_profile"
sh "$INIT_REPO/shared/bin/append" "export PATH=\"$BENCH:\$PATH\"" "$HOME/.zprofile"
