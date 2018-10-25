#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

INIT_LANG_RBENV=ON . source-impl "lang/rbenv.sh"

rbenv install
rbenv global
rbenv rehash
