#!/bin/sh

INIT_REPO=${INIT_REPO:-$(cd "$(dirname "$0")/../.." && pwd)}

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    sh "$INIT_REPO/mac/bin/brew-install.sh" tmux
# elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
#     choco install tmux -y
fi

${SUDO_USER:+sudo -u "$SUDO_USER"} mkdir -p "$HOME/bench/ext"
pushd "$HOME/bench/ext" >/dev/null 2>&1
[ -d .tmux ] || ${SUDO_USER:+sudo -u "$SUDO_USER" env "PATH=$PATH"} git clone https://github.com/gpakosz/.tmux.git
${SUDO_USER:+sudo -u "$SUDO_USER"} ln -s -f "$HOME/bench/ext/.tmux/.tmux.conf" "$HOME/.tmux.conf"
${SUDO_USER:+sudo -u "$SUDO_USER"} cp "$HOME/bench/ext/.tmux/.tmux.conf.local" "$HOME/"
popd >/dev/null 2>&1

