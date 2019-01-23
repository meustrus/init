#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

INIT_LANG_RBENV=ON . source-impl "lang/rbenv.sh"

RUBY_VERSION=`rbenv install -l | grep -v - | sort -V | tail -1`
rbenv install "$RUBY_VERSION"
rbenv global "$RUBY_VERSION"
rbenv rehash
