@ECHO off

:getfile
SET "filename=%TEMP%\env~%RANDOM%.bat"
IF EXIST "%filename%" GOTO :getfile

%~dp0copyenv.vbs "%filename%"
CALL "%filename%"
