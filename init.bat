@ECHO OFF

IF NOT DEFINED INIT_REPO (
    PUSHD %~dp0
    FOR /f %%i in ('cd') DO SET INIT_REPO=%%i
    POPD
)

call %INIT_REPO%\win\choco.bat
call %INIT_REPO%\win\git.bat
sh %INIT_REPO%\init.sh
