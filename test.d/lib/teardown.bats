#!/usr/bin/env bats

[ -n "$TEST_FUNCTION" ] || shellmock_clean
rm -rf "$TEST_ROOT/lib/temp"
