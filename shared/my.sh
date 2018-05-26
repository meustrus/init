#!/bin/sh

[ ! -n "${MY_NAME}" ] && MY_NAME="$(git config user.name)"
if [ -z "${MY_NAME}" ]; then
    MY_NAME="$(id -un)"
    git config --global user.name "$MY_NAME"
    echo "Your \`git config user.name\` is now $MY_NAME"
fi

[ ! -n "${MY_EMAIL}" ] && MY_EMAIL="$(git config user.email)"
if [ -z "${MY_EMAIL}"]; then
    read -p "Enter your \`git config user.email\`: " MY_EMAIL
    git config --global user.email "$MY_EMAIL"
    echo "Your \`git config user.email\` is now $MY_EMAIL"
fi
