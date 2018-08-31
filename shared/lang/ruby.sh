#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

INIT_CLI_RBENV=ON source source-impl "lang/rbenv.sh"

rbenv install
rbenv global
rbenv rehash
