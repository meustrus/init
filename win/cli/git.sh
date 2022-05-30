#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

. "$INIT_REPO/shared/cli/git.sh"

git config --global core.autocrlf input
git config --global core.fscache true
