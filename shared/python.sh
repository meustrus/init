#!/bin/sh

if [ ! -x "$(command -v python)" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install python@2
    fi
fi
