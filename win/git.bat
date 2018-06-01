@ECHO OFF

git --version >nul 2>&1 || (
    choco install git -y --package-parameters="/GitAndUnixToolsOnPath /NoShellIntegration"
    call refreshenv
)
