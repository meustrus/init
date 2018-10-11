#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

RBENV_DIR=${RBENV_DIR:-$BENCH/lib/rbenv}
git clone https://github.com/rbenv/rbenv.git "$RBENV_DIR"
install-var RBENV_DIR "$RBENV_DIR"
install-path "$RBENV_DIR/bin" "$RBENV_DIR/shims"

pushd "$RBENV_DIR" && ( ( src/configure && make -C src ) ; popd )
"$RBENV_DIR/bin/rbenv" init

mkdir -p "$RBENV_DIR/plugins"
git clone https://github.com/rbenv/ruby-build.git "$RBENV_DIR/plugins/ruby-build"
