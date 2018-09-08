#!/usr/bin/env bats

[ -z "$TEST_FUNCTION" ] && shellmock_clean
rm -rf "$TEST_ROOT/lib/temp"
