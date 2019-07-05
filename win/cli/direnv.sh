#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

curl -L -o "$BENCH/bin/direnv" https://github.com/direnv/direnv/releases/download/v2.20.0/direnv.windows-amd64.exe
copy-impl "etc/direnv.sh" "$BENCH/shellrc.d/direnv.sh"
copy-impl "etc/direnv.bat" "$BENCH/shellrc.d/direnv.bat"
