#!/usr/bin/env bats
# shared/cli/shell.sh

load "$TEST_ROOT/lib/bats-support/load.bash"
load "$TEST_ROOT/lib/bats-assert/load.bash"

setup() {
  . "$TEST_ROOT/lib/setup.bats"
}
teardown() {
  . "$TEST_ROOT/lib/teardown.bats"
}

@test "shared/shell.sh installs shellrc.d directory" {
  run sh "$TEST_SRC/shared/cli/shell.sh"

  assert_success
  assert_output ''
  assert_equal \
    "$(cat "$BENCH/shellrc.d/initrc.sh")" \
    "$(cat "$TEST_SRC/shared/etc/initrc.sh")"

  expected_loadrc=$'\n\n'"for filename in \"$BENCH\"/shellrc.d/*.sh; do source \"\$filename\"; done"
  assert_equal "$(cat "$HOME/.profile")" "$expected_loadrc"
  assert_equal "$(cat "$HOME/.bash_profile")" "$expected_loadrc"
  assert_equal "$(cat "$HOME/.bashrc")" "$expected_loadrc"
  assert_equal "$(cat "$HOME/.zshenv")" "$expected_loadrc"
}

@test "shared/shell.sh multiple times installs shellrc.d directory only once" {
  run sh "$TEST_SRC/shared/cli/shell.sh"
  run sh "$TEST_SRC/shared/cli/shell.sh"

  assert_equal \
    "$(cat "$BENCH/shellrc.d/initrc.sh")" \
    "$(cat "$TEST_SRC/shared/etc/initrc.sh")"

  expected_loadrc=$'\n\n'"for filename in \"$BENCH\"/shellrc.d/*.sh; do source \"\$filename\"; done"
  assert_equal "$(cat "$HOME/.profile")" "$expected_loadrc"
  assert_equal "$(cat "$HOME/.bash_profile")" "$expected_loadrc"
  assert_equal "$(cat "$HOME/.bashrc")" "$expected_loadrc"
  assert_equal "$(cat "$HOME/.zshenv")" "$expected_loadrc"
}
