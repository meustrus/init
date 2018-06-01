#!/bin/sh

if [ ! -x "$(command -v python)" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install python@2
    elif [[ "$OSTYPE" == "msys"* ]]; then
        choco install python2 -y
        call refreshenv
    fi
fi
