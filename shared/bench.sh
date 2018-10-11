#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/..}/vars.sh"

mkdir -p "$BENCH/bin" "$BENCH/ext" "$BENCH/lib" "$BENCH/repo" "$BENCH/usr"
install-path "$BENCH/bin"
