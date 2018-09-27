#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

source source-shared "cli/git.sh"

git config --global core.autocrlf true
git config --global core.fscache true
