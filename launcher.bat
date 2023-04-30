@echo off
goto ColorCheck

:ColorCheck
if exist "C:\CobraFiles\Color\Red.cobra" color 04
if exist "C:\CobraFiles\Color\Blue.cobra" color 09
if exist "C:\CobraFiles\Color\Pink.cobra" color 0D
if exist "C:\CobraFiles\Color\Yellow.cobra" color 0E
if exist "C:\CobraFiles\Color\White.cobra" color 0F
goto Nodecheck

:Nodecheck
if exist "C:\Program Files (x86)\nodejs" (
    goto GitCheck
) else (
    goto GitCheckPGRM
)

:NodeCheckPGRM
if exist "C:\Program Files\nodejs" (
    goto GitCheck
) else (
    goto NodeInstall
)

:GitCheck
if exist "C:\Program Files (x86)\Git" (
    goto InstallCheck
) else (
    goto GitCheckPGRM
)

:GitCheckPGRM
if exist "C:\Program Files\Git" (
    goto InstallCheck
) else (
    goto GitInstall
)

:InstallCheck

if exist "C:\CobraClient\CobraClientInstall" (
    goto UpdateAutoChecker
) else (
    goto CobraClientInstall
)

:UpdateAutoChecker

if exist "C:\CCLaunchFiles\" (
    goto UpdateAutoLaunchChecker
) else (
    goto MakeAutoLaunchFiles
)

:UpdateAutoChecker

if exist "C:\CCLaunchFiles\AutoConfig.Cobra" (
    goto UpdateAuto
) else (
    goto UpdatePrompt
)

:UpdatePrompt
title Update?
cls
echo.
echo Would you like to Update Cobra Client? [Y/N] or [A] for AutoUpdates
choice /c yna /n 
if %errorlevel% == 1 goto Update
if %errorlevel% == 2 goto BypassUpdate
if %errorlevel% == 3 goto EnableAuto

:UpdateAuto
:Update

cd C:\
rmdir /S /Q C:\CobraClient
mkdir CobraClient
attrib +H C:\CobraClient
cd C:\CobraClient
git clone https://github.com/RyanY321/CobraClientInstall.git
goto AfterUpdate

:BypassUpdate
:AfterUpdate

cd C:\CobraClient\CobraClientInstall
call C:\CobraClient\CobraClientInstall\CobraClient.bat

:NodeInstall
start https://nodejs.org/dist/v19.8.1/node-v19.8.1-x64.msi
echo Install Node, Once done continue.
pause
if exist "C:\Program Files (x86)\nodejs" (
    cd "C:\Program Files\"
    mkdir nodejs
) else (
    cd "C:\Program Files (x86)"
    mkdir nodejs
)
goto NodeCheck

:GitInstall
start https://github.com/git-for-windows/git/releases/download/v2.40.0.windows.1/Git-2.40.0-64-bit.exe
echo Install Git, Once done continue.
pause
if exist "C:\Program Files (x86)\Git" (
    cd "C:\Program Files"
    mkdir Git
) else (
    cd "C:\Program Files (x86)"
    mkdir Git
)
goto GitCheck

:CobraClientInstall
cd C:\
mkdir CobraClient
attrib +H C:\CobraClient
cd C:\CobraClient
git clone https://github.com/RyanY321/CobraClientInstall.git
goto BypassUpdate

:MakeAutoLaunchFiles

cd C:\
mkdir CCLaunchFiles
attrib +H C:\CCLaunchFiles
goto ColorCheck

:EnableAuto
cd C:\CCLaunchFiles
echo Config: AutoEnabled >>AutoConfig.Cobra
goto ColorCheck