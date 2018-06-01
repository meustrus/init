#!/bin/sh

if [ ! -x "$(command -v tmux)" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install tmux
    # elif [[ "$OSTYPE" == "msys"* ]]; then
    #     choco install tmux -y
    fi
fi

mkdir -p ~/bench/ext
pushd ~/bench/ext
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf ~/
cp .tmux/.tmux.conf.local ~/
popd

