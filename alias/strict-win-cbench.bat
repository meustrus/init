@ECHO OFF

REM to be run from the init repo: `call alias/strict-win-cbench.bat`

INIT_CLI_SHELL=ON
INIT_CLI_GIT=ON
INIT_CLI_SSH=ON

INIT_LANG_PYTHON=ON
INIT_LANG_JAVA=ON
INIT_LANG_NODEJS=ON

INIT_GUI_MULTICLIPBOARD=ON
INIT_GUI_CHROME=ON
INIT_GUI_FIREFOX=ON
INIT_GUI_VSCODE=ON

BENCH=C:\bench

call init.bat
