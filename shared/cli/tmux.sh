#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if [ -x "$(command -v tmux)" ]; then
    pushd "$BENCH/lib" >/dev/null 2>&1
    [ -d .tmux ] || ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git clone https://github.com/gpakosz/.tmux.git
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} ln -s -f "$BENCH/lib/.tmux/.tmux.conf" "$HOME/.tmux.conf"
    ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} cp "$BENCH/lib/.tmux/.tmux.conf.local" "$HOME/"
    popd >/dev/null 2>&1
else
    printf 'ERROR: tmux not installed!\n' 1>&2
fi
