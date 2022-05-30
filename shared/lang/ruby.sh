#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

INIT_LANG_RBENV=ON . `get-impl-path "lang/rbenv.sh"`

RUBY_VERSION=`rbenv install -l | grep -v - | sort -V | tail -1 | tr -d '[:space:]'`
if ! rbenv versions | grep -q "$RUBY_VERSION"; then
    rbenv install "$RUBY_VERSION"
    rbenv global "$RUBY_VERSION"
    rbenv rehash
fi
