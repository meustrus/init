#!/usr/bin/env bats

skipIfNot "$BATS_TEST_DESCRIPTION"
shellmock_clean

export HOME=$TEST_ROOT/lib/temp/home
mkdir -p "$HOME"

export BENCH=

export OSTYPE=test
export INIT_GITEMAIL=expected@example.com
