#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/..}/vars.sh"

install-var BENCH "$BENCH"
mkdir -p "$BENCH/apps" "$BENCH/bin" "$BENCH/ext" "$BENCH/lib" "$BENCH/repo" "$BENCH/usr"
install-path "$BENCH/bin"
