#!/bin/sh

if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
    brew list python@2 >/dev/null 2>&1 || brew install python@2
elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
    choco install python2 -y
    call refreshenv
fi

pip install --quiet --upgrade pip setuptools
