#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew cask list java >/dev/null 2>&1 || brew cask install java
elif [[ "$OSTYPE" == "msys"* ]]; then
    choco install jdk8 -y
fi
