@echo off & color 0C
mode con lines=2 cols=29
title   
set "ROOT=%CD%"
set "TOOLS=%ROOT%\tools"
if exist "%TOOLS%\*.7z" ("%TOOLS%\7z" x -o"%TOOLS%" "%TOOLS%\*.7z" >nul 2>&1) && move "%TOOLS%\7z*" "%TOOLS%\bin" >nul && if exist "%TOOLS%\bin\java\lib\*.7z" ("%TOOLS%\bin\7z" x -o"%TOOLS%\bin\java\lib" "%TOOLS%\bin\java\lib\*.7z"  >nul 2>&1 && del "%TOOLS%\*.7z" "%TOOLS%\bin\java\lib\*.7z")
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (echo  ...Getting Admin Rights...  && timeout 2 >nul && goto UAC) else (goto gotAdmin)
:UAC
echo Set UAC = CreateObject^("Shell.Application"^) > "%TOOLS%\bin\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%TOOLS%\bin\getadmin.vbs"
"%TOOLS%\bin\getadmin.vbs" && del "%TOOLS%\bin\getadmin.vbs"
exit /B
:gotAdmin
pushd "%CD%"
CD /D "%~dp0.\tools"
.\1