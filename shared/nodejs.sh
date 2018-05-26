#!/bin/sh

if [ -x "$(command -v nvm)" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install nvm
        mkdir ~/.nvm
        echo \# NVM >> ~/.bash_profile
        echo export NVM_DIR=~/.nvm >> ~/.bash_profile
        echo source \$(brew --prefix nvm)/nvm.sh >> ~/.bash_profile
        source ~/.bash_profile
    fi
fi

nvm install node --reinstall-packages-from=node
nvm use node
