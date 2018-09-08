#!/usr/bin/env bats

. "$TEST_ROOT/lib/bash_shell_mock/bin/shellmock"
skipIfNot "$BATS_TEST_DESCRIPTION"
shellmock_clean

export HOME=$TEST_ROOT/lib/temp/home
mkdir -p "$HOME"

export BENCH=$TEST_ROOT/lib/temp/bench
mkdir -p "$BENCH"

if [ "${BATS_TEST_NUMBER}" = 1 ]; then
    printf '# %s\n' "${BATS_TEST_FILENAME#`pwd`/}" >&3
fi

export OSTYPE=test
export INIT_GITEMAIL=expected@example.com
