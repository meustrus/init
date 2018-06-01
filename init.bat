@ECHO OFF
SET INIT_REPO=%~dp0
call %INIT_REPO%\win\choco.bat
call %INIT_REPO%\win\git.bat
sh %INIT_REPO%\init.sh
