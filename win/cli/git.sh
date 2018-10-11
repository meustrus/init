#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

. source-shared "cli/git.sh"

git config --global core.autocrlf true
git config --global core.fscache true
