#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install tmux
fi

mkdir -p ~/bench/ext
pushd ~/bench/ext
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf ~/
cp .tmux/.tmux.conf.local ~/
popd

