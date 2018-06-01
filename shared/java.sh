#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew cask install java
elif [[ "$OSTYPE" == "msys"* ]]; then
    choco install jdk8 -y
fi
