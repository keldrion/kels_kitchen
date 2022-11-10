@echo off & color 0C
mode con lines=2 cols=29
title   
set "ROOT=%CD%"
set "BIN=%ROOT%\tools\bin"
if exist %BIN%\java\lib\*.zip (%BIN%\7z x -o%BIN%\java\lib\ %BIN%\java\lib\*.zip >nul 2>&1 && del %BIN%\java\lib\*.zip >nul 2>&1)  
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (echo  ...Getting Admin Rights...  && timeout 2 >nul && goto UAC) else (goto gotAdmin)
:UAC
echo Set UAC = CreateObject^("Shell.Application"^) > "%BIN%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%BIN%\getadmin.vbs"
"%BIN%\getadmin.vbs" && del %BIN%\getadmin.vbs
exit /B
:gotAdmin
pushd "%CD%"
CD /D "%~dp0.\tools"
.\1