#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

. install-var NVM_HOME "${NVM_HOME:-$BENCH\\lib\\nvm}"
. install-var NVM_SYMLINK "${NVM_SYMLINK:-$NVM_HOME\\current}"
. install-path "$NVM_HOME" "$NVM_SYMLINK"

mkdir -p "$NVM_HOME"

if ! test -x "$(command -v nvm)"; then
    NvmZip=$(mktemp).zip
    curl -L -o "$NvmZip" https://github.com/coreybutler/nvm-windows/releases/download/1.1.7/nvm-noinstall.zip
    unzip -oq "$NvmZip" -d "$NVM_HOME"
fi

if ! test -f "$NVM_HOME/settings.txt"; then
    printf '%s: %s\n' \
        root "$NVM_HOME" \
        path "$NVM_SYMLINK" \
        > "$NVM_HOME/settings.txt" \
    ;
fi
