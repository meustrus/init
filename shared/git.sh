#!/bin/sh

INIT_REPO="${INIT_REPO:-$(dirname $0)/..}"

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install diff-so-fancy
fi

cp -f "$INIT_REPO/shared/home/.gitconfig" ~/.gitconfig
cp -f "$INIT_REPO/shared/home/.gitignore-global" ~/.gitignore-global
