#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

setx HOME "$HOME"

. source-shared "cli/shell.sh"

choco install jq -y

copy-impl "etc/initrc.bat" "$BENCH/shellrc.d/initrc.bat"

AutoRun=$(reg query "HKEY_CURRENT_USER\\Software\\Microsoft\\Command Processor" //v AutoRun 2>/dev/null | tail -2 | head -1 | tr -s ' ' | cut -d " " -f 4-)
if [ -z "$AutoRun" ]; then
    AutoRun=$(winpath "$BENCH")\\autoexec.bat
    touch "$AutoRun"
    reg add "HKEY_CURRENT_USER\\Software\\Microsoft\\Command Processor" //v AutoRun //t REG_SZ //d "$AutoRun"
fi

append "$(printf '@IF "%%AUTORAN%%"=="TRUE" EXIT /B\n@SET AUTORAN=TRUE')" "$AutoRun"
append "@FOR %%f IN (\"$BENCH\\shellrc.d\\*.bat\") DO @CALL %%f" "$AutoRun"
