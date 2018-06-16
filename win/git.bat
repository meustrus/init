@ECHO OFF

IF NOT DEFINED INIT_REPO (
    PUSHD %~dp0\..
    FOR /f %%i in ('cd') DO SET INIT_REPO=%%i
    POPD
)

git --version >nul 2>&1 || (
    choco install git -y --package-parameters="/GitAndUnixToolsOnPath /NoShellIntegration"
    call "%INIT_REPO%\win\bin\refreshenv.bat"
)
