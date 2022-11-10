@echo off & color 0A & setlocal EnableDelayedExpansion
title   
set "VER=1.1.2"
cd .. && set "ROOT=!CD!" && cd "tools"
set "TOOLS=%ROOT%\tools"
set "PROJECTS=%TOOLS%\_projects"
set "BIN=%TOOLS%\bin"
set "cECHO=%BIN%\cecho"
mode con lines=23 cols=76 && cls
echo                  .7.                                  7R
echo                   SZi                                7M
echo                    :Z7                              2a:
echo                     .2X    ,:XXXXX7XXXXXX7XXXX:.  :2X
echo                       XX;rXXSSSXSXXXXXXXSXSXSSX7M7MX:
echo                     .ir7XXXXX77r777r77777r777rX7XXX77Mi.
echo                  .;XSS7777r7r7r7r7r7r7r7r7r7r7r7r7r77XSS7i
echo                .7SS7X777X77r7r7r7r7r7r7r7r7r7r7r7r777777XSS;.
echo              .rSXXr7r7XX7XX7r7r7r7r7r7r7r7r7r7r77XX7XX77777SS;
echo             iSX77r7r77     77r7r7r7r7r7r7r7r7r77X     Xr7r7rXSS.
echo            rSXr7r7r777     Xr7r7r7r7r7r7r7r7r7r77     X7r7r7r7X2:
echo           ;SX77r7r7r77Xr7rX77r7r7r7r7r7r7r7r7r77X7r7rX777r7r7r772,
echo          :SXr7r7r7r7r77XXX77r7r7r7r7r777r7r7r7r77XXXX7r7r7r7r7r7XS.
echo          XSXX7XXXXX7XXXXXXX7X7XXXXXXXXXXXXX7XXX7XXXXX7XXXXXXXXXXX2X
echo          2XX7XXX7XXX7XXX7X7XXX7XXX7X7XXXXXXX7X7XXXXXXX7XXXX7XXXXXSS
%cECHO% {06}{\n}                                  MM                  MM        MM{\n}
echo                                   MM                            MM
echo          nMMMLmM  RnrmMMm    mMMLmMM  MLmMM  mMMMMm   MM   mMMLmMM
echo         MM    MM  MM    MM  MM    MM  MMP   MM    WM  MM  MM    MM
echo         PM    WM  MM    MM  MW    MM  MM    MM    MM  MM  MW    MM
echo          PMMMP7R  BM    MM   PMMP7MM  WM     PRMMMP   MM   RMMP7MM
timeout 15 >nul
:mainmenu
mode con lines=2 cols=50 && cls
%cECHO% {0A}&& if exist "%PROJECTS%\1" (set /p "PRO=. Please Enter Project Name: " && move "%PROJECTS%\1" "%PROJECTS%\_!PRO: =_!" >nul && set "WORK=%PROJECTS%\_!PRO: =_!") else (if exist "%PROJECTS%\_*" (for /f "tokens=*" %%a in ('dir /b /a %PROJECTS%\_*') do (set "WORK=%PROJECTS%\%%a")))
for /d %%i in ("%WORK%") do (set "PROJECTTITLE=%%~ni") && title Project: !PROJECTTITLE:~1!
if not exist "%ROOT%\_work" (mklink /d "%ROOT%\_work" "%WORK%" >nul 2>&1) else (if exist "%ROOT%\_work" (rmdir /s /q "%ROOT%\_work" && mklink /d "%ROOT%\_work" "%WORK%" >nul 2>&1))
set "BUILD=%WORK%\build"
set "CONFIG=%WORK%\config"
set "LOGS=%WORK%\logs"
set "ODIN=%BUILD%\odin"
set "ROM=%WORK%\rom"
set "SOURCE=%WORK%\source"
if not exist "%BUILD%" (mkdir "%BUILD%") && if not exist "%CONFIG%" (mkdir "%CONFIG%") && if not exist "%ODIN%" (mkdir "%ODIN%") && if not exist "%ROM%" (mkdir "%ROM%") && if not exist "%SOURCE%" (mkdir "%SOURCE%") && timeout 3 >nul && echo.
set "ODM=%ROM%\odm"
set "OPTICS=%ROM%\optics"
set "PRISM=%ROM%\prism"
set "PRODUCT=%ROM%\product"
set "SYSTEM=%ROM%\system"
set "VENDOR=%ROM%\vendor"
set "FORWSL=%WORK%"
set "WSLENV=FORWSL/up"
set "EXE=%BIN%\exe"
set "MODS=%TOOLS%\mods"
set "ADB=%BIN%\adb"
set "WSL=%BIN%\wsl"
set "JAVA=%BIN%\java\bin\java -jar %BIN%\omc.jar"
for /d %%i in ("%WORK%") do (set "nWORK=%%~ni")
for /d %%i in ("%ODM%") do (set "nODM=%%~ni")
for /d %%i in ("%OPTICS%") do (set "nOPTICS=%%~ni")
for /d %%i in ("%PRISM%") do (set "nPRISM=%%~ni")
for /d %%i in ("%PRODUCT%") do (set "nPRODUCT=%%~ni")
for /d %%i in ("%SYSTEM%") do (set "nSYSTEM=%%~ni")
for /d %%i in ("%VENDOR%") do (set "nVENDOR=%%~ni")
for /d %%i in ("%CONFIG%\super") do (set "nSUPER=%%~ni")
mode con lines=15 cols=76 && cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Main Menu                                     [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
%cECHO% {0F}    1{08} -{0A} ROM Extract ^& Build Menu{\n}
%cECHO% {0F}    2{08} -{#} Project Menu{\n}
%cECHO% {0F}    3{08} -{#} Mod Menu{\n}
%cECHO% {0F}    4{08} -{#} Debloat Menu{\n}
%cECHO% {0F}    f{08} -{#} Frija Downloader{\n}
%cECHO% {0F}    o{08} -{#} Open Odin Tar Manager{\n}
%cECHO% {0F}    a{08} -{#} [A]ndroid[D]evice[B]ridge{\n}
%cECHO% {0F}    w{08} -{#} [W]indows[S]ubsystem[L]inux{\n}
%cECHO% {0F}    q{08} -{#} Exit{\n}{06}{\n}
choice /c 1234foawq /n /m ".  Your Choice:"
if "%errorlevel%" == "1" (goto rommenu)
if "%errorlevel%" == "2" (goto projectmenu)
if "%errorlevel%" == "3" (goto modmenu)
if "%errorlevel%" == "4" (goto debloatmenu)
if "%errorlevel%" == "5" (goto frija)
if "%errorlevel%" == "6" (goto odin)
if "%errorlevel%" == "7" (goto adbmenu)
if "%errorlevel%" == "8" (goto installwsl)
if "%errorlevel%" == "9" (goto exit)
:projectmenu
set "N="
set "PROJECT2=" && set "PROJECT3=" && set "PROJECT4=" && set "PROJECT5="
for /f "tokens=*" %%a in ('dir /o /b /a:d %PROJECTS%') do (set /a "N+=1" & set "PROJECT!N!=%PROJECTS%\%%a")
if !N! GTR 0 (set /a "N=0")
mode con lines=17 cols=76 && cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Project Menu                                  [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
if exist "%WORK%" (for /d %%i in ("%WORK%") do (%cECHO% {0F}    1{08} -{06} %nWORK:~1%{\n}))
if exist "%PROJECT2%" (for /d %%i in ("%PROJECT2%") do (%cECHO% {0F}    2{08} -{#} %%~ni{\n}))
if exist "%PROJECT3%" (for /d %%i in ("%PROJECT3%") do (%cECHO% {0F}    3{08} -{#} %%~ni{\n}))
if exist "%PROJECT4%" (for /d %%i in ("%PROJECT4%") do (%cECHO% {0F}    4{08} -{#} %%~ni{\n}))
if exist "%PROJECT5%" (for /d %%i in ("%PROJECT5%") do (%cECHO% {0F}    5{08} -{#} %%~ni{\n}))
%cECHO% {0F}{\n}    c{08} -{0A} Create New Project{\n}
%cECHO% {0F}    r{08} -{#} Rename Active Project: %nWORK:~1%{\n}
%cECHO% {0F}    d{08} -{#} Delete Active Project: %nWORK:~1%{\n}
%cECHO% {0F}    b{08} -{#} Back To Main Menu{\n}
%cECHO% {0F}    q{08} -{#} Exit{\n}{06}{\n}
if exist "%PROJECT5%" (choice /c crdbq12345 /n /m ".  Your Choice:" & goto choose)
if exist "%PROJECT4%" (choice /c crdbq1234 /n /m ".  Your Choice:" & goto choose)
if exist "%PROJECT3%" (choice /c crdbq123 /n /m ".  Your Choice:" & goto choose)
if exist "%PROJECT2%" (choice /c crdbq12 /n /m ".  Your Choice:" & goto choose)
choice /c crdbq1 /n /m ".  Your Choice:"
:choose
if "%errorlevel%" == "1" (goto mkproject)
if "%errorlevel%" == "2" (goto renproject)
if "%errorlevel%" == "3" (goto delproject)
if "%errorlevel%" == "4" (goto mainmenu)
if "%errorlevel%" == "5" (goto exit)
if exist "%WORK%" (if "%errorlevel%" == "6" (goto mainmenu))
if exist "%PROJECT2%" (if "%errorlevel%" == "7" (for /d %%i in ("%PROJECT2%") do (set "nPROJECT=%%~ni" && move "%WORK%" "%PROJECTS%\%nWORK:~1%" >nul && move "%PROJECT2%" "%PROJECTS%\_!nPROJECT!" >nul && goto mainmenu)))
if exist "%PROJECT3%" (if "%errorlevel%" == "8" (for /d %%i in ("%PROJECT3%") do (set "nPROJECT=%%~ni" && move "%WORK%" "%PROJECTS%\%nWORK:~1%" >nul && move "%PROJECT3%" "%PROJECTS%\_!nPROJECT!" >nul && goto mainmenu)))
if exist "%PROJECT4%" (if "%errorlevel%" == "9" (for /d %%i in ("%PROJECT4%") do (set "nPROJECT=%%~ni" && move "%WORK%" "%PROJECTS%\%nWORK:~1%" >nul && move "%PROJECT4%" "%PROJECTS%\_!nPROJECT!" >nul && goto mainmenu)))
if exist "%PROJECT5%" (if "%errorlevel%" == "10" (for /d %%i in ("%PROJECT5%") do (set "nPROJECT=%%~ni" && move "%WORK%" "%PROJECTS%\%nWORK:~1%" >nul && move "%PROJECT5%" "%PROJECTS%\_!nPROJECT!" >nul && goto mainmenu)))
:mkproject
%cECHO% {0A}{\n}&& mode con lines=2 cols=50 && cls
set /P "PRO=. Please Enter Project Name :" && move "%WORK%" "%PROJECTS%\%nWORK:~1%" >nul && mkdir "%PROJECTS%\_!PRO: =_!" >nul && set "WORK=%PROJECTS%\_!PRO: =_!" && goto mainmenu
:renproject
%cECHO% {0A}{\n}&& mode con lines=2 cols=50 && cls
set /P "PRO=. Please Enter New Name:" && move "%WORK%" "%PROJECTS%\_!PRO: =_!" >nul && set "WORK=%PROJECTS%\_!PRO: =_!" && goto mainmenu
:delproject
mode con lines=6 cols=50 && cls
%cECHO% {0C}    Do You Really Want to Delete Your Project^?{\n}{\n}
%cECHO% {0F}              [Y]{0A}es{0F}       [N]{0A}o{\n}{06}{\n}
choice /c yn /n /t 15 /d n /m ".  Your Choice:"
if "%errorlevel%" == "1" (goto delnow)
if "%errorlevel%" == "2" (goto mainmenu)
:delnow
mode con lines=2 cols=50 && cls
if not exist "%PROJECT2%" (%cECHO% {0C} Deleting Project.. & rmdir /s /q "%WORK%" && mkdir "%PROJECTS%\1") else (rmdir /s /q "%WORK%" && for /d %%i in ("%PROJECT2%") do (set "nPROJECT=%%~ni" && move "%PROJECT2%" "%PROJECTS%\_!nPROJECT!" >nul))
goto mainmenu
:rommenu
mode con lines=13 cols=76 && cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Rom Build Menu                                [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
%cECHO% {0F}    1{08} -{0A} Extract Rom{\n}
%cECHO% {0F}    2{08} -{#} Rebuild Menu{\n}
%cECHO% {0F}    3{08} -{#} Debloat Rom{\n}
%cECHO% {0F}    f{08} -{#} Frija To Download Latest Stock{\n}
%cECHO% {0F}    o{08} -{#} Open Odin Tar Manager{\n}
%cECHO% {0F}    b{08} -{#} Back To Main Menu{\n}
%cECHO% {0F}    q{08} -{#} Exit{\n}{06}{\n}
choice /c 123fobq /n /m ".  Your Choice:"
if "%errorlevel%" == "1" (goto romextract)
if "%errorlevel%" == "2" (goto rebuildmenu)
if "%errorlevel%" == "3" (goto debloatmenu)
if "%errorlevel%" == "4" (goto frija)
if "%errorlevel%" == "5" (goto odin)
if "%errorlevel%" == "6" (goto mainmenu)
if "%errorlevel%" == "7" (goto exit)
:romextract
for /f %%a in ('dir /b /a /s %WORK%\*.tar 2^>nul') do (goto choose2)
for /f %%a in ('dir /b /a /s %WORK%\*.md5 2^>nul') do (goto choose2)
goto resume
:choose2
mode con lines=8 cols=50 && cls
%cECHO% {0C}    Do You Really Want to Overwrite Your Project^?{\n}{\n}
%cECHO% {0F}                [Y]{0A}es{0F}       [N]{0A}o{\n}{06}{\n}
%cECHO% {0F}                 [P]{0A}roject Menu{\n}{\n}
choice /c ynp /n /m ".  Your Choice:"
if "%errorlevel%" == "1" (goto delold)
if "%errorlevel%" == "2" (goto mainmenu)
if "%errorlevel%" == "3" (goto projectmenu)
:delold
rmdir /s /q "%WORK%" && mkdir "%WORK%"
if not exist "%BUILD%" (mkdir "%BUILD%") && if not exist "%CONFIG%" (mkdir "%CONFIG%") && if not exist "%ODIN%" (mkdir "%ODIN%") && if not exist "%ROM%" (mkdir "%ROM%") && if not exist "%SOURCE%" (mkdir "%SOURCE%") && timeout 3 >nul && echo.
:resume
mode con lines=38 cols=76 && cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Extract Stock Software                        [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ########################################################################### && echo.
for /f %%a in ('copy /Z "%~f0" nul') do set "Newline=%%a"
if exist "%ROOT%\*.zip" (goto resume2) else (if exist "%ROOT%\*.md5" (move "%ROOT%\*.md5" "%SOURCE%" >nul && goto resume2) else (if exist "%ROOT%\*.tar" (move "%ROOT%\*.tar" "%SOURCE%" >nul && goto resume2) else (goto fchooser)))
:resume2
if exist "%ROOT%\*.zip" (echo  Extracting Zip Archiv Now, Plz Be Patient... && "%BIN%\7z" e -bb3 -aoa -o"%SOURCE%" "%ROOT%\*.zip" >nul 2>&1 && echo. && echo  ... Done^^! && timeout 2 >nul && del "%ROOT%\*.zip")
if exist "%SOURCE%\AP*" (for /f "tokens=1,2 delims=." %%i in ('dir /b %SOURCE%\AP*') do (set "AP1=%%i" && set "AP2=%%j")) && set "AP=!AP1:~0,16!.!AP2!" && move "%SOURCE%\AP*" "%ODIN%\!AP!" >nul
if exist "%SOURCE%\BL*" (for /f "tokens=1,2 delims=." %%i in ('dir /b %SOURCE%\BL*') do (set "BL1=%%i" && set "BL2=%%j")) && set "BL=!BL1:~0,16!.!BL2!" && move "%SOURCE%\BL*" "%ODIN%\!BL!" >nul
if exist "%SOURCE%\CP*" (for /f "tokens=1,2 delims=." %%i in ('dir /b %SOURCE%\CP*') do (set "CP1=%%i" && set "CP2=%%j")) && set "CP=!CP1:~0,16!.!CP2!" && move "%SOURCE%\CP*" "%ODIN%\!CP!" >nul
if exist "%SOURCE%\CSC*" (for /f "tokens=1,2 delims=." %%i in ('dir /b %SOURCE%\CSC*') do (set "CSC_OXM1=%%i" && set "CSC_OXM2=%%j")) && set "CSC_OXM=!CSC_OXM1:~0,21!.!CSC_OXM2!" && move "%SOURCE%\CSC*" "%ODIN%\!CSC_OXM!" >nul
if exist "%SOURCE%\HOME*" (for /f "tokens=1,2 delims=." %%i in ('dir /b %SOURCE%\HOME*') do (set "HOME_CSC1=%%i" && set "HOME_CSC2=%%j")) && set "HOME_CSC=!HOME_CSC1:~0,26!.!HOME_CSC2!" && move "%SOURCE%\HOME*" "%ODIN%\!HOME_CSC!" >nul
if exist "%ODIN%\CSC*" (set /a "N+=1")
if exist "%ODIN%\HOME*" (set /a "N+=1")
if %N% LSS 2 (set "N=" & goto resume3)
%cECHO% {06}{\n}
%cECHO% {0F}    1{08} -{0A} %CSC_OXM%{\n}
%cECHO% {0F}    2{08} -{#} %HOME_CSC%{\n}
%cECHO% {\n}{0F}    b{08} -{#} Back To Main Menu{\n}{06}{\n}
choice /c 12b /n /t 20 /d 1 /m ".  Which CSC Want To Use?:"
if "%errorlevel%" == "1" (del %ODIN%\%HOME_CSC%)
if "%errorlevel%" == "2" (del %ODIN%\%CSC_OXM%)
if "%errorlevel%" == "3" (goto mainmenu)
:resume3
if exist "%ODIN%\*.tar" (%cECHO% {0A} Extracting ROM Relevant Images, Plz Be Patient... && "%BIN%\7z" e -bb3 -aos -ax^^!"%ODIN%\BL*" -ax^^!"%ODIN%\CP*" -o"%SOURCE%" "%ODIN%\*.tar" boot* optics* prism* recovery* super* vbmeta.* meta-data\fota* >nul 2>&1)
if exist "%SOURCE%\boot.*" (move "%SOURCE%\boot.*" "%BUILD%" >nul & move "%SOURCE%\recovery.*" "%BUILD%" >nul & move "%SOURCE%\vbmeta.*" "%BUILD%" >nul)
if exist "%SOURCE%\fota*" ("%BIN%\7z" e -bb3 -o"%CONFIG%" -aoa "%SOURCE%\fota*" META\*.bin >nul 2>&1 )
if exist "%CONFIG%\*.bin" ("%BIN%\sefcontext_decompile" -o "%CONFIG%\system_file_contexts" "%CONFIG%\file_contexts.bin")
if exist "%CONFIG%\*.bin" ("%BIN%\sefcontext_decompile" -o "%CONFIG%\framework_file_contexts" "%CONFIG%\framework_file_contexts.bin")
if exist "%CONFIG%\*.bin" (type "%CONFIG%\framework_file_contexts">>"%CONFIG%\system_file_contexts" && del "%CONFIG%\*.bin" "%CONFIG%\framework_file_contexts")
if exist "%SOURCE%\*.lz4" (%cECHO% {0A}{\n}{\n} Decompressing LZ4 Images... && cd "%SOURCE%" && "%BIN%\lz4" -d -f -v -m --rm "*.lz4" >nul 2>&1 && cd "%TOOLS%")
if exist "%SOURCE%\optics*" (%cECHO% {0A}{\n}{\n} Converting Sparse Images Into Raw Images... && "%BIN%\simg2img" "%SOURCE%\optics.img" "%SOURCE%\optics.raw" && del "%SOURCE%\optics.img")
if exist "%SOURCE%\prism*" ("%BIN%\simg2img" "%SOURCE%\prism.img" "%SOURCE%\prism.raw" && del "%SOURCE%\prism.img")
if exist "%SOURCE%\super*" ("%BIN%\simg2img" "%SOURCE%\super.img" "%SOURCE%\super.raw" && del "%SOURCE%\super.img")
%cECHO% {0A}{\n}{\n} Extract Odm + Product + System + Vendor Images From Super Image... && "%WSL%" "$PWD/bin/linux/lpunpack" "$FORWSL/source/super.raw" "$FORWSL/source/"
"%WSL%" "$PWD/bin/linux/lpdump" -a "$FORWSL/source/super.raw" ^>^>"$FORWSL/config/super" && del "%SOURCE%\super*" && echo.
if exist "%SOURCE%\*.ext" (ren "%SOURCE%\*.ext" "*.img")
if not exist "%ODM%" (mkdir "%ODM%" && fsutil file setCaseSensitiveinfo "%ODM%" enable >nul)
if exist "%SOURCE%\odm*" (%cECHO% {0A}{\n} Extract Odm To ROM Folder... && "%BIN%\imgextractor" "%SOURCE%\odm.img" "%ROM%" >nul)
if exist "%SOURCE%\odm*" ("%WSL%" "$PWD/bin/linux/tune2fs" -l "$FORWSL/source/odm.img") | findstr /v Overhead >"%CONFIG%\odm"
for /f "usebackq" %%i in ("%ROM%\config\odm_size.txt") do (echo Image Originalsize:       %%i>>"%CONFIG%\odm")
del "%SOURCE%\odm*" "%ROM%\config\*.txt" && move "%ROM%\config\*" "%CONFIG%" >nul 
if not exist "%OPTICS%" (mkdir "%OPTICS%" && fsutil file setCaseSensitiveinfo "%OPTICS%" enable >nul)
if exist "%SOURCE%\optics*" (%cECHO% {0A}{\n}{\n} Extract Optics To ROM Folder... && "%BIN%\imgextractor" "%SOURCE%\optics.raw" "%ROM%" >nul)
if exist "%SOURCE%\optics*" ("%WSL%" "$PWD/bin/linux/tune2fs" -l "$FORWSL/source/optics.raw") | findstr /v Overhead >"%CONFIG%\optics"
for /f "usebackq" %%i in ("%ROM%\config\optics_size.txt") do (echo Image Originalsize:       %%i>>"%CONFIG%\optics")
del "%SOURCE%\optics*" "%ROM%\config\*.txt" && move "%ROM%\config\*" "%CONFIG%" >nul && echo.
if exist "%OPTICS%" (%JAVA% -i "%OPTICS%" -o "%OPTICS%" >nul 2>&1 && %cECHO% {0A}{\n} Decoding All Regional Carrier Files In ROM Optics Folder... && timeout 2 >nul && echo.)
if not exist "%PRISM%" (mkdir "%PRISM%" && fsutil file setCaseSensitiveinfo "%PRISM%" enable >nul)
if exist "%SOURCE%\prism*" (%cECHO% {0A}{\n} Extract Prism To ROM Folder... && "%BIN%\imgextractor" "%SOURCE%\prism.raw" "%ROM%" >nul)
if exist "%SOURCE%\prism*" ("%WSL%" "$PWD/bin/linux/tune2fs" -l "$FORWSL/source/prism.raw") | findstr /v Overhead >"%CONFIG%\prism"
for /f "usebackq" %%i in ("%ROM%\config\prism_size.txt") do (echo Image Originalsize:       %%i>>"%CONFIG%\prism")
del "%SOURCE%\prism*" "%ROM%\config\*.txt" && move "%ROM%\config\*" "%CONFIG%" >nul && echo.
if not exist "%PRODUCT%" (mkdir "%PRODUCT%" && fsutil file setCaseSensitiveinfo "%PRODUCT%" enable >nul)
if exist "%SOURCE%\product*" ( %cECHO% {0A}{\n} Extract Product To ROM Folder... && "%BIN%\imgextractor" "%SOURCE%\product.img" "%ROM%" >nul)
if exist "%SOURCE%\product*" ("%WSL%" "$PWD/bin/linux/tune2fs" -l "$FORWSL/source/product.img") | findstr /v Overhead >"%CONFIG%\product"
for /f "usebackq" %%i in ("%ROM%\config\product_size.txt") do (echo Image Originalsize:       %%i>>"%CONFIG%\product")
del "%SOURCE%\product*" "%ROM%\config\*.txt" && move "%ROM%\config\*" "%CONFIG%" >nul && echo.
if not exist "%SYSTEM%" (mkdir "%SYSTEM%" && fsutil file setCaseSensitiveinfo "%SYSTEM%" enable >nul)
if exist "%SOURCE%\system*" ( %cECHO% {0A}{\n} Extract System To ROM Folder... && "%BIN%\imgextractor" "%SOURCE%\system.img" "%ROM%" >nul)
if exist "%SOURCE%\system*" ("%WSL%" "$PWD/bin/linux/tune2fs" -l "$FORWSL/source/system.img") | findstr /v Overhead >"%CONFIG%\system"
for /f "usebackq" %%i in ("%ROM%\config\system_size.txt") do (echo Image Originalsize:       %%i>>"%CONFIG%\system")
echo / 0000 0000 00755 >"%CONFIG%\system_root_fs_config" && "%BIN%\fs_generator" "%SOURCE%\system.img">>"%CONFIG%\system_root_fs_config"
del "%SOURCE%\system*" "%ROM%\config\*.txt" && move "%ROM%\config\*" "%CONFIG%" >nul && echo.
if not exist "%VENDOR%" (mkdir "%VENDOR%" && fsutil file setCaseSensitiveinfo "%VENDOR%" enable >nul)
if exist "%SOURCE%\vendor*" ( %cECHO% {0A}{\n} Extract Vendor To ROM Folder... && "%BIN%\imgextractor" "%SOURCE%\vendor.img" "%ROM%" >nul)
if exist "%SOURCE%\vendor*" ("%WSL%" "$PWD/bin/linux/tune2fs" -l "$FORWSL/source/vendor.img") | findstr /v Overhead >"%CONFIG%\vendor"
for /f "usebackq" %%i in ("%ROM%\config\vendor_size.txt") do (echo Image Originalsize:       %%i>>"%CONFIG%\vendor")
del "%SOURCE%\vendor*" "%ROM%\config\*.txt" & move "%ROM%\config\*" "%CONFIG%" >nul & rmdir /s /q "%ROM%\config" >nul & ren %CONFIG%\* *.txt && timeout 10 >nul
:rebuildmenu
mode con lines=18 cols=76 && cls
set "RWMODE=readonly"
set "EXT=ext4"
set "JOURNAL=-j 0"
set "TIMESTAMP=-T 1230735600"
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Rebuild Image Menu                            [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
if exist "%BUILD%\super*" (%cECHO% {0F}    1{08} -{0A} Odm Image          [{0F}x{0A}]{\n}) else (if exist "%BUILD%\odm*" (%cECHO% {0F}    1{08} -{0A} Odm Image          [{0F}x{0A}]{\n}) else (%cECHO% {0F}    1{08} -{0A} Odm Image{\n}))
if exist "%BUILD%\optics*" (%cECHO% {0F}    2{08} -{#} Optics Image       [{0F}x{#}]{\n}) else (%cECHO% {0F}    2{08} -{#} Optics Image{\n})
if exist "%BUILD%\prism*" (%cECHO% {0F}    3{08} -{#} Prism Image        [{0F}x{#}]{\n}) else (%cECHO% {0F}    3{08} -{#} Prism Image{\n})
if exist "%BUILD%\super*" (%cECHO% {0F}    4{08} -{#} Product Image      [{0F}x{#}]{\n}) else (if exist "%BUILD%\product*" (%cECHO% {0F}    4{08} -{#} Product Image      [{0F}x{#}]{\n}) else (%cECHO% {0F}    4{08} -{#} Product Image{\n}))
if exist "%BUILD%\super*" (%cECHO% {0F}    5{08} -{#} System Image       [{0F}x{#}]{\n}) else (if exist "%BUILD%\system*" (%cECHO% {0F}    5{08} -{#} System Image       [{0F}x{#}]{\n}) else (%cECHO% {0F}    5{08} -{#} System Image{\n}))
if exist "%BUILD%\super*" (%cECHO% {0F}    6{08} -{#} Vendor Image       [{0F}x{#}]{\n}) else (if exist "%BUILD%\vendor*" (%cECHO% {0F}    6{08} -{#} Vendor Image       [{0F}x{#}]{\n}) else (%cECHO% {0F}    6{08} -{#} Vendor Image{\n}))
if exist "%BUILD%\super*" (%cECHO% {0F}    7{08} -{#} Super Image        [{0F}x{#}]{\n}) else (%cECHO% {0F}    7{08} -{#} Super Image{\n})
%cECHO% {0F}    8{08} -{#} Rebuild Odin Files{\n}
%cECHO% {0F}    d{08} -{#} Debloat Menu{\n}
%cECHO% {0F}    o{08} -{#} Open Odin Tar Manager{\n}
%cECHO% {0F}    b{08} -{#} Back To Main Menu{\n}
%cECHO% {0F}    q{08} -{#} Exit{\n}{06}{\n}
choice /c 12345678dobq /n /m ".  Your Choice:"
if "%errorlevel%" == "1" (goto odm)
if "%errorlevel%" == "2" (goto optics)
if "%errorlevel%" == "3" (goto prism)
if "%errorlevel%" == "4" (goto product)
if "%errorlevel%" == "5" (goto system)
if "%errorlevel%" == "6" (goto vendor)
if "%errorlevel%" == "7" (goto super)
if "%errorlevel%" == "8" (goto tar)
if "%errorlevel%" == "9" (goto debloatmenu)
if "%errorlevel%" == "10" (goto odin)
if "%errorlevel%" == "11" (goto mainmenu)
if "%errorlevel%" == "12" (goto exit)
:odm
mode con lines=20 cols=76 && cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Building Odm.img                              [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
if not exist "%ODM%" (%cECHO% {0C}{\n} Odm ROM Folder Not Found Plz Extract It First{\n}{06}{\n} && pause && goto rebuildmenu)
for /f "tokens=4" %%i in (%CONFIG%\odm.txt) do (if not defined ODMLABEL set "ODMLABEL=-L %%i")
for /f "skip=1 tokens=4" %%i in (%CONFIG%\odm.txt) do (if not defined ODMMOUNT set "ODMMOUNT=-M %%i")
for /f "skip=2 tokens=3" %%i in (%CONFIG%\odm.txt) do (if not defined ODMUUID set "ODMUUID=-U %%i")
for /f "skip=11 tokens=3" %%i in (%CONFIG%\odm.txt) do (if not defined ODMINODES set "ODMINODES=-i %%i")
for /f "skip=40 tokens=4" %%i in (%CONFIG%\odm.txt) do (if not defined ODMHASH set "ODMHASH=-S %%i")
for /f "skip=41 tokens=3" %%i in (%CONFIG%\odm.txt) do (if not defined ODMSIZE set "ODMSIZE=%%i")
%cECHO% {0A}{\n}&& if exist "%CONFIG%\%nODM%_fs*" ("%BIN%\fspatch" "%ODM%" "%CONFIG%\%nODM%_fs_config.txt") && echo.
if exist "%ODM%" ("%WSL%" "$PWD/bin/linux/mkuserimg_mke2fs.sh" "$FORWSL/rom/%nODM%" "$FORWSL/build/%nODM%.img" %EXT% %nODM% !ODMSIZE! %JOURNAL% %TIMESTAMP% -C "$FORWSL/config/%nODM%_fs_config.txt" -D "$FORWSL/rom/%nODM%" %ODMLABEL% %ODMMOUNT% %ODMINODES% %ODMUUID% %ODMHASH% "$FORWSL/config/%nODM%_file_contexts.txt")
%cECHO% {06}&& timeout 15 && goto rebuildmenu
:optics
mode con lines=24 cols=76 && cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Building Optics.img                           [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
if not exist "%OPTICS%" (%cECHO% {0C}{\n} Optics ROM Folder Not Found Plz Extract It First{\n}{06}{\n} && pause && goto rebuildmenu)
for /f "tokens=4" %%i in (%CONFIG%\optics.txt) do (if not defined OPTICSLABEL set "OPTICSLABEL=-L %%i")
for /f "skip=1 tokens=4" %%i in (%CONFIG%\optics.txt) do (if not defined OPTICSMOUNT set "OPTICSMOUNT=-M %%i")
for /f "skip=2 tokens=3" %%i in (%CONFIG%\optics.txt) do (if not defined OPTICSUUID set "OPTICSUUID=-U %%i")
for /f "skip=11 tokens=3" %%i in (%CONFIG%\optics.txt) do (if not defined OPTICSINODES set "OPTICSINODES=-i %%i")
for /f "skip=40 tokens=4" %%i in (%CONFIG%\optics.txt) do (if not defined OPTICSHASH set "OPTICSHASH=-S %%i")
for /f "skip=41 tokens=3" %%i in (%CONFIG%\optics.txt) do (if not defined OPTICSSIZE set "OPTICSSIZE=%%i")
%cECHO% {0A}{\n}&& if exist "%CONFIG%\%nOPTICS%_fs*" ("%BIN%\fspatch" "%OPTICS%" "%CONFIG%\%nOPTICS%_fs_config.txt") && echo.
if exist "%OPTICS%" ("%WSL%" "$PWD/bin/linux/mkuserimg_mke2fs.sh" "$FORWSL/rom/%nOPTICS%" "$FORWSL/build/%nOPTICS%.raw" %EXT% %nOPTICS% !OPTICSSIZE! %JOURNAL% %TIMESTAMP% -C "$FORWSL/config/%nOPTICS%_fs_config.txt" -D "$FORWSL/rom/%nOPTICS%" %OPTICSLABEL% %OPTICSMOUNT% %OPTICSINODES% %OPTICSUUID% %OPTICSHASH% "$FORWSL/config/%nOPTICS%_file_contexts.txt" && echo.)
if exist "%BUILD%\%nOPTICS%*" ("%BIN%\img2simg" "%BUILD%\%nOPTICS%.raw" "%BUILD%\%nOPTICS%.img" 4096 && del "%BUILD%\%nOPTICS%.raw" >nul && echo  Converting %nOPTICS%.raw Into Sparse %nOPTICS%.img, ...Done && echo.)
if exist "%BUILD%\%nOPTICS%*" ("%BIN%\lz4" -B6 -f --rm --content-size "%BUILD%\%nOPTICS%.img"  2>nul && echo  Compressing lz4 Image, ...Done)
%cECHO% {06}&& timeout 15 && goto rebuildmenu
:prism
mode con lines=27 cols=76 && cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Building Prism.img                            [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
if not exist "%PRISM%" (%cECHO% {0C}{\n} Prism ROM Folder Not Found Plz Extract It First{\n}{06}{\n} && pause && goto rebuildmenu)
for /f "tokens=4" %%i in (%CONFIG%\prism.txt) do (if not defined PRISMLABEL set "PRISMLABEL=-L %%i")
for /f "skip=1 tokens=4" %%i in (%CONFIG%\prism.txt) do (if not defined PRISMMOUNT set "PRISMMOUNT=-M %%i")
for /f "skip=2 tokens=3" %%i in (%CONFIG%\prism.txt) do (if not defined PRISMUUID set "PRISMUUID=-U %%i")
for /f "skip=11 tokens=3" %%i in (%CONFIG%\prism.txt) do (if not defined PRISMINODES set "PRISMINODES=-i %%i")
for /f "skip=40 tokens=4" %%i in (%CONFIG%\prism.txt) do (if not defined PRISMHASH set "PRISMHASH=-S %%i")
for /f "skip=41 tokens=3" %%i in (%CONFIG%\prism.txt) do (if not defined PRISMSIZE set "PRISMSIZE=%%i")
%cECHO% {0A}{\n}&& if exist "%CONFIG%\%nPRISM%_fs*" ("%BIN%\fspatch" "%PRISM%" "%CONFIG%\%nPRISM%_fs_config.txt" && echo.)
if exist "%PRISM%" ("%WSL%" "$PWD/bin/linux/mkuserimg_mke2fs.sh" "$FORWSL/rom/%nPRISM%" "$FORWSL/build/%nPRISM%.raw" %EXT% %nPRISM% %PRISMSIZE% %JOURNAL% %TIMESTAMP% -C "$FORWSL/config/%nPRISM%_fs_config.txt" -D "$FORWSL/rom/%nPRISM%" %PRISMLABEL% %PRISMMOUNT% %PRISMINODES% %PRISMUUID% %PRISMHASH% "$FORWSL/config/%nPRISM%_file_contexts.txt" && echo.)
if exist "%BUILD%\%nPRISM%*" ("%BIN%\img2simg" "%BUILD%\%nPRISM%.raw" "%BUILD%\%nPRISM%.img" 4096 && del "%BUILD%\%nPRISM%.raw" >nul && echo  Converting %nPRISM%.raw Into Sparse %nPRISM%.img done... && echo.)
if exist "%BUILD%\%nPRISM%*" ("%BIN%\lz4" -B6 -f --rm --content-size "%BUILD%\%nPRISM%.img"  2>nul && echo  Compressing lz4 Image, ...Done)
%cECHO% {06}&& timeout 15 && goto rebuildmenu
:product
mode con lines=23 cols=76 && cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Building Product.img                          [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
if not exist "%PRODUCT%" (%cECHO% {0C}{\n} Product ROM Folder Not Found Plz Extract It First{\n}{06}{\n} && pause && goto rebuildmenu)
for /f "tokens=4" %%i in (%CONFIG%\product.txt) do (if not defined PRODUCTLABEL set "PRODUCTLABEL=-L %%i")
for /f "skip=1 tokens=4" %%i in (%CONFIG%\product.txt) do (if not defined PRODUCTMOUNT set "PRODUCTMOUNT=-M %%i")
for /f "skip=2 tokens=3" %%i in (%CONFIG%\product.txt) do (if not defined PRODUCTUUID set "PRODUCTUUID=-U %%i")
for /f "skip=11 tokens=3" %%i in (%CONFIG%\product.txt) do (if not defined PRODUCTINODES set "PRODUCTINODES=-i %%i")
for /f "skip=40 tokens=4" %%i in (%CONFIG%\product.txt) do (if not defined PRODUCTHASH set "PRODUCTHASH=-S %%i")
for /f "skip=41 tokens=3" %%i in (%CONFIG%\product.txt) do (if not defined PRODUCTSIZE set "PRODUCTSIZE=%%i")
%cECHO% {0A}{\n}&& if exist "%CONFIG%\%nPRODUCT%_fs*" ("%BIN%\fspatch" "%PRODUCT%" "%CONFIG%\%nPRODUCT%_fs_config.txt" && echo.)
if exist "%PRODUCT%" ("%WSL%" "$PWD/bin/linux/mkuserimg_mke2fs.sh" "$FORWSL/rom/%nPRODUCT%" "$FORWSL/build/%nPRODUCT%.img" %EXT% %nPRODUCT% %PRODUCTSIZE% %JOURNAL% %TIMESTAMP% -C "$FORWSL/config/%nPRODUCT%_fs_config.txt" -D "$FORWSL/rom/%nPRODUCT%" %PRODUCTLABEL% %PRODUCTMOUNT% %PRODUCTINODES% %PRODUCTUUID% %PRODUCTHASH% "$FORWSL/config/%nPRODUCT%_file_contexts.txt")
%cECHO% {06}&& timeout 15 && goto rebuildmenu
:system
mode con lines=21 cols=76 && cls
goto systemsymlink
:resumesystem
cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Building System.img                           [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
if not exist "%SYSTEM%" (%cECHO% {0C}{\n} System ROM Folder Not Found Plz Extract It First{\n}{06}{\n} && pause && goto rebuildmenu)
for /f "tokens=4" %%i in (%CONFIG%\system.txt) do (if not defined SYSTEMLABEL set "SYSTEMLABEL=-L %%i")
for /f "skip=1 tokens=4" %%i in (%CONFIG%\system.txt) do (if not defined SYSTEMMOUNT set "SYSTEMMOUNT=-M %%i")
for /f "skip=2 tokens=3" %%i in (%CONFIG%\system.txt) do (if not defined SYSTEMUUID set "SYSTEMUUID=-U %%i")
for /f "skip=11 tokens=3" %%i in (%CONFIG%\system.txt) do (if not defined SYSTEMINODES set "SYSTEMINODES=-i %%i")
for /f "skip=40 tokens=4" %%i in (%CONFIG%\system.txt) do (if not defined SYSTEMHASH set "SYSTEMHASH=-S %%i")
for /f "skip=41 tokens=3" %%i in (%CONFIG%\system.txt) do (if not defined SYSTEMSIZE set "SYSTEMSIZE=%%i")
%cECHO% {0A}{\n}&& if exist "%SYSTEM%" ("%WSL%" "$PWD/bin/linux/mkuserimg_mke2fs.sh" "$FORWSL/rom/%nSYSTEM%" "$FORWSL/build/%nSYSTEM%.img" %EXT% / %SYSTEMSIZE% %JOURNAL% %TIMESTAMP% -C "$FORWSL/config/%nSYSTEM%_root_fs_config.txt" -D "$FORWSL/rom/%nSYSTEM%" %SYSTEMLABEL% %SYSTEMMOUNT% %SYSTEMINODES% %SYSTEMUUID% %SYSTEMHASH% "$FORWSL/config/%nSYSTEM%_root_file_contexts.txt")
if exist "%BUILD%\%nSYSTEM%*" (echo / 0000 0000 00755)>"%CONFIG%\%nSYSTEM%_root_fs_config.txt" && if exist "%BUILD%\%nSYSTEM%*" ("%BIN%\fs_generator" "%BUILD%\%nSYSTEM%.img")>>"%CONFIG%\%nSYSTEM%_root_fs_config.txt"
%cECHO% {06}&& timeout 15 && goto rebuildmenu
:vendor
mode con lines=23 cols=76 && cls
goto vendorsymlink
:resumevendor
cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Building Vendor.img                           [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
if not exist "%VENDOR%" (%cECHO% {0C}{\n} Vendor ROM Folder Not Found Plz Extract It First{\n}{06}{\n} && pause && goto rebuildmenu)
for /f "tokens=4" %%i in (%CONFIG%\vendor.txt) do (if not defined VENDORLABEL set "VENDORLABEL=-L %%i")
for /f "skip=1 tokens=4" %%i in (%CONFIG%\vendor.txt) do (if not defined VENDORMOUNT set "VENDORMOUNT=-M %%i")
for /f "skip=2 tokens=3" %%i in (%CONFIG%\vendor.txt) do (if not defined VENDORUUID set "VENDORUUID=-U %%i")
for /f "skip=11 tokens=3" %%i in (%CONFIG%\vendor.txt) do (if not defined VENDORINODES set "VENDORINODES=-i %%i")
for /f "skip=40 tokens=4" %%i in (%CONFIG%\vendor.txt) do (if not defined VENDORHASH set "VENDORHASH=-S %%i")
for /f "skip=41 tokens=3" %%i in (%CONFIG%\vendor.txt) do (if not defined VENDORSIZE set "VENDORSIZE=%%i")
%cECHO% {0A}{\n}&& if exist "%CONFIG%\%nVENDOR%_fs*" ("%BIN%\fspatch" "%VENDOR%" "%CONFIG%\%nVENDOR%_fs_config.txt" && echo.)
if exist "%VENDOR%" ("%WSL%" "$PWD/bin/linux/mkuserimg_mke2fs.sh" "$FORWSL/rom/%nVENDOR%" "$FORWSL/build/%nVENDOR%.img" %EXT% %nVENDOR% %VENDORSIZE% %JOURNAL% %TIMESTAMP% -C "$FORWSL/config/%nVENDOR%_fs_config.txt" -D "$FORWSL/rom/%nVENDOR%" %VENDORLABEL% %VENDORMOUNT% %VENDORINODES% %VENDORUUID% %VENDORHASH% "$FORWSL/config/%nVENDOR%_file_contexts.txt")
%cECHO% {06}&& timeout 15 && goto rebuildmenu
:super
mode con lines=13 cols=76 && cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Building Super.img                            [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
if not exist "%BUILD%\odm*" (%cECHO% {0C}{\n} Odm.img Not Found Plz Build It First{\n}{06}{\n} && pause && goto rebuildmenu) else (if not exist "%BUILD%\product*" (%cECHO% {0C}{\n} Product.img Not Found Plz Build It First{\n}{06}{\n} && pause && goto rebuildmenu) else (if not exist "%BUILD%\system*" (%cECHO% {0C}{\n} System.img Not Found Plz Build It First{\n}{06}{\n} && pause && goto rebuildmenu) else (if not exist "%BUILD%\vendor*" (%cECHO% {0C}{\n} Vendor.img Not Found Plz Build It First{\n}{06}{\n} && pause && goto rebuildmenu))))
for /f "skip=41 tokens=3" %%i in (%CONFIG%\odm.txt) do (if not defined ODMSIZE set "ODMSIZE=%%i")
for /f "skip=41 tokens=3" %%i in (%CONFIG%\product.txt) do (if not defined PRODUCTSIZE set "PRODUCTSIZE=%%i")
for /f "skip=41 tokens=3" %%i in (%CONFIG%\system.txt) do (if not defined SYSTEMSIZE set "SYSTEMSIZE=%%i")
for /f "skip=41 tokens=3" %%i in (%CONFIG%\vendor.txt) do (if not defined VENDORSIZE set "VENDORSIZE=%%i")
for /f "skip=3 tokens=4" %%i in (%CONFIG%\super.txt) do (if not defined METASIZE set "METASIZE=%%i")
for /f "skip=4 tokens=4" %%i in (%CONFIG%\super.txt) do (if not defined SSLOTS set "SSLOTS=%%i")
for /f "skip=43 tokens=2" %%i in (%CONFIG%\super.txt) do (if not defined SUPERSIZE set "SUPERSIZE=%%i")
for /f "skip=52 tokens=2" %%i in (%CONFIG%\super.txt) do (if not defined GROUPNAME set "GROUPNAME=%%i")
for /f "skip=53 tokens=3" %%i in (%CONFIG%\super.txt) do (if not defined SUPERMAX set "SUPERMAX=%%i")
set "SUPERGROUP=%GROUPNAME%"
%cECHO% {0A}{\n} Building Super.img with Odm + Product + System + Vendor Images{\n} Plz Be Patient... {\n}&& "%WSL%" "$PWD/bin/linux/lpmake" --super-name %nSUPER% --metadata-size %METASIZE% --metadata-slots %SSLOTS% --device %nSUPER%:%SUPERSIZE% --group %SUPERGROUP%:%SUPERMAX% --partition %nSYSTEM%:%RWMODE%:%SYSTEMSIZE%:%GROUPNAME% --image %nSYSTEM%="$FORWSL/build/%nSYSTEM%.img" --partition %nPRODUCT%:%RWMODE%:%PRODUCTSIZE%:%GROUPNAME% --image %nPRODUCT%="$FORWSL/build/%nPRODUCT%.img" --partition %nVENDOR%:%RWMODE%:%VENDORSIZE%:%GROUPNAME% --image %nVENDOR%="$FORWSL/build/%nVENDOR%.img" --partition %nODM%:%RWMODE%:%ODMSIZE%:%GROUPNAME% --image %nODM%="$FORWSL/build/%nODM%.img" --sparse --output "$FORWSL/build/%nSUPER%.img" >nul 2>&1 && echo.
if exist "%BUILD%\%nSUPER%*" (echo  Compressing LZ4 Image... && ("%BIN%\lz4" -B6 -f --rm --content-size "%BUILD%\%nSUPER%.img" 2>nul))
%cECHO% {06}&& timeout 15 && goto rebuildmenu
:tar
cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Add Images To *.tar Archives                  [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
if exist "%ODIN%\AP*" (for /f "tokens=1,2,3 delims=_." %%i in ('dir /b %ODIN%\AP*') do (set "AP=%%i_%%j_%%k.tar"))
if exist "%ODIN%\BL*" (for /f "tokens=1,2,3 delims=_." %%i in ('dir /b %ODIN%\BL*') do (set "BL=%%i_%%j_%%k.tar"))
if exist "%ODIN%\CP*" (for /f "tokens=1,2,3 delims=_." %%i in ('dir /b %ODIN%\CP*') do (set "CP=%%i_%%j_%%k.tar"))
if exist "%ODIN%\CSC*" (for /f "tokens=1,2,3,4 delims=_." %%i in ('dir /b %ODIN%\CSC*') do (set "CSC_OXM=%%i_%%j_%%k_%%k.tar"))
if exist "%ODIN%\HOME*" (for /f "tokens=1,2,3,4,5 delims=_." %%i in ('dir /b %ODIN%\HOME*') do (set "HOME_CSC=%%i_%%j_%%k_%%l_%%m.tar"))
if exist "%SOURCE%\*.img" (cd "%SOURCE%" && "%BIN%\lz4" -B6 -f -m --rm --content-size "*.img" && cd "%TOOLS%" && move "%SOURCE%\*.lz4" "%BUILD%" >nul)
if exist "%BUILD%\vbmeta*" (copy "%BUILD%\vbmeta.img.lz4" "%BUILD%\vbmeta2.img.lz4" >nul)
if exist "%BUILD%\super.img.lz4" ("%BIN%\7z" a -sdel "%ODIN%\%AP%" "%BUILD%\super*" "%BUILD%\boot*" "%BUILD%\recovery*" "%BUILD%\vbmeta.*")
if exist "%BUILD%\vbmeta2*" (move "%BUILD%\vbmeta2*" "%BUILD%\vbmeta.img.lz4" >nul)
if exist "%BUILD%\vbmeta*" ("%BIN%\7z" a -sdel "%ODIN%\%BL%" "%BUILD%\vbmeta*")
if exist "%BUILD%\optics.img.lz4" (if exist "%BUILD%\prism.img.lz4" ("%BIN%\7z" a -sdel "%ODIN%\%CSC_OXM%" "%BUILD%\optics.img.lz4" "%BUILD%\prism.img.lz4"))
timeout 2 >nul && goto odin
:debloatmenu
mode con lines=13 cols=76 && cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Debloat Menu                                  [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
%cECHO% {0F}    1{08} -{0A} Debloat Rom Before Build{\n}
%cECHO% {0F}    2{08} -{#} Uninstall Apps                                   [{09}ADB Required{0A}]{\n}
%cECHO% {0F}    3{08} -{#} Deactivate Apps                                  [{09}ADB Required{0A}]{\n}
%cECHO% {0F}    8{08} -{#} Open Debloat List{\n}
%cECHO% {0F}    9{08} -{#} Open Deactivate List{\n}
%cECHO% {0F}    b{08} -{#} Back to Main Menu{\n}
%cECHO% {0F}    q{08} -{#} Exit{\n}{06}{\n}
choice /c 12389bq /n /m ".  Your Choice:"
if "%errorlevel%" == "1" (goto debloat)
if "%errorlevel%" == "2" (goto uninstall)
if "%errorlevel%" == "3" (goto deactivate)
if "%errorlevel%" == "4" (goto debloatlist)
if "%errorlevel%" == "5" (goto deactivatelist)
if "%errorlevel%" == "6" (goto mainmenu)
if "%errorlevel%" == "7" (goto exit)
:uninstall
set "DEL=%ADB% shell pm uninstall --user 0"
cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Uninstalling Bloat Apps                       [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
echo.
for /f "tokens=* usebackq" %%a in ("%MODS%\debloat_list") do ("%DEL%" %%a)
echo.
echo Done..
timeout 2 >nul && goto debloatmenu
:deactivate
set "FREEZE=%ADB% shell pm disable-user --user 0"
cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Deactivating Bloat Apps                       [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
echo.
for /f "tokens=* usebackq" %%a in ("%MODS%\deactivate_list") do ("%FREEZE%" %%a)
echo.
echo Done..
timeout 2 >nul && goto debloatmenu
:debloatlist
cd "%EXE%\notepad"
start notepad++ "%MODS%\debloat_list"
cd "%TOOLS%"
goto debloatmenu
:deactivatelist
cd %EXE%\notepad
start notepad++ "%MODS%\deactive_list"
cd "%TOOLS%"
goto debloatmenu
:modmenu
mode con lines=14 cols=76 && cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Modding Menu                                  [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
%cECHO% {0F}    1{08} -{0A} Add Parameter To CSC{\n}
%cECHO% {0F}    2{08} -{#} Add Parameter To Build.prop{\n}
%cECHO% {0F}    3{08} -{#} Optimize System Parameter                        [{09}ADB Required{0A}]{\n}
%cECHO% {0F}    4{08} -{#} Recompile Apps for SpeedUp                       [{09}ADB Required{0A}]{\n}
%cECHO% {0F}    8{08} -{#} Open CSC Mod List{\n}
%cECHO% {0F}    9{08} -{#} Open Build.prop Mod List{\n}
%cECHO% {0F}    b{08} -{#} Back To Main Menu{\n}
%cECHO% {0F}    q{08} -{#} Exit{\n}{06}{\n}
choice /c 123489bq /n /m ".  Your Choice:"
if "%errorlevel%" == "1" (goto cscmod)
if "%errorlevel%" == "2" (goto buildmod)
if "%errorlevel%" == "3" (goto optimize)
if "%errorlevel%" == "4" (goto cmdfast)
if "%errorlevel%" == "5" (goto csclist)
if "%errorlevel%" == "6" (goto buildproplist)
if "%errorlevel%" == "7" (goto mainmenu)
if "%errorlevel%" == "8" (goto exit)
:cscmod
set "N=" && if exist "%MODS%\tmp.cscfeature.xml" (del "%MODS%\tmp.cscfeature.xml" >nul)
cls
%cECHO% {08}##########################################################################{\n}
%cECHO% ###{0F} Modding CSCfeatures For Base Region           [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
%cECHO% {0A}&& if not exist "%OPTICS%" (%cECHO% {0C}{\n} Optics ROM Folder Not Found Plz Extract It First{\n}{06}{\n} && pause && goto modmenu) else (if not exist "%PRISM%" (%cECHO% {0C}{\n} Prism ROM Folder Not Found Plz Extract It First{\n}{06}{\n} && pause && goto modmenu))
if exist "%PRISM%\etc\sales_code.dat" (for /f "usebackq" %%i in ("%PRISM%\etc\sales_code.dat") do (set "CSC=%%i"))
%cECHO% {0F}    1{08} -{0A} Use Default Region:{09}%CSC%{0A}{\n}
%cECHO% {0F}    2{08} -{0A} Select Other Region{\n}
%cECHO% {0F}    b{08} -{0A} Back To Main Menu{\n}
%cECHO% {0F}    q{08} -{0A} Exit{\n}{06}{\n}
choice /c 12bq /n /m ". Which Region To Use?: "
if "%errorlevel%" == "1" (goto selectcsc)
if "%errorlevel%" == "2" (goto inputcsc)
if "%errorlevel%" == "3" (goto mainmenu)
if "%errorlevel%" == "4" (goto exit)
:inputcsc
cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Modding CSCfeatures For Base Region           [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
%cECHO% {06} && dir /d "%OPTICS%\configs\carriers\"| findstr [ & dir /d "%OPTICS%\configs\carriers\single\" | findstr [
set /p CSC="Type New Region Code from List: "
for %%b in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (set "CSC=!CSC:%%b=%%b!")
if not "!CSC:~3!" == "" (goto inputcsc) else (if "!CSC:~2!" == "" (goto inputcsc))
:selectcsc
if exist "%OPTICS%\configs\carriers\%CSC%*" (for /f "tokens=* usebackq delims=," %%a in ("%OPTICS%\configs\carriers\%CSC%\conf\system\cscfeature.xml") do (set /a N+=1 && echo %%a>>"%MODS%\tmp.cscfeature.xml" && if !N! EQU 7 set "N=" && goto stop)) else (if exist "%OPTICS%\configs\carriers\single\%CSC%*" (for /f "tokens=* usebackq delims=," %%a in ("%OPTICS%\configs\carriers\single\%CSC%\conf\system\cscfeature.xml") do (set /a N+=1 && echo %%a>>"%MODS%\tmp.cscfeature.xml" && if !N! EQU 7 set "N=" && goto stop)) else (echo Wrong CSC choosen && timeout 2 >nul && goto inputcsc))
:stop
type "%MODS%\mod.cscfeature.xml">>"%MODS%\tmp.cscfeature.xml"
if exist "%OPTICS%\configs\carriers\%CSC%*" (for /f "skip=7 tokens=* usebackq delims=," %%a in ("%OPTICS%\configs\carriers\%CSC%\conf\system\cscfeature.xml") do (echo %%a>>"%MODS%\tmp.cscfeature.xml")) else (if exist "%OPTICS%\configs\carriers\single\%CSC%*" (for /f "skip=7 tokens=* usebackq delims=," %%a in ("%OPTICS%\configs\carriers\single\%CSC%\conf\system\cscfeature.xml") do (echo %%a>>"%MODS%\tmp.cscfeature.xml")))
if exist "%OPTICS%\configs\carriers\%CSC%*" (move /y "%MODS%\tmp.cscfeature.xml" "%OPTICS%\configs\carriers\%CSC%\conf\system\cscfeature.xml" >nul) else (if exist "%OPTICS%\configs\carriers\single\%CSC%*" (move /y "%MODS%\tmp.cscfeature.xml" "%OPTICS%\configs\carriers\single\%CSC%\conf\system\cscfeature.xml" >nul))
timeout 5 >nul && echo Done..
goto modmenu
:buildmod
set "N=" && if exist "%MODS%\tmp.build.prop" (del "%MODS%\tmp.build.prop")
cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Modding \system\system\build.prop             [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
if not exist "%SYSTEM%" (%cECHO% {0C}{\n} System ROM Folder Not Found Plz Extract It First{\n}{06}{\n} && pause && goto modmenu) else (if not exist "%SYSTEM%\system\build.prop" (%cECHO% {0C}{\n} System Build.prop Not Found Plz Extract It First{\n}{06}{\n} && pause && goto modmenu))
for /f %%i in ('findstr /n /c:ro.build.display.id "%SYSTEM%\system\build.prop"') do (set "LINE1=%%i" && set /a "LINE1=!LINE1:~0,2!-1")
for /f %%i in ('findstr /n /c:ro.config.iccc_version "%SYSTEM%\system\build.prop"') do (set "LINE2=%%i" && set /a "LINE2=!LINE2:~0,3!-1")
for /f %%i in ('findstr /n /c:"# end of file" "%SYSTEM%\system\build.prop"') do (set "LINE3=%%i" && set /a "LINE3=!LINE3:~0,3!-1")
for /f "tokens=* usebackq" %%a in ("%SYSTEM%\system\build.prop") do (set /a N+=1 && echo %%a>>"%MODS%\tmp.build.prop" && if !N! EQU !LINE1! set /a "LINE1=!LINE1!+1" && goto stop1)
:stop1
set /a "N=%N%+1" && echo ro.build.display.id=F926BXXS2CVIG.Keldrion>>"%MODS%\tmp.build.prop"
for /f "skip=%LINE1% tokens=* usebackq" %%a in ("%SYSTEM%\system\build.prop") do (set /a N+=1 && echo %%a>>"%MODS%\tmp.build.prop" && if !N! EQU !LINE2! set /a "LINE2=!LINE2!+2" && goto stop2)
:stop2
set /a "N=%N%+2" && echo ro.config.iccc_version=iccc_disabled>>"%MODS%\tmp.build.prop" && echo ro.config.dmverity=false>>"%MODS%\tmp.build.prop"
for /f "skip=%LINE2% tokens=* usebackq" %%a in ("%SYSTEM%\system\build.prop") do (set /a N+=1 && echo %%a>>"%MODS%\tmp.build.prop" && if !N! EQU !LINE3! goto stop3)
:stop3
type "%MODS%\mod.build.prop">>"%MODS%\tmp.build.prop" && move /y "%MODS%\tmp.build.prop" "%SYSTEM%\system\build.prop" >nul
timeout 5 >nul && echo Done..
goto modmenu
:optimize
cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Customize System Now...                       [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
%cECHO% {0F}
%ADB% shell wm reset >nul
%ADB% shell cmd device_config put netd_native doh 1
%ADB% shell cmd device_config put privacy safety_center_is_enabled false
%ADB% shell cmd device_config put storage_native_boot picker_intent_enabled true
%ADB% shell settings put global accessibility_reduce_transparency 1
%ADB% shell settings put global adaptive_battery_management_enabled 1
%ADB% shell settings put global animator_duration_scale 0.75
%ADB% shell settings put global app_standby_enabled 0
%ADB% shell settings put global art_verifier_verify_debuggable 01
%ADB% shell settings put global assisted_gps_enabled 1
%ADB% shell settings put global automatic_power_save_mode 0
%ADB% shell settings put global bixby_pregranted_permissions 0
%ADB% shell settings put global ble_scan_always_enabled 0
%ADB% shell settings put global cached_apps_freezer enabled
%ADB% shell settings put global colortheme_app_icon 0
%ADB% shell settings put global disable_window_blurs 1
%ADB% shell settings put global dynamic_power_savings_enabled 0
%ADB% shell settings put global edge_enable 0
%ADB% shell settings put global emergency_tone 0
%ADB% shell settings put global enable_back_animation 1
%ADB% shell settings put global enhanced_processing 1
%ADB% shell settings put global galaxy_system_update_block 0
%ADB% shell settings put global google_core_control 0
%ADB% shell settings put global heads_up_notifications_enabled 1
%ADB% shell settings put global hotword_detection_enabled 0
%ADB% shell settings put global low_power 0
%ADB% shell settings put global mobile_data_always_on 0
%ADB% shell settings put global multisound_state 0
%ADB% shell settings put global network_recommendations_enabled 0
%ADB% shell settings put global network_scoring_ui_enabled 0
%ADB% shell settings put global online_manual_url 0
%ADB% shell settings put global power_sounds_enabled 1
%ADB% shell settings put global preferred_network_mode 9,9
%ADB% shell settings put global preferred_network_mode1 9
%ADB% shell settings put global private_dns_specifier dns.adguard-dns.com
%ADB% shell settings put global ram_expand_size 0
%ADB% shell settings put global restricted_device_performance 1,\ 1
%ADB% shell settings put global sem_enhanced_cpu_responsiveness 1
%ADB% shell settings put global sem_wifi_network_rating_scorer_enabled 0
%ADB% shell settings put global sem_wifi_switch_to_better_wifi_enabled 0
%ADB% shell settings put global settings_enable_clear_calling true
%ADB% shell settings put global smart_replies_enabled 0
%ADB% shell settings put global swipe_to_call_message 1
%ADB% shell settings put global transition_animation_scale 0.75
%ADB% shell settings put global upload_apk_enable 1
%ADB% shell settings put global uwb_enabled 0
%ADB% shell settings put global verifier_verify_adb_installs 0
%ADB% shell settings put global wifi_power_save 0
%ADB% shell settings put global wifi_networks_available_notification_on 0
%ADB% shell settings put global wifi_scan_always_enabled 1
%ADB% shell settings put global window_animation_scale 0.75
%ADB% shell settings put global zram_enabled 0
%ADB% shell settings put secure accessibility_captioning_font_scale 0.7
%ADB% shell settings put secure adaptive_charging_enabled 0
%ADB% shell settings put secure adaptive_connectivity_enabled 0
%ADB% shell settings put secure adaptive_sleep 0
%ADB% shell settings put secure assistant 0
%ADB% shell settings put secure back_gesture_input_scale_left 0.75
%ADB% shell settings put secure back_gesture_input_scale_right 0.75
%ADB% shell settings put secure backup_enabled 1
%ADB% shell settings put secure brightness_on_top 1
%ADB% shell settings put secure camera_double_twist_to_flip_enabled 0
%ADB% shell settings put secure charging_sounds_enabled 1
%ADB% shell settings put secure charging_vibration_enabled 1
%ADB% shell settings put secure clipboard_show_access_notifications 1
%ADB% shell settings put secure double_tap_to_wake 1
%ADB% shell settings put secure fingerprint_always_on 0
%ADB% shell settings put secure fingerprint_effect 1
%ADB% shell settings put secure fingerprint_on_screen_tips 1
%ADB% shell settings put secure fingerprint_samsungaccount_confirmed 1
%ADB% shell settings put secure fingerprint_screen_lock 1
%ADB% shell settings put secure fingerprint_screen_off_icon_aod 1
%ADB% shell settings put secure fingerprint_settings_create 0
%ADB% shell settings put secure fingerprint_used_samsungaccount 1
%ADB% shell settings put secure fmm_community_finding 0
%ADB% shell settings put secure fmm_unlock_recovery 0
%ADB% shell settings put secure friends_plugin_connected 0
%ADB% shell settings put secure game_auto_temperature_control 0
%ADB% shell settings put secure game_home_enable 1
%ADB% shell settings put secure hush_gesture_used 0
%ADB% shell settings put secure install_non_market_apps 1
%ADB% shell settings put secure lock_screen_allow_private_notifications 1
%ADB% shell settings put secure lock_screen_lock_after_timeout 0
%ADB% shell settings put secure lock_screen_owner_info_enabled 1
%ADB% shell settings put secure lock_screen_show_notifications 1
%ADB% shell settings put secure lock_screen_show_silent_notifications 0
%ADB% shell settings put secure long_press_timeout 250
%ADB% shell settings put secure multi_control_connection_state 0
%ADB% shell settings put secure multi_press_timeout 250
%ADB% shell settings put secure notification_badging 1
%ADB% shell settings put secure notification_bubbles 0
%ADB% shell settings put secure notification_history_enabled 0
%ADB% shell settings put secure odi_captions_volume_ui_enabled 0
%ADB% shell settings put secure one_handed_mode_activated 0
%ADB% shell settings put secure one_handed_mode_enabled 0
%ADB% shell settings put secure package_verifier_state 0
%ADB% shell settings put secure qspanel_media_quickcontrol_bar_available 0
%ADB% shell settings put secure qspanel_media_quickcontrol_bar_available_on_top 0
%ADB% shell settings put secure screen_extra_brightness 1
%ADB% shell settings put secure screensaver_activate_on_dock 0
%ADB% shell settings put secure screensaver_activate_on_sleep 0
%ADB% shell settings put secure screensaver_enabled 0
%ADB% shell settings put secure show_notification_snooze 1
%ADB% shell settings put secure silence_gesture 0
%ADB% shell settings put secure skip_gesture 0
%ADB% shell settings put secure smartspace 0
%ADB% shell settings put secure spell_checker_enabled 1
%ADB% shell settings put secure user_full_data_backup_aware 1
%ADB% shell settings put secure volume_hush_gesture 0
%ADB% shell settings put secure wake_gesture_enabled 0
%ADB% shell settings put system SEM_VIBRATION_FORCE_TOUCH_INTENSITY 5
%ADB% shell settings put system SEM_VIBRATION_NOTIFICATION_INTENSITY 5
%ADB% shell settings put system SEM_VIBRATION_RING_INTENSITY 5
%ADB% shell settings put system VIB_FEEDBACK_MAGNITUDE 5
%ADB% shell settings put system VIB_RECVCALL_MAGNITUDE 5
%ADB% shell settings put system accelerometer_rotation 1
%ADB% shell settings put system access_control_enabled 0
%ADB% shell settings put system adaptive_fast_charging 1
%ADB% shell settings put system android.wallpaper.settings_systemui_transparency 0
%ADB% shell settings put system aod_charging_mode 0
%ADB% shell settings put system aod_mode 0
%ADB% shell settings put system aod_tap_to_show_mode 0
%ADB% shell settings put system call_extra_volume 1
%ADB% shell settings put system call_noise_reduction 1
%ADB% shell settings put system camera_feedback_vibrate 1
%ADB% shell settings put system charging_info_always 1
%ADB% shell settings put system cocktail_bar_enabled_cocktails 0
%ADB% shell settings put system colortheme_app_icon 0
%ADB% shell settings put system dialing_keypad_vibrate 1
%ADB% shell settings put system direct_share 1
%ADB% shell settings put system display_caller_info_card 1
%ADB% shell settings put system double_tab_to_wake_up 1
%ADB% shell settings put system double_tap_to_sleep 1
%ADB% shell settings put system dtmf_tone 0
%ADB% shell settings put system edge_lighting 1
%ADB% shell settings put system enable_smart_capture 1
%ADB% shell settings put system epdg_support1 0
%ADB% shell settings put system facewidget_music_transparency 1
%ADB% shell settings put system fingerprint_guide_shown 1
%ADB% shell settings put system fmm_notification_other 0
%ADB% shell settings put system gearhead:driving_mode_settings_enabled 0
%ADB% shell settings put system haptic_feedback_enabled 1
%ADB% shell settings put system intelligent_sleep_mode 0
%ADB% shell settings put system k2hd_effect 1
%ADB% shell settings put system lift_to_wake 0
%ADB% shell settings put system lock_editor_support_touch_hold 0
%ADB% shell settings put system lock_noticard_opacity 0
%ADB% shell settings put system lockscreen_show_shortcut 1
%ADB% shell settings put system lockscreen_sounds_enabled 1
%ADB% shell settings put system master_motion 0
%ADB% shell settings put system mcf_continuity 0
%ADB% shell settings put system mcf_continuity_nearby_device_state 0
%ADB% shell settings put system mcf_permission_denied 1
%ADB% shell settings put system media_vibration_intensity 4
%ADB% shell settings put system motion_engine 0
%ADB% shell settings put system multi_control_enabled 1
%ADB% shell settings put system multicore_packet_scheduler 1
%ADB% shell settings put system navigation_gestures_vibrate 1
%ADB% shell settings put system nearby_scanning_enabled 0
%ADB% shell settings put system nearby_scanning_permission_allowed 0
%ADB% shell settings put system notification_light_pulse 0
%ADB% shell settings put system rakuten_denwa 0
%ADB% shell settings put system remote_control 0
%ADB% shell settings put system samsung_errorlog_agree 0
%ADB% shell settings put system screen_auto_brightness_adj 0.65
%ADB% shell settings put system screen_off_pocket 0
%ADB% shell settings put system screen_transition_effect 1
%ADB% shell settings put system send_security_reports 0
%ADB% shell settings put system sound_alive_effect 1
%ADB% shell settings put system sound_effects_enabled 1
%ADB% shell settings put system super_fast_charging 1
%ADB% shell settings put system surface_palm_swipe 0
%ADB% shell settings put system surface_palm_touch 0
%ADB% shell settings put system sync_vibration_with_notification 1
%ADB% shell settings put system sync_vibration_with_ringtone 1
%ADB% shell settings put system tube_amp_effect 1
%ADB% shell settings put system vibrate_when_ringing 1
%ADB% shell settings put system vibration_sound_enabled 1
%ADB% shell settings put system wifi_call_enable1 0
%ADB% shell settings put system wireless_fast_charging 0
%ADB% shell wm disable-blur
%ADB% shell wm reset
echo ...Done!
pause 1 >nul
%ADB% reboot
goto modmenu
:cmdfast
cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Recompile Apps For SpeedUp                    [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
echo.
%ADB% shell cmd package compile -m speed-profile -a
echo.
echo Done..
timeout 2 >nul
goto modmenu
:csclist
cd %EXE%\notepad
start notepad++ "%MODS%\mod.cscfeature.xml"
cd "%TOOLS%"
goto modmenu
:buildproplist
cd %EXE%\notepad
start notepad++ "%MODS%\mod.build.prop"
cd "%TOOLS%"
goto modmenu
:adbmenu
cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} [A]ndroid[D]evice[B]ridge Menu                [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
%cECHO% {0F}    1{08} -{0A} Start [A]ndroid[D]evice[B]ridge{\n}
%cECHO% {0F}    2{08} -{0A} Get Device Info{\n}
%cECHO% {0F}    3{08} -{0A} Push Apks To /sdcard/.apk{\n}
%cECHO% {0F}    4{08} -{0A} Pull Apks From /sdcard/.apk{\n}
%cECHO% {0F}    b{08} -{0A} Back To Main Menu{\n}
%cECHO% {0F}    q{08} -{0A} Exit{\n}{06}{\n}
choice /c 1234bq /n /m " Your Choice: "
if "%errorlevel%" == "1" (goto startadb)
if "%errorlevel%" == "2" (goto device)
if "%errorlevel%" == "3" (goto adbpush)
if "%errorlevel%" == "4" (goto adbpull)
if "%errorlevel%" == "5" (goto mainmenu)
if "%errorlevel%" == "6" (goto exit)
:startadb
cls
%ADB% kill-server >nul
%ADB% start-server
echo.
%ADB% devices
for /F "delims=" %%a in ('%ADB% shell getprop ro.product.model') do (set DEVICE=%%a)
for /F "delims=" %%b in ('%ADB% shell getprop ril.product_code') do (set PRODUCT=%%b)
for /F "delims=" %%c in ('%ADB% shell getprop ro.build.display.id') do (set FW=%%c)
for /F "delims=" %%d in ('%ADB% shell getprop ro.oem.key1') do (set CSC1=%%d)
for /F "delims=" %%e in ('%ADB% shell getprop ro.oem.key2') do (set CSC2=%%e)
timeout 2 >nul
goto adbmenu
:device
cls
echo.
echo Detected: [%DEVICE%] [%PRODUCT%]
echo Firmware: [%FW%] [%CSC1%] [%CSC2%]
echo. && pause
goto adbmenu
:adbpull
cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Push Apk Folder To internal                   [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
echo.
%ADB% push %MODS%\apk\ /sdcard/
timeout 2 >nul
goto adbmenu
:adbpush
cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Pull Apk Folder From internal                 [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
echo.
%ADB% pull /sdcard/apk %MODS%
timeout 2 >nul
goto adbmenu
:frija
cd "%EXE%\frija"
start frija
cd "%TOOLS%"
goto mainmenu
:odin
cd "%EXE%\odin"
start odin3
cd "%TOOLS%"
goto mainmenu
:installwsl
cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Installing [W]indows[S]ubsystem[L]inux        [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
echo.
%WSL% --set-default-version 1
echo.
%WSL% --install -d Ubuntu-20.04
echo.
%WSL% --set-default Ubuntu-20.04
echo.
echo Done..
timeout 2 >nul
goto mainmenu
:fchooser
%cEcho% {06}& set /p "=. Plz Choose *.zip Archiv                      !Newline!" <NUL
set dialog="about:<input type=file id=FILE><script>FILE.click();new ActiveXObject
set dialog=%dialog%('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FILE.value);
set dialog=%dialog%close();resizeTo(0,0);</script>"
for /f "tokens=* delims=" %%p in ('mshta.exe %dialog%') do (set "FILE=%%p")
%cEcho% {0A}& set /p "=. Extracting Zip Archiv Now, Plz Be Patient...  !Newline!" <NUL
%BIN%\7z e -bb3 -aoa -o%SOURCE% %FILE% >nul 2>&1 && goto resume2
%cECHO% {0C}&& echo  No Archiv Selected Going Back To Rommenu... && timeout 3 >nul && goto rommenu
:debloat
cls
%cECHO% {08}###########################################################################{\n}
%cECHO% ###{0F} Debloat Stock Rom                             [Kels_Kitchen_v%VER%]{#} ###{\n}
echo ###########################################################################
%cECHO% {0A}{\n}&& if not exist %PRISM% (echo Prism ROM Folder Not Found, Plz Extract It First && pause && goto debloatmenu) else (if not exist "%PRODUCT%" (echo Product ROM Folder Not Found Plz Extract It First && pause && goto debloatmenu) else (if not exist "%SYSTEM%" (echo System ROM Folder Not Found Plz Extract It First && pause && goto debloatmenu) else (if not exist "%VENDOR%" (echo Vendor ROM Folder Not Found Plz Extract It First && pause && goto debloatmenu))))
rmdir /s /q "%PRISM%\app\" && mkdir "%PRISM%\app\" && echo Deleted..
mkdir "%SOURCE%\data" && cd "%PRISM%\HWRDB\data\" && for %%d in (*ar* *DE* *GB* *US* *ES* *FR* *RO* *RU*) do (move %%d "%SOURCE%\data" >nul)
cd "%TOOLS%" && rmdir /s /q "%PRISM%\HWRDB\data\" && move "%SOURCE%\data" "%PRISM%\HWRDB\" >nul
rmdir /s /q "%PRISM%\media\carriers\single\PRT\" && mkdir "%PRISM%\media\carriers\single\PRT" && echo Deleted..
rmdir /s /q "%PRISM%\preload\" && mkdir "%PRISM%\preload" && echo Deleted..
rmdir /s /q "%PRISM%\priv-app\" && mkdir "%PRISM%\priv-app" && echo Deleted..
mkdir "%SOURCE%\SwiftKey" && cd "%PRISM%\sipdb\SwiftKey\" && for /d %%f in (*ar* *de* *en_gb* *en_us* *es_es* *fr_fr* *ro* *ru*) do (move %%f "%SOURCE%\SwiftKey" >nul)
cd "%TOOLS%" && rmdir /s /q "%PRISM%\sipdb\SwiftKey\" && move "%SOURCE%\SwiftKey" "%PRISM%\sipdb\" >nul
rmdir /s /q "%PRISM%\sipdb\Xt9\" && mkdir "%PRISM%\sipdb\Xt9" && echo Deleted..
for /d %%f in ("%PRODUCT%\app\Chrome*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%PRODUCT%\app\com.google.mainline.telemetry*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%PRODUCT%\app\DuoStub*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%PRODUCT%\app\Gmail*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%PRODUCT%\app\GoogleCalendarSyncAdapter*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%PRODUCT%\app\GoogleLocationHistory*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%PRODUCT%\app\Maps*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%PRODUCT%\app\SpeechServicesByGoogle*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%PRODUCT%\app\YouTube*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%PRODUCT%\overlay\FontNotoSerifSource*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%PRODUCT%\priv-app\AndroidAutoStub*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%PRODUCT%\priv-app\CarrierWifi*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%PRODUCT%\priv-app\GooglePartnerSetup*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%PRODUCT%\priv-app\HotwordEnrollment*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%PRODUCT%\priv-app\Messages*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%PRODUCT%\priv-app\PrivateComputeServices*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%PRODUCT%\priv-app\Turbo*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%PRODUCT%\priv-app\Velvet*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\AASAservice*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\AddOnComposer*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\AllShareAware*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\AllshareFileShare*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\AR*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\AutomationTest_FB*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\BasicDreams*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\BBCAgent*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\BixbyWakeup*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\BlockchainBasicKit*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\BookmarkProvider*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\Cameralyzer*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\ChromeCustomizations*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\ClipboardEdge*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\CocktailQuickTool*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\ContainerService*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\DAAgent*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\DictDiotekForSec*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\DRParser*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\EasterEgg*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\EasymodeContactsWidget*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\EasyOneHand*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\EdmSimPinService*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\EmergencyProvider*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\Factory*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\Fast*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\FBAppManager_NS*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\Foundation*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\GearManagerStub*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\GooglePrintRecommendationService*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\HiyaService*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\KidsHome_Installer*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\LinkSharing*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\Live*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\MAPSAgent*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\MDMApp*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\MdxKitService*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\MinusOnePage*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\Notes*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\PacProcessor*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\PartnerBookmarksProvider*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\PhotoTable*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\PrintSpooler*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\Privacy*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\RcsSettings*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\SafetyInformation*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\SamsungOne*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\SamsungPassAutofill*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\SecFactoryPhoneTest*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\SecHTMLViewer*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\ShortcutBackupService*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\SilentLog*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\SimAppDialog*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\SmartMirroring*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\SmartSwitchAgent*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\SmartTethering*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\StickerCenter*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\Stk*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\UniversalMDMClient*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\VisionIntelligence*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\VTCameraSetting*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\WebManual*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\WifiGuider*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\app\WlanTest*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
del /f /q  "%SYSTEM%\system\etc\sysconfig\samsungauthframework.xml" 2>nul && echo Deleted..
for /d %%f in ("%SYSTEM%\system\priv-app\AirReadingGlass*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\AppUpdateCenter*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\ARE*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\AuthFramework*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\AutoDoodle*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\AvatarEmojiSticker*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\Bixby*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\BlueLightFilter*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\BuiltInPrintService*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\CallLogBackup*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\CIDManager*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\CMHProvider*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\Crane*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\DesktopModeUiService*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\DeXonPC*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\DiagMonAgent*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\Digital*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\DynamicLockscreen*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\EarphoneTypeC*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\EasySetup*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\EnhancedAttestationAgent*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\FaceService*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\FB*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\Fmm*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\FotaAgent*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\GpuWatchApp*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\HashTagService*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\HdmApk*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\HwModuleTest*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\IpsGeofence*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\KLMSAgent*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\KnoxAIFrameworkApp*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\knoxanalyticsagent*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\KnoxCore*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\KnoxDesktopLauncher*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\KnoxPushManager*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\KPECore*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\LinkToWindowsService*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\ManagedProvisioning*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\ModemServiceMode*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\NSDSWebApp*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\NSFusedLocation*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\OmaCP*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\OMCAgent*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\OneDrive*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\PaymentFramework*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\PeopleStripe*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\PeripheralFramework*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\PhoneErrService*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\ProxyHandler*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\Quickboard*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\Routines*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SamsungBilling*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SamsungCarKeyFw*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SamsungExperienceService*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SamsungMagnifier*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SamsungPass*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SamsungPositioning*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SCameraSDKService*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SDMConfig*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SEMFactoryApp*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SendHelpMessage*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\serviceModeApp_FB*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SettingsBixby*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SharedStorageBackup*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\ShareLive*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SKMSAgent*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SmartCallProvider*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SmartEpdgTestApp*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SmartEye*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\smartfaceservice*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SmartManager_v6*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SmartSwitchAssistant*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SmartThingsKit*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SOAgent*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SPPPushClient*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\StickerFaceARAvatar*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\StoryService*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SumeNNService*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SVCAgent*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\SVoiceIME*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\Tag*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\TaskEdgePanel*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\Upday*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\UserDictionaryProvider*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\VpnDialogs*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\priv-app\YourPhone*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\system_ext\priv-app\GoogleFeedback*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
for /d %%f in ("%SYSTEM%\system\system_ext\priv-app\WallpaperCropper*") do (rmdir /s /q %%f && echo %%~nf Deleted..)
del /f /q "%SYSTEM%\system\etc\sysconfig\samsungpassapp.xml" "%SYSTEM%\system\etc\permissions\knoxsdk_mdm*" "%SYSTEM%\system\etc\permissions\knoxsdk_edm*" 2>nul && echo Deleted..
rmdir /s /q "%SYSTEM%\system\hidden\" && mkdir "%SYSTEM%\system\hidden\" && echo Deleted..
rmdir /s /q "%SYSTEM%\system\preload\" && mkdir "%SYSTEM%\system\preload\"  && echo Deleted..
cd "%SYSTEM%\system\tts\lang_SMT\" && for /d %%f in (*en_GB* *es_MX* *pt_BR* *ru_RU*) do (rmdir /s /q %%f && echo %%~nf Deleted..)
del /f /q "%VENDOR%\recovery-from-boot.p" 2>nul && echo Deleted.. && echo.
timeout 10 >nul && goto rebuildmenu
:systemsymlink
del /a:a "%SYSTEM%\bin" 2>nul & rmdir /s /q %SYSTEM%\bin 2>nul & mklink /d "%SYSTEM%\bin" "/system/bin" >nul 2>&1
del /a:a "%SYSTEM%\bugreports" & mklink "%SYSTEM%\bugreports" "/data/user_de/0/com.android.shell/files/bugreports" >nul 2>&1
del /a:a "%SYSTEM%\d" & mklink "%SYSTEM%\d" "/sys/kernel/debug" >nul 2>&1
del /a:a "%SYSTEM%\etc" 2>nul & rmdir /s /q %SYSTEM%\etc 2>nul & mklink /d "%SYSTEM%\etc" "/system/etc" >nul 2>&1
del /a:a "%SYSTEM%\init" & mklink "%SYSTEM%\init" "/system/bin/init" >nul 2>&1
del /a:a "%SYSTEM%\odm\app" & mklink "%SYSTEM%\odm\app" "/vendor/odm/app" >nul 2>&1
del /a:a "%SYSTEM%\odm\bin" & mklink "%SYSTEM%\odm\bin" "/vendor/odm/bin" >nul 2>&1
del /a:a "%SYSTEM%\odm\etc" & mklink "%SYSTEM%\odm\etc" "/vendor/odm/etc" >nul 2>&1
del /a:a "%SYSTEM%\odm\firmware" & mklink "%SYSTEM%\odm\firmware" "/vendor/odm/firmware" >nul 2>&1
del /a:a "%SYSTEM%\odm\framework" & mklink "%SYSTEM%\odm\framework" "/vendor/odm/framework" >nul 2>&1
del /a:a "%SYSTEM%\odm\lib" & mklink "%SYSTEM%\odm\lib" "/vendor/odm/lib" >nul 2>&1
del /a:a "%SYSTEM%\odm\lib64" & mklink "%SYSTEM%\odm\lib64" "/vendor/odm/lib64" >nul 2>&1
del /a:a "%SYSTEM%\odm\overlay" & mklink "%SYSTEM%\odm\overlay" "/vendor/odm/overlay" >nul 2>&1
del /a:a "%SYSTEM%\odm\priv-app" & mklink "%SYSTEM%\odm\priv-app" "/vendor/odm/priv-app" >nul 2>&1
del /a:a "%SYSTEM%\odm\usr" & mklink "%SYSTEM%\odm\usr" "/vendor/odm/usr" >nul 2>&1
del /a:a "%SYSTEM%\odm_dlkm\etc" & mklink "%SYSTEM%\odm_dlkm\etc" "/odm/odm_dlkm/etc" >nul 2>&1
del /a:a "%SYSTEM%\sdcard" & mklink "%SYSTEM%\sdcard" "/storage/self/primary" >nul 2>&1
del /a:a "%SYSTEM%\system\app\NfcNci\lib\arm64\libnfc_nxpsn_jni.so" & mklink "%SYSTEM%\system\app\NfcNci\lib\arm64\libnfc_nxpsn_jni.so" "/system/lib64/libnfc_nxpsn_jni.so" >nul 2>&1
del /a:a "%SYSTEM%\system\app\UwbUci\lib\arm64\libtflite_uwb_jni.so" & mklink "%SYSTEM%\system\app\UwbUci\lib\arm64\libtflite_uwb_jni.so" "/system/lib64/libtflite_uwb_jni.so" >nul 2>&1
del /a:a "%SYSTEM%\system\app\UwbUci\lib\arm64\libssuwb_uci_jni.so" & mklink "%SYSTEM%\system\app\UwbUci\lib\arm64\libssuwb_uci_jni.so" "/system/lib64/libssuwb_uci_jni.so" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\[" & mklink "%SYSTEM%\system\bin\[" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\acpi" & mklink "%SYSTEM%\system\bin\acpi" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\app_process" & mklink "%SYSTEM%\system\bin\app_process" "app_process64" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\base64" & mklink "%SYSTEM%\system\bin\base64" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\basename" & mklink "%SYSTEM%\system\bin\basename" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\blockdev" & mklink "%SYSTEM%\system\bin\blockdev" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\bootstrap\linker_asan" & mklink "%SYSTEM%\system\bin\bootstrap\linker_asan" "linker" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\bootstrap\linker_asan64" & mklink "%SYSTEM%\system\bin\bootstrap\linker_asan64" "linker64" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\bunzip2" & mklink "%SYSTEM%\system\bin\bunzip2" "bzip2" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\bzcat" & mklink "%SYSTEM%\system\bin\bzcat" "bzip2" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\cal" & mklink "%SYSTEM%\system\bin\cal" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\cat" & mklink "%SYSTEM%\system\bin\cat" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\chattr" & mklink "%SYSTEM%\system\bin\chattr" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\chcon" & mklink "%SYSTEM%\system\bin\chcon" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\chgrp" & mklink "%SYSTEM%\system\bin\chgrp" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\chmod" & mklink "%SYSTEM%\system\bin\chmod" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\chown" & mklink "%SYSTEM%\system\bin\chown" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\chroot" & mklink "%SYSTEM%\system\bin\chroot" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\chrt" & mklink "%SYSTEM%\system\bin\chrt" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\cksum" & mklink "%SYSTEM%\system\bin\cksum" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\clear" & mklink "%SYSTEM%\system\bin\clear" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\cmp" & mklink "%SYSTEM%\system\bin\cmp" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\comm" & mklink "%SYSTEM%\system\bin\comm" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\cp" & mklink "%SYSTEM%\system\bin\cp" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\cpio" & mklink "%SYSTEM%\system\bin\cpio" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\cut" & mklink "%SYSTEM%\system\bin\cut" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\date" & mklink "%SYSTEM%\system\bin\date" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\dd" & mklink "%SYSTEM%\system\bin\dd" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\defrag.f2fs" & mklink "%SYSTEM%\system\bin\defrag.f2fs" "fsck.f2fs" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\devmem" & mklink "%SYSTEM%\system\bin\devmem" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\df" & mklink "%SYSTEM%\system\bin\df" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\diff" & mklink "%SYSTEM%\system\bin\diff" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\dirname" & mklink "%SYSTEM%\system\bin\dirname" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\disable-verity" & mklink "%SYSTEM%\system\bin\disable-verity" "set-verity-state" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\dmesg" & mklink "%SYSTEM%\system\bin\dmesg" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\dos2unix" & mklink "%SYSTEM%\system\bin\dos2unix" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\du" & mklink "%SYSTEM%\system\bin\du" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\dump.f2fs" & mklink "%SYSTEM%\system\bin\dump.f2fs" "fsck.f2fs" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\echo" & mklink "%SYSTEM%\system\bin\echo" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\egrep" & mklink "%SYSTEM%\system\bin\egrep" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\enable-verity" & mklink "%SYSTEM%\system\bin\enable-verity" "set-verity-state" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\env" & mklink "%SYSTEM%\system\bin\env" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\expand" & mklink "%SYSTEM%\system\bin\expand" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\expr" & mklink "%SYSTEM%\system\bin\expr" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\fallocate" & mklink "%SYSTEM%\system\bin\fallocate" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\false" & mklink "%SYSTEM%\system\bin\false" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\fgrep" & mklink "%SYSTEM%\system\bin\fgrep" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\file" & mklink "%SYSTEM%\system\bin\file" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\find" & mklink "%SYSTEM%\system\bin\find" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\flock" & mklink "%SYSTEM%\system\bin\flock" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\fmt" & mklink "%SYSTEM%\system\bin\fmt" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\free" & mklink "%SYSTEM%\system\bin\free" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\fsync" & mklink "%SYSTEM%\system\bin\fsync" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\getconf" & mklink "%SYSTEM%\system\bin\getconf" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\getenforce" & mklink "%SYSTEM%\system\bin\getenforce" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\getevent" & mklink "%SYSTEM%\system\bin\getevent" "toolbox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\getprop" & mklink "%SYSTEM%\system\bin\getprop" "toolbox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\grep" & mklink "%SYSTEM%\system\bin\grep" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\groups" & mklink "%SYSTEM%\system\bin\groups" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\gunzip" & mklink "%SYSTEM%\system\bin\gunzip" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\gzip" & mklink "%SYSTEM%\system\bin\gzip" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\head" & mklink "%SYSTEM%\system\bin\head" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\hostname" & mklink "%SYSTEM%\system\bin\hostname" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\hwclock" & mklink "%SYSTEM%\system\bin\hwclock" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\i2cdetect" & mklink "%SYSTEM%\system\bin\i2cdetect" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\i2cdump" & mklink "%SYSTEM%\system\bin\i2cdump" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\i2cget" & mklink "%SYSTEM%\system\bin\i2cget" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\i2cset" & mklink "%SYSTEM%\system\bin\i2cset" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\iconv" & mklink "%SYSTEM%\system\bin\iconv" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\id" & mklink "%SYSTEM%\system\bin\id" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\ifconfig" & mklink "%SYSTEM%\system\bin\ifconfig" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\inotifyd" & mklink "%SYSTEM%\system\bin\inotifyd" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\insmod" & mklink "%SYSTEM%\system\bin\insmod" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\install" & mklink "%SYSTEM%\system\bin\install" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\ionice" & mklink "%SYSTEM%\system\bin\ionice" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\iorenice" & mklink "%SYSTEM%\system\bin\iorenice" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\ip-wrapper-1.0" & mklink "%SYSTEM%\system\bin\ip-wrapper-1.0" "netutils-wrapper-1.0" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\ip6tables" & mklink "%SYSTEM%\system\bin\ip6tables" "iptables" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\ip6tables-restore" & mklink "%SYSTEM%\system\bin\ip6tables-restore" "iptables" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\ip6tables-save" & mklink "%SYSTEM%\system\bin\ip6tables-save" "iptables" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\ip6tables-wrapper-1.0" & mklink "%SYSTEM%\system\bin\ip6tables-wrapper-1.0" "netutils-wrapper-1.0" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\iptables-restore" & mklink "%SYSTEM%\system\bin\iptables-restore" "iptables" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\iptables-save" & mklink "%SYSTEM%\system\bin\iptables-save" "iptables" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\iptables-wrapper-1.0" & mklink "%SYSTEM%\system\bin\iptables-wrapper-1.0" "netutils-wrapper-1.0" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\kill" & mklink "%SYSTEM%\system\bin\kill" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\killall" & mklink "%SYSTEM%\system\bin\killall" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\linker" & mklink "%SYSTEM%\system\bin\linker" "/apex/com.android.runtime/bin/linker" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\linker64" & mklink "%SYSTEM%\system\bin\linker64" "/apex/com.android.runtime/bin/linker64" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\linker_asan" & mklink "%SYSTEM%\system\bin\linker_asan" "/apex/com.android.runtime/bin/linker" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\linker_asan64" & mklink "%SYSTEM%\system\bin\linker_asan64" "/apex/com.android.runtime/bin/linker64" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\linkerconfig" & mklink "%SYSTEM%\system\bin\linkerconfig" "/apex/com.android.runtime/bin/linkerconfig" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\ln" & mklink "%SYSTEM%\system\bin\ln" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\load_policy" & mklink "%SYSTEM%\system\bin\load_policy" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\log" & mklink "%SYSTEM%\system\bin\log" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\logname" & mklink "%SYSTEM%\system\bin\logname" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\losetup" & mklink "%SYSTEM%\system\bin\losetup" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\ls" & mklink "%SYSTEM%\system\bin\ls" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\lsattr" & mklink "%SYSTEM%\system\bin\lsattr" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\lsmod" & mklink "%SYSTEM%\system\bin\lsmod" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\lsof" & mklink "%SYSTEM%\system\bin\lsof" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\lspci" & mklink "%SYSTEM%\system\bin\lspci" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\lsusb" & mklink "%SYSTEM%\system\bin\lsusb" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\md5sum" & mklink "%SYSTEM%\system\bin\md5sum" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\microcom" & mklink "%SYSTEM%\system\bin\microcom" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\mkdir" & mklink "%SYSTEM%\system\bin\mkdir" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\mkfifo" & mklink "%SYSTEM%\system\bin\mkfifo" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\mkfs.ext2" & mklink "%SYSTEM%\system\bin\mkfs.ext2" "mke2fs" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\mkfs.ext3" & mklink "%SYSTEM%\system\bin\mkfs.ext3" "mke2fs" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\mkfs.ext4" & mklink "%SYSTEM%\system\bin\mkfs.ext4" "mke2fs" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\mknod" & mklink "%SYSTEM%\system\bin\mknod" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\mkswap" & mklink "%SYSTEM%\system\bin\mkswap" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\mktemp" & mklink "%SYSTEM%\system\bin\mktemp" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\modinfo" & mklink "%SYSTEM%\system\bin\modinfo" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\modprobe" & mklink "%SYSTEM%\system\bin\modprobe" "toolbox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\more" & mklink "%SYSTEM%\system\bin\more" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\mount" & mklink "%SYSTEM%\system\bin\mount" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\mountpoint" & mklink "%SYSTEM%\system\bin\mountpoint" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\mv" & mklink "%SYSTEM%\system\bin\mv" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\nc" & mklink "%SYSTEM%\system\bin\nc" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\ndc-wrapper-1.0" & mklink "%SYSTEM%\system\bin\ndc-wrapper-1.0" "netutils-wrapper-1.0" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\netcat" & mklink "%SYSTEM%\system\bin\netcat" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\netstat" & mklink "%SYSTEM%\system\bin\netstat" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\nice" & mklink "%SYSTEM%\system\bin\nice" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\nl" & mklink "%SYSTEM%\system\bin\nl" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\nohup" & mklink "%SYSTEM%\system\bin\nohup" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\nproc" & mklink "%SYSTEM%\system\bin\nproc" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\nsenter" & mklink "%SYSTEM%\system\bin\nsenter" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\od" & mklink "%SYSTEM%\system\bin\od" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\paste" & mklink "%SYSTEM%\system\bin\paste" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\patch" & mklink "%SYSTEM%\system\bin\patch" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\pgrep" & mklink "%SYSTEM%\system\bin\pgrep" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\pidof" & mklink "%SYSTEM%\system\bin\pidof" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\pkill" & mklink "%SYSTEM%\system\bin\pkill" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\pmap" & mklink "%SYSTEM%\system\bin\pmap" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\printenv" & mklink "%SYSTEM%\system\bin\printenv" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\printf" & mklink "%SYSTEM%\system\bin\printf" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\ps" & mklink "%SYSTEM%\system\bin\ps" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\pwd" & mklink "%SYSTEM%\system\bin\pwd" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\readelf" & mklink "%SYSTEM%\system\bin\readelf" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\readlink" & mklink "%SYSTEM%\system\bin\readlink" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\realpath" & mklink "%SYSTEM%\system\bin\realpath" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\renice" & mklink "%SYSTEM%\system\bin\renice" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\resize.f2fs" & mklink "%SYSTEM%\system\bin\resize.f2fs" "fsck.f2fs" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\restorecon" & mklink "%SYSTEM%\system\bin\restorecon" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\rm" & mklink "%SYSTEM%\system\bin\rm" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\rmdir" & mklink "%SYSTEM%\system\bin\rmdir" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\rmmod" & mklink "%SYSTEM%\system\bin\rmmod" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\rtcwake" & mklink "%SYSTEM%\system\bin\rtcwake" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\runcon" & mklink "%SYSTEM%\system\bin\runcon" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\sed" & mklink "%SYSTEM%\system\bin\sed" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\sendevent" & mklink "%SYSTEM%\system\bin\sendevent" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\seq" & mklink "%SYSTEM%\system\bin\seq" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\setenforce" & mklink "%SYSTEM%\system\bin\setenforce" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\setprop" & mklink "%SYSTEM%\system\bin\setprop" "toolbox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\setsid" & mklink "%SYSTEM%\system\bin\setsid" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\sha1sum" & mklink "%SYSTEM%\system\bin\sha1sum" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\sha224sum" & mklink "%SYSTEM%\system\bin\sha224sum" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\sha256sum" & mklink "%SYSTEM%\system\bin\sha256sum" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\sha384sum" & mklink "%SYSTEM%\system\bin\sha384sum" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\sha512sum" & mklink "%SYSTEM%\system\bin\sha512sum" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\sleep" & mklink "%SYSTEM%\system\bin\sleep" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\sort" & mklink "%SYSTEM%\system\bin\sort" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\split" & mklink "%SYSTEM%\system\bin\split" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\start" & mklink "%SYSTEM%\system\bin\start" "toolbox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\stat" & mklink "%SYSTEM%\system\bin\stat" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\stop" & mklink "%SYSTEM%\system\bin\stop" "toolbox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\strings" & mklink "%SYSTEM%\system\bin\strings" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\stty" & mklink "%SYSTEM%\system\bin\stty" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\swapoff" & mklink "%SYSTEM%\system\bin\swapoff" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\swapon" & mklink "%SYSTEM%\system\bin\swapon" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\sync" & mklink "%SYSTEM%\system\bin\sync" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\sysctl" & mklink "%SYSTEM%\system\bin\sysctl" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\tac" & mklink "%SYSTEM%\system\bin\tac" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\tail" & mklink "%SYSTEM%\system\bin\tail" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\tar" & mklink "%SYSTEM%\system\bin\tar" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\taskset" & mklink "%SYSTEM%\system\bin\taskset" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\tc-wrapper-1.0" & mklink "%SYSTEM%\system\bin\tc-wrapper-1.0" "netutils-wrapper-1.0" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\tee" & mklink "%SYSTEM%\system\bin\tee" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\test" & mklink "%SYSTEM%\system\bin\test" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\time" & mklink "%SYSTEM%\system\bin\time" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\timeout" & mklink "%SYSTEM%\system\bin\timeout" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\top" & mklink "%SYSTEM%\system\bin\top" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\touch" & mklink "%SYSTEM%\system\bin\touch" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\tr" & mklink "%SYSTEM%\system\bin\tr" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\true" & mklink "%SYSTEM%\system\bin\true" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\truncate" & mklink "%SYSTEM%\system\bin\truncate" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\tty" & mklink "%SYSTEM%\system\bin\tty" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\uclampset" & mklink "%SYSTEM%\system\bin\uclampset" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\ueventd" & mklink "%SYSTEM%\system\bin\ueventd" "init" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\ulimit" & mklink "%SYSTEM%\system\bin\ulimit" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\umount" & mklink "%SYSTEM%\system\bin\umount" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\uname" & mklink "%SYSTEM%\system\bin\uname" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\uniq" & mklink "%SYSTEM%\system\bin\uniq" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\unix2dos" & mklink "%SYSTEM%\system\bin\unix2dos" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\unlink" & mklink "%SYSTEM%\system\bin\unlink" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\unshare" & mklink "%SYSTEM%\system\bin\unshare" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\unzip" & mklink "%SYSTEM%\system\bin\unzip" "ziptool" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\uptime" & mklink "%SYSTEM%\system\bin\uptime" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\usleep" & mklink "%SYSTEM%\system\bin\usleep" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\uudecode" & mklink "%SYSTEM%\system\bin\uudecode" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\uuencode" & mklink "%SYSTEM%\system\bin\uuencode" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\uuidgen" & mklink "%SYSTEM%\system\bin\uuidgen" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\vmstat" & mklink "%SYSTEM%\system\bin\vmstat" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\watch" & mklink "%SYSTEM%\system\bin\watch" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\wc" & mklink "%SYSTEM%\system\bin\wc" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\which" & mklink "%SYSTEM%\system\bin\which" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\whoami" & mklink "%SYSTEM%\system\bin\whoami" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\xargs" & mklink "%SYSTEM%\system\bin\xargs" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\xxd" & mklink "%SYSTEM%\system\bin\xxd" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\yes" & mklink "%SYSTEM%\system\bin\yes" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\zcat" & mklink "%SYSTEM%\system\bin\zcat" "toybox" >nul 2>&1
del /a:a "%SYSTEM%\system\bin\zipinfo" & mklink "%SYSTEM%\system\bin\zipinfo" "ziptool" >nul 2>&1
del /a:a "%SYSTEM%\system\fonts\DroidSans-Bold.ttf" & mklink "%SYSTEM%\system\fonts\DroidSans-Bold.ttf" "Roboto-Regular.ttf" >nul 2>&1
del /a:a "%SYSTEM%\system\fonts\DroidSans.ttf" & mklink "%SYSTEM%\system\fonts\DroidSans.ttf" "Roboto-Regular.ttf" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm64\boot-QPerformance.vdex" & mklink "%SYSTEM%\system\framework\arm64\boot-QPerformance.vdex" "../boot-QPerformance.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm64\boot-UxPerformance.vdex" & mklink "%SYSTEM%\system\framework\arm64\boot-UxPerformance.vdex" "../boot-UxPerformance.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm64\boot-core-icu4j.vdex" & mklink "%SYSTEM%\system\framework\arm64\boot-core-icu4j.vdex" "../boot-core-icu4j.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm64\boot-esecomm.vdex" & mklink "%SYSTEM%\system\framework\arm64\boot-esecomm.vdex" "../boot-esecomm.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm64\boot-ext.vdex" & mklink "%SYSTEM%\system\framework\arm64\boot-ext.vdex" "../boot-ext.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm64\boot-framework-graphics.vdex" & mklink "%SYSTEM%\system\framework\arm64\boot-framework-graphics.vdex" "../boot-framework-graphics.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm64\boot-framework.vdex" & mklink "%SYSTEM%\system\framework\arm64\boot-framework.vdex" "../boot-framework.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm64\boot-ims-common.vdex" & mklink "%SYSTEM%\system\framework\arm64\boot-ims-common.vdex" "../boot-ims-common.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm64\boot-knoxsdk.vdex" & mklink "%SYSTEM%\system\framework\arm64\boot-knoxsdk.vdex" "../boot-knoxsdk.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm64\boot-tcmiface.vdex" & mklink "%SYSTEM%\system\framework\arm64\boot-tcmiface.vdex" "../boot-tcmiface.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm64\boot-telephony-common.vdex" & mklink "%SYSTEM%\system\framework\arm64\boot-telephony-common.vdex" "../boot-telephony-common.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm64\boot-telephony-ext.vdex" & mklink "%SYSTEM%\system\framework\arm64\boot-telephony-ext.vdex" "../boot-telephony-ext.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm64\boot-uibc_java.vdex" & mklink "%SYSTEM%\system\framework\arm64\boot-uibc_java.vdex" "../boot-uibc_java.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm64\boot-voip-common.vdex" & mklink "%SYSTEM%\system\framework\arm64\boot-voip-common.vdex" "../boot-voip-common.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm\boot-QPerformance.vdex" & mklink "%SYSTEM%\system\framework\arm\boot-QPerformance.vdex" "../boot-QPerformance.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm\boot-UxPerformance.vdex" & mklink "%SYSTEM%\system\framework\arm\boot-UxPerformance.vdex" "../boot-UxPerformance.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm\boot-core-icu4j.vdex" & mklink "%SYSTEM%\system\framework\arm\boot-core-icu4j.vdex" "../boot-core-icu4j.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm\boot-esecomm.vdex" & mklink "%SYSTEM%\system\framework\arm\boot-esecomm.vdex" "../boot-esecomm.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm\boot-ext.vdex" & mklink "%SYSTEM%\system\framework\arm\boot-ext.vdex" "../boot-ext.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm\boot-framework-graphics.vdex" & mklink "%SYSTEM%\system\framework\arm\boot-framework-graphics.vdex" "../boot-framework-graphics.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm\boot-framework.vdex" & mklink "%SYSTEM%\system\framework\arm\boot-framework.vdex" "../boot-framework.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm\boot-ims-common.vdex" & mklink "%SYSTEM%\system\framework\arm\boot-ims-common.vdex" "../boot-ims-common.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm\boot-knoxsdk.vdex" & mklink "%SYSTEM%\system\framework\arm\boot-knoxsdk.vdex" "../boot-knoxsdk.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm\boot-tcmiface.vdex" & mklink "%SYSTEM%\system\framework\arm\boot-tcmiface.vdex" "../boot-tcmiface.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm\boot-telephony-common.vdex" & mklink "%SYSTEM%\system\framework\arm\boot-telephony-common.vdex" "../boot-telephony-common.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm\boot-telephony-ext.vdex" & mklink "%SYSTEM%\system\framework\arm\boot-telephony-ext.vdex" "../boot-telephony-ext.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm\boot-uibc_java.vdex" & mklink "%SYSTEM%\system\framework\arm\boot-uibc_java.vdex" "../boot-uibc_java.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\framework\arm\boot-voip-common.vdex" & mklink "%SYSTEM%\system\framework\arm\boot-voip-common.vdex" "../boot-voip-common.vdex" >nul 2>&1
del /a:a "%SYSTEM%\system\lib64\libc.so" & mklink "%SYSTEM%\system\lib64\libc.so" "/apex/com.android.runtime/lib64/bionic/libc.so" >nul 2>&1
del /a:a "%SYSTEM%\system\lib64\libdl.so" & mklink "%SYSTEM%\system\lib64\libdl.so" "/apex/com.android.runtime/lib64/bionic/libdl.so" >nul 2>&1
del /a:a "%SYSTEM%\system\lib64\libdl_android.so" & mklink "%SYSTEM%\system\lib64\libdl_android.so" "/apex/com.android.runtime/lib64/bionic/libdl_android.so" >nul 2>&1
del /a:a "%SYSTEM%\system\lib64\libm.so" & mklink "%SYSTEM%\system\lib64\libm.so" "/apex/com.android.runtime/lib64/bionic/libm.so" >nul 2>&1
del /a:a "%SYSTEM%\system\lib\libc.so" & mklink "%SYSTEM%\system\lib\libc.so" "/apex/com.android.runtime/lib/bionic/libc.so" >nul 2>&1
del /a:a "%SYSTEM%\system\lib\libdl.so" & mklink "%SYSTEM%\system\lib\libdl.so" "/apex/com.android.runtime/lib/bionic/libdl.so" >nul 2>&1
del /a:a "%SYSTEM%\system\lib\libdl_android.so" & mklink "%SYSTEM%\system\lib\libdl_android.so" "/apex/com.android.runtime/lib/bionic/libdl_android.so" >nul 2>&1
del /a:a "%SYSTEM%\system\lib\libm.so" & mklink "%SYSTEM%\system\lib\libm.so" "/apex/com.android.runtime/lib/bionic/libm.so" >nul 2>&1
del /a:a "%SYSTEM%\system\priv-app\BuiltInPrintService\lib\arm64\libcups.so" & mklink "%SYSTEM%\system\priv-app\BuiltInPrintService\lib\arm64\libcups.so" "/system/lib64/libcups.so" >nul 2>&1
del /a:a "%SYSTEM%\system\priv-app\BuiltInPrintService\lib\arm64\libwfds.so" & mklink "%SYSTEM%\system\priv-app\BuiltInPrintService\lib\arm64\libwfds.so" "/system/lib64/libwfds.so" >nul 2>&1
del /a:a "%SYSTEM%\system\priv-app\GpuWatchApp\lib\arm64\libgpustat.so" & mklink "%SYSTEM%\system\priv-app\GpuWatchApp\lib\arm64\libgpustat.so" "/system/lib64/libgpustat.so" >nul 2>&1
del /a:a "%SYSTEM%\system\priv-app\GpuWatchApp\lib\arm64\libsysinfo.so" & mklink "%SYSTEM%\system\priv-app\GpuWatchApp\lib\arm64\libsysinfo.so" "/system/lib64/libsysinfo.so" >nul 2>&1
del /a:a "%SYSTEM%\system\priv-app\ModemServiceMode\lib\arm64\librildump_jni.so" & mklink "%SYSTEM%\system\priv-app\ModemServiceMode\lib\arm64\librildump_jni.so" "system/lib64/librildump_jni.so" >nul 2>&1
del /a:a "%SYSTEM%\system\priv-app\SKMSAgent\lib\arm64\libsem_jni.so" & mklink "%SYSTEM%\system\priv-app\SKMSAgent\lib\arm64\libsem_jni.so" "/system/lib64/libsem_jni.so" >nul 2>&1
del /a:a "%SYSTEM%\system\priv-app\imsservice\lib\arm64\libsec-ims.so" & mklink "%SYSTEM%\system\priv-app\imsservice\lib\arm64\libsec-ims.so" "/system/lib64/libsec-ims.so" >nul 2>&1
del /a:a "%SYSTEM%\system\product" 2>nul & rmdir /s /q "%SYSTEM%\system\product" 2>nul & mklink /d "%SYSTEM%\system\product" "/product" >nul 2>&1
del /a:a "%SYSTEM%\system\system_ext\priv-app\com.qualcomm.qti.services.systemhelper\lib\arm64\libsystemhelper_jni.so" & mklink "%SYSTEM%\system\system_ext\priv-app\com.qualcomm.qti.services.systemhelper\lib\arm64\libsystemhelper_jni.so" "/system/system_ext/lib64/libsystemhelper_jni.so" >nul 2>&1
del /a:a "%SYSTEM%\system\usr\icu" & mklink "%SYSTEM%\system\usr\icu" "/apex/com.android.i18n/etc/icu" >nul 2>&1
del /a:a "%SYSTEM%\system\vendor" 2>nul & rmdir /s /q "%SYSTEM%\system\vendor" 2>nul & mklink /d "%SYSTEM%\system\vendor" "/vendor" >nul 2>&1
del /a:a "%SYSTEM%\system_ext" 2>nul & rmdir /s /q "%SYSTEM%\system_ext" 2>nul & mklink /d "%SYSTEM%\system_ext" "/system/system_ext" >nul 2>&1
del /a:a "%SYSTEM%\vendor_dlkm\etc" & mklink "%SYSTEM%\vendor_dlkm\etc" "/vendor/vendor_dlkm/etc" >nul 2>&1
timeout 3 >nul && goto resumesystem
:vendorsymlink
del /a:a "%VENDOR%\odm" & mklink "%VENDOR%\odm" "/odm" >nul 2>&1
del /a:a "%VENDOR%\app\CneApp\lib\arm64\libvndfwk_detect_jni.qti.so" & mklink "%VENDOR%\app\CneApp\lib\arm64\libvndfwk_detect_jni.qti.so" "/vendor/lib64/libvndfwk_detect_jni.qti.so" >nul 2>&1
del /a:a "%VENDOR%\bin\getevent" & mklink "%VENDOR%\bin\getevent" "toolbox" >nul 2>&1
del /a:a "%VENDOR%\bin\getprop" & mklink "%VENDOR%\bin\getprop" "toolbox" >nul 2>&1
del /a:a "%VENDOR%\bin\modprobe" & mklink "%VENDOR%\bin\modprobe" "toolbox" >nul 2>&1
del /a:a "%VENDOR%\bin\setprop" & mklink "%VENDOR%\bin\setprop" "toolbox" >nul 2>&1
del /a:a "%VENDOR%\bin\start" & mklink "%VENDOR%\bin\start" "toolbox" >nul 2>&1
del /a:a "%VENDOR%\bin\stop" & mklink "%VENDOR%\bin\stop" "toolbox" >nul 2>&1
del /a:a "%VENDOR%\bin\acpi" & mklink "%VENDOR%\bin\acpi" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\base64" & mklink "%VENDOR%\bin\base64" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\basename" & mklink "%VENDOR%\bin\basename" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\blockdev" & mklink "%VENDOR%\bin\blockdev" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\cal" & mklink "%VENDOR%\bin\cal" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\cat" & mklink "%VENDOR%\bin\cat" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\chattr" & mklink "%VENDOR%\bin\chattr" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\chcon" & mklink "%VENDOR%\bin\chcon" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\chgrp" & mklink "%VENDOR%\bin\chgrp" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\chmod" & mklink "%VENDOR%\bin\chmod" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\chown" & mklink "%VENDOR%\bin\chown" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\chroot" & mklink "%VENDOR%\bin\chroot" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\chrt" & mklink "%VENDOR%\bin\chrt" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\cksum" & mklink "%VENDOR%\bin\cksum" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\clear" & mklink "%VENDOR%\bin\clear" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\cmp" & mklink "%VENDOR%\bin\cmp" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\comm" & mklink "%VENDOR%\bin\comm" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\cp" & mklink "%VENDOR%\bin\cp" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\cpio" & mklink "%VENDOR%\bin\cpio" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\cut" & mklink "%VENDOR%\bin\cut" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\date" & mklink "%VENDOR%\bin\date" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\dd" & mklink "%VENDOR%\bin\dd" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\devmem" & mklink "%VENDOR%\bin\devmem" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\df" & mklink "%VENDOR%\bin\df" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\diff" & mklink "%VENDOR%\bin\diff" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\dirname" & mklink "%VENDOR%\bin\dirname" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\dmesg" & mklink "%VENDOR%\bin\dmesg" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\dos2unix" & mklink "%VENDOR%\bin\dos2unix" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\du" & mklink "%VENDOR%\bin\du" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\echo" & mklink "%VENDOR%\bin\echo" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\egrep" & mklink "%VENDOR%\bin\egrep" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\env" & mklink "%VENDOR%\bin\env" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\expand" & mklink "%VENDOR%\bin\expand" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\expr" & mklink "%VENDOR%\bin\expr" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\fallocate" & mklink "%VENDOR%\bin\fallocate" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\false" & mklink "%VENDOR%\bin\false" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\fgrep" & mklink "%VENDOR%\bin\fgrep" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\file" & mklink "%VENDOR%\bin\file" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\find" & mklink "%VENDOR%\bin\find" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\flock" & mklink "%VENDOR%\bin\flock" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\fmt" & mklink "%VENDOR%\bin\fmt" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\free" & mklink "%VENDOR%\bin\free" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\fsync" & mklink "%VENDOR%\bin\fsync" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\getconf" & mklink "%VENDOR%\bin\getconf" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\getenforce" & mklink "%VENDOR%\bin\getenforce" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\grep" & mklink "%VENDOR%\bin\grep" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\groups" & mklink "%VENDOR%\bin\groups" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\gunzip" & mklink "%VENDOR%\bin\gunzip" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\gzip" & mklink "%VENDOR%\bin\gzip" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\head" & mklink "%VENDOR%\bin\head" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\hostname" & mklink "%VENDOR%\bin\hostname" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\hwclock" & mklink "%VENDOR%\bin\hwclock" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\i2cdetect" & mklink "%VENDOR%\bin\i2cdetect" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\i2cdump" & mklink "%VENDOR%\bin\i2cdump" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\i2cget" & mklink "%VENDOR%\bin\i2cget" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\i2cset" & mklink "%VENDOR%\bin\i2cset" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\iconv" & mklink "%VENDOR%\bin\iconv" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\id" & mklink "%VENDOR%\bin\id" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\ifconfig" & mklink "%VENDOR%\bin\ifconfig" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\inotifyd" & mklink "%VENDOR%\bin\inotifyd" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\insmod" & mklink "%VENDOR%\bin\insmod" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\install" & mklink "%VENDOR%\bin\install" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\ionice" & mklink "%VENDOR%\bin\ionice" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\iorenice" & mklink "%VENDOR%\bin\iorenice" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\kill" & mklink "%VENDOR%\bin\kill" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\killall" & mklink "%VENDOR%\bin\killall" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\ln" & mklink "%VENDOR%\bin\ln" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\load_policy" & mklink "%VENDOR%\bin\load_policy" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\log" & mklink "%VENDOR%\bin\log" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\logname" & mklink "%VENDOR%\bin\logname" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\losetup" & mklink "%VENDOR%\bin\losetup" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\ls" & mklink "%VENDOR%\bin\ls" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\lsattr" & mklink "%VENDOR%\bin\lsattr" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\lsmod" & mklink "%VENDOR%\bin\lsmod" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\lsof" & mklink "%VENDOR%\bin\lsof" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\lspci" & mklink "%VENDOR%\bin\lspci" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\lsusb" & mklink "%VENDOR%\bin\lsusb" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\md5sum" & mklink "%VENDOR%\bin\md5sum" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\microcom" & mklink "%VENDOR%\bin\microcom" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\mkdir" & mklink "%VENDOR%\bin\mkdir" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\mkfifo" & mklink "%VENDOR%\bin\mkfifo" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\mknod" & mklink "%VENDOR%\bin\mknod" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\mkswap" & mklink "%VENDOR%\bin\mkswap" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\mktemp" & mklink "%VENDOR%\bin\mktemp" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\modinfo" & mklink "%VENDOR%\bin\modinfo" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\more" & mklink "%VENDOR%\bin\more" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\mount" & mklink "%VENDOR%\bin\mount" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\mountpoint" & mklink "%VENDOR%\bin\mountpoint" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\mv" & mklink "%VENDOR%\bin\mv" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\nc" & mklink "%VENDOR%\bin\nc" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\netcat" & mklink "%VENDOR%\bin\netcat" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\netstat" & mklink "%VENDOR%\bin\netstat" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\nice" & mklink "%VENDOR%\bin\nice" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\nl" & mklink "%VENDOR%\bin\nl" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\nohup" & mklink "%VENDOR%\bin\nohup" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\nproc" & mklink "%VENDOR%\bin\nproc" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\nsenter" & mklink "%VENDOR%\bin\nsenter" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\od" & mklink "%VENDOR%\bin\od" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\paste" & mklink "%VENDOR%\bin\paste" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\patch" & mklink "%VENDOR%\bin\patch" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\pgrep" & mklink "%VENDOR%\bin\pgrep" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\pidof" & mklink "%VENDOR%\bin\pidof" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\pkill" & mklink "%VENDOR%\bin\pkill" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\pmap" & mklink "%VENDOR%\bin\pmap" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\printenv" & mklink "%VENDOR%\bin\printenv" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\printf" & mklink "%VENDOR%\bin\printf" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\ps" & mklink "%VENDOR%\bin\ps" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\pwd" & mklink "%VENDOR%\bin\pwd" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\readelf" & mklink "%VENDOR%\bin\readelf" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\readlink" & mklink "%VENDOR%\bin\readlink" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\realpath" & mklink "%VENDOR%\bin\realpath" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\renice" & mklink "%VENDOR%\bin\renice" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\restorecon" & mklink "%VENDOR%\bin\restorecon" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\rm" & mklink "%VENDOR%\bin\rm" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\rmdir" & mklink "%VENDOR%\bin\rmdir" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\rmmod" & mklink "%VENDOR%\bin\rmmod" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\runcon" & mklink "%VENDOR%\bin\runcon" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\sed" & mklink "%VENDOR%\bin\sed" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\sendevent" & mklink "%VENDOR%\bin\sendevent" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\seq" & mklink "%VENDOR%\bin\seq" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\setenforce" & mklink "%VENDOR%\bin\setenforce" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\setsid" & mklink "%VENDOR%\bin\setsid" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\sha1sum" & mklink "%VENDOR%\bin\sha1sum" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\sha224sum" & mklink "%VENDOR%\bin\sha224sum" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\sha256sum" & mklink "%VENDOR%\bin\sha256sum" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\sha384sum" & mklink "%VENDOR%\bin\sha384sum" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\sha512sum" & mklink "%VENDOR%\bin\sha512sum" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\sleep" & mklink "%VENDOR%\bin\sleep" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\sort" & mklink "%VENDOR%\bin\sort" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\split" & mklink "%VENDOR%\bin\split" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\stat" & mklink "%VENDOR%\bin\stat" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\strings" & mklink "%VENDOR%\bin\strings" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\stty" & mklink "%VENDOR%\bin\stty" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\swapoff" & mklink "%VENDOR%\bin\swapoff" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\swapon" & mklink "%VENDOR%\bin\swapon" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\sync" & mklink "%VENDOR%\bin\sync" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\sysctl" & mklink "%VENDOR%\bin\sysctl" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\tac" & mklink "%VENDOR%\bin\tac" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\tail" & mklink "%VENDOR%\bin\tail" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\tar" & mklink "%VENDOR%\bin\tar" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\taskset" & mklink "%VENDOR%\bin\taskset" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\tee" & mklink "%VENDOR%\bin\tee" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\test" & mklink "%VENDOR%\bin\test" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\time" & mklink "%VENDOR%\bin\time" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\timeout" & mklink "%VENDOR%\bin\timeout" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\top" & mklink "%VENDOR%\bin\top" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\touch" & mklink "%VENDOR%\bin\touch" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\tr" & mklink "%VENDOR%\bin\tr" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\true" & mklink "%VENDOR%\bin\true" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\truncate" & mklink "%VENDOR%\bin\truncate" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\tty" & mklink "%VENDOR%\bin\tty" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\ulimit" & mklink "%VENDOR%\bin\ulimit" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\umount" & mklink "%VENDOR%\bin\umount" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\uname" & mklink "%VENDOR%\bin\uname" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\uniq" & mklink "%VENDOR%\bin\uniq" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\unix2dos" & mklink "%VENDOR%\bin\unix2dos" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\unlink" & mklink "%VENDOR%\bin\unlink" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\unshare" & mklink "%VENDOR%\bin\unshare" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\uptime" & mklink "%VENDOR%\bin\uptime" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\usleep" & mklink "%VENDOR%\bin\usleep" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\uudecode" & mklink "%VENDOR%\bin\uudecode" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\uuencode" & mklink "%VENDOR%\bin\uuencode" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\uuidgen" & mklink "%VENDOR%\bin\uuidgen" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\vmstat" & mklink "%VENDOR%\bin\vmstat" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\watch" & mklink "%VENDOR%\bin\watch" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\wc" & mklink "%VENDOR%\bin\wc" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\which" & mklink "%VENDOR%\bin\which" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\whoami" & mklink "%VENDOR%\bin\whoami" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\xargs" & mklink "%VENDOR%\bin\xargs" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\xxd" & mklink "%VENDOR%\bin\xxd" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\yes" & mklink "%VENDOR%\bin\yes" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\bin\zcat" & mklink "%VENDOR%\bin\zcat" "toybox_vendor" >nul 2>&1
del /a:a "%VENDOR%\firmware\wlanmdsp.otaupdate" & mklink "%VENDOR%\firmware\wlanmdsp.otaupdate" "/data/vendor/firmware/wlanmdsp.mbn" >nul 2>&1
del /a:a "%VENDOR%\firmware\wlan\qca_cld\wlan_mac.bin" & mklink "%VENDOR%\firmware\wlan\qca_cld\wlan_mac.bin" "/mnt/vendor/persist/wlan_mac.bin" >nul 2>&1
del /a:a "%VENDOR%\lib\libEGL_adreno.so" & mklink "%VENDOR%\lib\libEGL_adreno.so" "egl/libEGL_adreno.so" >nul 2>&1
del /a:a "%VENDOR%\lib\libGLESv2_adreno.so" & mklink "%VENDOR%\lib\libGLESv2_adreno.so" "egl/libGLESv2_adreno.so" >nul 2>&1
del /a:a "%VENDOR%\lib\libq3dtools_adreno.so" & mklink "%VENDOR%\lib\libq3dtools_adreno.so" "egl/libq3dtools_adreno.so" >nul 2>&1
del /a:a "%VENDOR%\lib64\libEGL_adreno.so" & mklink "%VENDOR%\lib64\libEGL_adreno.so" "egl/libEGL_adreno.so" >nul 2>&1
del /a:a "%VENDOR%\lib64\libGLESv2_adreno.so" & mklink "%VENDOR%\lib64\libGLESv2_adreno.so" "egl/libGLESv2_adreno.so" >nul 2>&1
del /a:a "%VENDOR%\lib64\libq3dtools_adreno.so" & mklink "%VENDOR%\lib64\libq3dtools_adreno.so" "egl/libq3dtools_adreno.so" >nul 2>&1
del /a:a "%VENDOR%\rfs\apq\gnss\hlos" & mklink "%VENDOR%\rfs\apq\gnss\hlos" "/mnt/vendor/persist/hlos_rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\apq\gnss\ramdumps" & mklink "%VENDOR%\rfs\apq\gnss\ramdumps" "/data/vendor/tombstones/rfs/modem" >nul 2>&1
del /a:a "%VENDOR%\rfs\apq\gnss\readwrite" & mklink "%VENDOR%\rfs\apq\gnss\readwrite" "/mnt/vendor/persist/rfs/apq/gnss" >nul 2>&1
del /a:a "%VENDOR%\rfs\apq\gnss\shared" & mklink "%VENDOR%\rfs\apq\gnss\shared" "/mnt/vendor/persist/rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\apq\gnss\readonly\firmware" & mklink "%VENDOR%\rfs\apq\gnss\readonly\firmware" "/vendor/firmware_mnt" >nul 2>&1
del /a:a "%VENDOR%\rfs\apq\gnss\readonly\vendor\firmware" & mklink "%VENDOR%\rfs\apq\gnss\readonly\vendor\firmware" "/vendor/firmware" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\adsp\hlos" & mklink "%VENDOR%\rfs\mdm\adsp\hlos" "/mnt/vendor/persist/hlos_rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\adsp\ramdumps" & mklink "%VENDOR%\rfs\mdm\adsp\ramdumps" "/data/vendor/tombstones/rfs/lpass" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\adsp\readwrite" & mklink "%VENDOR%\rfs\mdm\adsp\readwrite" "/mnt/vendor/persist/rfs/mdm/adsp" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\adsp\shared" & mklink "%VENDOR%\rfs\mdm\adsp\shared" "/mnt/vendor/persist/rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\adsp\readonly\firmware" & mklink "%VENDOR%\rfs\mdm\adsp\readonly\firmware" "/vendor/firmware_mnt" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\adsp\readonly\vendor\firmware" & mklink "%VENDOR%\rfs\mdm\adsp\readonly\vendor\firmware" "/vendor/firmware" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\cdsp\hlos" & mklink "%VENDOR%\rfs\mdm\cdsp\hlos" "/mnt/vendor/persist/hlos_rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\cdsp\ramdumps" & mklink "%VENDOR%\rfs\mdm\cdsp\ramdumps" "/data/vendor/tombstones/rfs/cdsp" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\cdsp\readwrite" & mklink "%VENDOR%\rfs\mdm\cdsp\readwrite" "/mnt/vendor/persist/rfs/mdm/cdsp" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\cdsp\shared" & mklink "%VENDOR%\rfs\mdm\cdsp\shared" "/mnt/vendor/persist/rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\cdsp\readonly\firmware" & mklink "%VENDOR%\rfs\mdm\cdsp\readonly\firmware" "/vendor/firmware_mnt" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\cdsp\readonly\vendor\firmware" & mklink "%VENDOR%\rfs\mdm\cdsp\readonly\vendor\firmware" "/vendor/firmware" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\mpss\hlos" & mklink "%VENDOR%\rfs\mdm\mpss\hlos" "/mnt/vendor/persist/hlos_rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\mpss\ramdumps" & mklink "%VENDOR%\rfs\mdm\mpss\ramdumps" "/data/vendor/tombstones/rfs/modem" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\mpss\readwrite" & mklink "%VENDOR%\rfs\mdm\mpss\readwrite" "/mnt/vendor/persist/rfs/mdm/mpss" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\mpss\shared" & mklink "%VENDOR%\rfs\mdm\mpss\shared" "/mnt/vendor/persist/rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\mpss\readonly\firmware" & mklink "%VENDOR%\rfs\mdm\mpss\readonly\firmware" "/vendor/firmware-modem" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\mpss\readonly\vendor\firmware" & mklink "%VENDOR%\rfs\mdm\mpss\readonly\vendor\firmware" "/vendor/firmware" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\slpi\hlos" & mklink "%VENDOR%\rfs\mdm\slpi\hlos" "/mnt/vendor/persist/hlos_rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\slpi\ramdumps" & mklink "%VENDOR%\rfs\mdm\slpi\ramdumps" "/data/vendor/tombstones/rfs/slpi" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\slpi\readwrite" & mklink "%VENDOR%\rfs\mdm\slpi\readwrite" "/mnt/vendor/persist/rfs/mdm/slpi" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\slpi\shared" & mklink "%VENDOR%\rfs\mdm\slpi\shared" "/mnt/vendor/persist/rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\slpi\readonly\firmware" & mklink "%VENDOR%\rfs\mdm\slpi\readonly\firmware" "/vendor/firmware_mnt" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\slpi\readonly\vendor\firmware" & mklink "%VENDOR%\rfs\mdm\slpi\readonly\vendor\firmware" "/vendor/firmware" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\tn\hlos" & mklink "%VENDOR%\rfs\mdm\tn\hlos" "/mnt/vendor/persist/hlos_rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\tn\ramdumps" & mklink "%VENDOR%\rfs\mdm\tn\ramdumps" "/data/vendor/tombstones/rfs/tn" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\tn\readwrite" & mklink "%VENDOR%\rfs\mdm\tn\readwrite" "/mnt/vendor/persist/rfs/mdm/tn" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\tn\shared" & mklink "%VENDOR%\rfs\mdm\tn\shared" "/mnt/vendor/persist/rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\tn\readonly\firmware" & mklink "%VENDOR%\rfs\mdm\tn\readonly\firmware" "/vendor/firmware_mnt" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\tn\readonly\vendor\firmware" & mklink "%VENDOR%\rfs\mdm\tn\readonly\vendor\firmware" "/vendor/firmware" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\wpss\hlos" & mklink "%VENDOR%\rfs\mdm\wpss\hlos" "/mnt/vendor/persist/hlos_rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\wpss\ramdumps" & mklink "%VENDOR%\rfs\mdm\wpss\ramdumps" "/data/vendor/tombstones/rfs/wpss" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\wpss\readwrite" & mklink "%VENDOR%\rfs\mdm\wpss\readwrite" "/mnt/vendor/persist/rfs/mdm/wpss" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\wpss\shared" & mklink "%VENDOR%\rfs\mdm\wpss\shared" "/mnt/vendor/persist/rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\wpss\readonly\firmware" & mklink "%VENDOR%\rfs\mdm\wpss\readonly\firmware" "/vendor/firmware_mnt" >nul 2>&1
del /a:a "%VENDOR%\rfs\mdm\wpss\readonly\vendor\firmware" & mklink "%VENDOR%\rfs\mdm\wpss\readonly\vendor\firmware" "/vendor/firmware" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\adsp\hlos" & mklink "%VENDOR%\rfs\msm\adsp\hlos" "/mnt/vendor/persist/hlos_rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\adsp\ramdumps" & mklink "%VENDOR%\rfs\msm\adsp\ramdumps" "/data/vendor/tombstones/rfs/lpass" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\adsp\readwrite" & mklink "%VENDOR%\rfs\msm\adsp\readwrite" "/mnt/vendor/persist/rfs/msm/adsp" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\adsp\shared" & mklink "%VENDOR%\rfs\msm\adsp\shared" "/mnt/vendor/persist/rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\adsp\readonly\firmware" & mklink "%VENDOR%\rfs\msm\adsp\readonly\firmware" "/vendor/firmware_mnt" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\adsp\readonly\vendor\firmware" & mklink "%VENDOR%\rfs\msm\adsp\readonly\vendor\firmware" "/vendor/firmware" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\cdsp\hlos" & mklink "%VENDOR%\rfs\msm\cdsp\hlos" "/mnt/vendor/persist/hlos_rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\cdsp\ramdumps" & mklink "%VENDOR%\rfs\msm\cdsp\ramdumps" "/data/vendor/tombstones/rfs/cdsp" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\cdsp\readwrite" & mklink "%VENDOR%\rfs\msm\cdsp\readwrite" "/mnt/vendor/persist/rfs/msm/cdsp" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\cdsp\shared" & mklink "%VENDOR%\rfs\msm\cdsp\shared" "/mnt/vendor/persist/rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\cdsp\readonly\firmware" & mklink "%VENDOR%\rfs\msm\cdsp\readonly\firmware" "/vendor/firmware_mnt" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\cdsp\readonly\vendor\firmware" & mklink "%VENDOR%\rfs\msm\cdsp\readonly\vendor\firmware" "/vendor/firmware" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\mpss\hlos" & mklink "%VENDOR%\rfs\msm\mpss\hlos" "/mnt/vendor/persist/hlos_rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\mpss\ramdumps" & mklink "%VENDOR%\rfs\msm\mpss\ramdumps" "/data/vendor/tombstones/rfs/modem" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\mpss\readwrite" & mklink "%VENDOR%\rfs\msm\mpss\readwrite" "/mnt/vendor/persist/rfs/msm/mpss" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\mpss\shared" & mklink "%VENDOR%\rfs\msm\mpss\shared" "/mnt/vendor/persist/rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\mpss\readonly\firmware" & mklink "%VENDOR%\rfs\msm\mpss\readonly\firmware" "/vendor/firmware-modem" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\mpss\readonly\vendor\firmware" & mklink "%VENDOR%\rfs\msm\mpss\readonly\vendor\firmware" "/vendor/firmware" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\slpi\hlos" & mklink "%VENDOR%\rfs\msm\slpi\hlos" "/mnt/vendor/persist/hlos_rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\slpi\ramdumps" & mklink "%VENDOR%\rfs\msm\slpi\ramdumps" "/data/vendor/tombstones/rfs/slpi" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\slpi\readwrite" & mklink "%VENDOR%\rfs\msm\slpi\readwrite" "/mnt/vendor/persist/rfs/msm/slpi" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\slpi\shared" & mklink "%VENDOR%\rfs\msm\slpi\shared" "/mnt/vendor/persist/rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\slpi\readonly\firmware" & mklink "%VENDOR%\rfs\msm\slpi\readonly\firmware" "/vendor/firmware_mnt" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\slpi\readonly\vendor\firmware" & mklink "%VENDOR%\rfs\msm\slpi\readonly\vendor\firmware" "/vendor/firmware" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\wpss\hlos" & mklink "%VENDOR%\rfs\msm\wpss\hlos" "/mnt/vendor/persist/hlos_rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\wpss\ramdumps" & mklink "%VENDOR%\rfs\msm\wpss\ramdumps" "/data/vendor/tombstones/rfs/wpss" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\wpss\readwrite" & mklink "%VENDOR%\rfs\msm\wpss\readwrite" "/mnt/vendor/persist/rfs/msm/wpss" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\wpss\shared" & mklink "%VENDOR%\rfs\msm\wpss\shared" "/mnt/vendor/persist/rfs/shared" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\wpss\readonly\firmware" & mklink "%VENDOR%\rfs\msm\wpss\readonly\firmware" "/vendor/firmware_mnt" >nul 2>&1
del /a:a "%VENDOR%\rfs\msm\wpss\readonly\vendor\firmware" & mklink "%VENDOR%\rfs\msm\wpss\readonly\vendor\firmware" "/vendor/firmware" >nul 2>&1
timeout 4 >nul && goto resumevendor
:exit
cls
echo.
echo Thx for Using my sript :)
echo.
timeout 2 >nul
echo ...Bye
timeout 2 >nul
endlocal && cls
cmd.exe
