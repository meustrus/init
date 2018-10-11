#!/usr/bin/env bats
# shared/cli/shell.sh

load "$TEST_ROOT/lib/bats-support/load.bash"
load "$TEST_ROOT/lib/bats-assert/load.bash"
export PATH="\$TEST_ROOT/lib/bash_shell_mock/bin:\$PATH"
. shellmock

setup() {
  . "$TEST_ROOT/lib/setup.bats"
}
teardown() {
  . "$TEST_ROOT/lib/teardown.bats"
}

@test 'shared/shell.sh installs shellrc.d directory' {
  run sh "$TEST_SRC/shared/cli/shell.sh"

  assert_success
  assert_output ''
  assert_equal \
    "$(cat "$HOME/bench/shellrc.d/initrc.sh")" \
    "$(cat "$TEST_SRC/shared/etc/initrc.sh")"

  expected_loadrc=$'\n\n'"for filename in \"$HOME/bench\"/shellrc.d/*.sh; do . \"\$filename\"; done"
  assert_equal "$(cat "$HOME/.profile")" "$expected_loadrc"
  assert_equal "$(cat "$HOME/.bash_profile")" "$expected_loadrc"
  assert_equal "$(cat "$HOME/.bashrc")" "$expected_loadrc"
  assert_equal "$(cat "$HOME/.zshenv")" "$expected_loadrc"
}

@test 'shared/shell.sh multiple times installs shellrc.d directory only once' {
  run sh "$TEST_SRC/shared/cli/shell.sh"
  run sh "$TEST_SRC/shared/cli/shell.sh"

  assert_success
  assert_output ''
  assert_equal \
    "$(cat "$HOME/bench/shellrc.d/initrc.sh")" \
    "$(cat "$TEST_SRC/shared/etc/initrc.sh")"

  expected_loadrc=$'\n\n'"for filename in \"$HOME/bench\"/shellrc.d/*.sh; do . \"\$filename\"; done"
  assert_equal "$(cat "$HOME/.profile")" "$expected_loadrc"
  assert_equal "$(cat "$HOME/.bash_profile")" "$expected_loadrc"
  assert_equal "$(cat "$HOME/.bashrc")" "$expected_loadrc"
  assert_equal "$(cat "$HOME/.zshenv")" "$expected_loadrc"
}

@test 'shellmock forwarding' {
  TEST_BIN=$BATS_TEST_DIRNAME/testbin
  mkdir -p "$TEST_BIN"
  cd "$TEST_BIN"

  export PATH="$PATH:$TEST_ROOT/lib/temp"
  touch "$TEST_ROOT/lib/temp/pri"
  printf '#!/bin/sh\n' > "$TEST_ROOT/lib/temp/pri"
  printf 'echo "# $*"\n' >> "$TEST_ROOT/lib/temp/pri"
  chmod a+x "$TEST_ROOT/lib/temp/pri"

  [ -f "$TEST_ROOT/lib/temp/pri" ]

  printf '#!/bin/sh\n' > "$TEST_ROOT/lib/temp/tested"
  printf 'pri line1\n' >> "$TEST_ROOT/lib/temp/tested"
  printf 'pri line2\n' >> "$TEST_ROOT/lib/temp/tested"
  printf 'pri line3\n' >> "$TEST_ROOT/lib/temp/tested"
  chmod a+x "$TEST_ROOT/lib/temp/tested"

  shellmock_expect pri --match "line2" --output "mocked"
  shellmock_expect pri --type partial --exec "eval '$TEST_ROOT/lib/temp/pri' {}"

  run sh "$TEST_ROOT/lib/temp/tested"

  assert_output $'# line1\nmocked\n# line3'
}
