#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew list python@2 >/dev/null 2>&1 || brew install python@2
elif [[ "$OSTYPE" == "msys"* ]]; then
    choco install python2 -y
    call refreshenv
fi

pip install --quiet --upgrade pip setuptools
