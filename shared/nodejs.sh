#!/bin/sh

if [ -x "$(command -v nvm)" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install nvm
    elif [[ "$OSTYPE" == "msys"* ]]; then
        choco install nvm -y
    fi
    mkdir ~/.nvm

    echo >> ~/.bash_profile
    echo \# NVM >> ~/.bash_profile
    echo export NVM_DIR=~/.nvm >> ~/.bash_profile
    echo source \$(brew --prefix nvm)/nvm.sh >> ~/.bash_profile

    echo >> ~/.zprofile
    echo \# NVM >> ~/.zprofile
    echo export NVM_DIR=~/.nvm >> ~/.zprofile
    echo source \$(brew --prefix nvm)/nvm.sh >> ~/.zprofile

    source ~/.bash_profile
fi

nvm install node --reinstall-packages-from=node
nvm use node
