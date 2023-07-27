#!/bin/sh

. "${INIT_REPO:-$(dirname "$0")/../..}/vars.sh"

setx HOME "$HOME"

. "$INIT_REPO/shared/cli/shell.sh"

# ensure that msys is in *front* of Windows programs in $PATH, but only for Bash consoles (cmd should be unaffected)
install-env "export PATH=\"/usr/bin:\$PATH\""
PATH="/usr/bin:$PATH" export PATH

choco install jq -y
choco install curl -y

copy-impl "etc/initrc.bat" "$BENCH/shellrc.d/initrc.bat"

AutoRun=$(reg query "HKEY_CURRENT_USER\\Software\\Microsoft\\Command Processor" //v AutoRun 2>/dev/null | tail -2 | head -1 | tr -s ' ' | cut -d " " -f 4-)
if [ -z "$AutoRun" ]; then
    AutoRun=$(cygpath --windows "$BENCH")\\autoexec.bat
    touch "$AutoRun"
    reg add "HKEY_CURRENT_USER\\Software\\Microsoft\\Command Processor" //v AutoRun //t REG_SZ //d "$AutoRun"
fi

append "$(printf '@IF "%%AUTORAN%%"=="TRUE" EXIT /B\n@SET AUTORAN=TRUE')" "$AutoRun"
append "@FOR %%f IN (\"$BENCH\\shellrc.d\\*.bat\") DO @CALL %%f" "$AutoRun"
