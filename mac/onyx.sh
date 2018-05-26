#!/bin/sh

if [ ! -d "~/Applications/Onyx.app" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew cask install --appdir="~/Applications" onyx
    fi
fi
