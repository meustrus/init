#!/bin/sh

source "${INIT_REPO:-$(dirname "$0")}/vars.sh"

copyIfExists() {
    [ -f "$1" ] && cp -f "$1" "$2"
}

copyIfExists "$BENCH/shellrc.d/initrc.sh" "`get-impl-path etc/initrc.sh`"
copyIfExists "$BENCH/shellrc.d/initrc.bat" "`get-impl-path etc/initrc.bat`"
copyIfExists "$BENCH/.gitignore-global" "`get-impl-path etc/.gitignore-global`"

if [ -d "$APPDATA" ]; then
    copyIfExists "$APPDATA/Code/User/settings.json" "`get-impl-path etc/vscode-settings.json`"
    copyIfExists "$APPDATA/Code/User/keybindings.json" "`get-impl-path etc/vscode-keybindings.json`"
else
    printf 'ERROR: $APPDATA is not a valid directory, but Visual Studio Code update requires it\n' 1>&2
fi
