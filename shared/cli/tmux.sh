#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew list tmux >/dev/null 2>&1 || brew install tmux
# elif [[ "$OSTYPE" == "msys"* ]]; then
#     choco install tmux -y
fi

mkdir -p ~/bench/ext
pushd ~/bench/ext >/dev/null 2>&1
[ -d .tmux ] || git clone https://github.com/gpakosz/.tmux.git
ln -s -f ~/bench/ext/.tmux/.tmux.conf ~/.tmux.conf
cp ~/bench/ext/.tmux/.tmux.conf.local ~/
popd >/dev/null 2>&1

