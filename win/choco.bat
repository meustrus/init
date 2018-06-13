@ECHO OFF

IF NOT DEFINED INIT_REPO (
    PUSHD %~dp0\..
    FOR /f %%i in ('cd') DO SET INIT_REPO=%%i
    POPD
)

choco -v >nul 2>&1 || (
    @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
    call refreshenv
)
