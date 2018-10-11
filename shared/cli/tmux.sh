#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if [ -x "$(command -v tmux)" ]; then
    pushd "$BENCH/lib" >/dev/null 2>&1
    [ -d .tmux ] || git clone https://github.com/gpakosz/.tmux.git
    ln -s -f "$BENCH/lib/.tmux/.tmux.conf" "$HOME/.tmux.conf"
    cp "$BENCH/lib/.tmux/.tmux.conf.local" "$HOME/"
    popd >/dev/null 2>&1
else
    printf 'ERROR: tmux not installed!\n' 1>&2
fi
