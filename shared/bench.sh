#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/..}/vars.sh"

mkdir -p "$BENCH/apps" "$BENCH/bin" "$BENCH/ext" "$BENCH/lib" "$BENCH/repo" "$BENCH/usr"
install-var BENCH "$BENCH"
install-path "$BENCH/bin"
