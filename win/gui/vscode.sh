#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

test -x "$(command -v code)" || choco install vscode -y
. source-shared "gui/vscode.sh"

cat "$APPDATA/Code/User/settings.json" \
    | jq ".[\"terminal.integrated.automationShell.windows\"] = \"C:\\\\Windows\\\\System32\\\\cmd.exe\"" \
    | jq ".[\"terminal.integrated.shell.windows\"] = \"$(where bash | head -1 | sed -e 's/\\/\\\\/g')\"" \
    > "$APPDATA/Code/User/settings.json"

