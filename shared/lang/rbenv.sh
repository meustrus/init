#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

RBENV_ROOT=${RBENV_ROOT:-$BENCH/lib/rbenv}
if ! test -d "$RBENV_ROOT"; then
    git clone https://github.com/rbenv/rbenv.git "$RBENV_ROOT"
fi

mkdir -p "$RBENV_ROOT/shims" "$RBENV_ROOT/versions"
. install-var RBENV_ROOT "$RBENV_ROOT"
. install-path "$RBENV_ROOT/bin"

install-env 'eval "`rbenv init -`"'

pushd "$RBENV_ROOT" >/dev/null 2>&1 && (
    ( src/configure && make -C src )
    popd >/dev/null 2>&1
)

mkdir -p "$RBENV_ROOT/plugins" "$RBENV_ROOT/cache"
if ! test -d "$RBENV_ROOT/plugins/ruby-build"; then
    git clone https://github.com/rbenv/ruby-build.git "$RBENV_ROOT/plugins/ruby-build"
fi

chmod -R 755 "$RBENV_ROOT"
