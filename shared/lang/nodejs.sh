#!/bin/sh

if [ -x "$(command -v nvm)" ]; then
    if printf '%s' "$OSTYPE" | grep -q darwin 2>/dev/null; then
        brew list nvm >/dev/null 2>&1 || brew install nvm

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
    elif printf '%s' "$OSTYPE" | grep -q msys 2>/dev/null; then
        choco install nvm -y
    fi
fi

nvm install node --reinstall-packages-from=node
nvm use node
