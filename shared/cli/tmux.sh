#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    brew-install tmux
# elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
#     choco install tmux -y
fi

${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} mkdir -p "$BENCH/lib"
pushd "$BENCH/lib" >/dev/null 2>&1
[ -d .tmux ] || ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git clone https://github.com/gpakosz/.tmux.git
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} ln -s -f "$BENCH/lib/.tmux/.tmux.conf" "$HOME/.tmux.conf"
${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} cp "$BENCH/lib/.tmux/.tmux.conf.local" "$HOME/"
popd >/dev/null 2>&1

