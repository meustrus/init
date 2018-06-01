@ECHO OFF
choco install openssh -y
call %~dp0resetenv.bat
