@echo off
chcp 65001 >nul

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
    goto UpdatePrompt
) else (
    goto CobraClientInstall
)

goto UpdatePrompt

:UpdatePrompt
title Update?
cls
echo.
echo Would you like to Update Cobra Client? [Y/N]
choice /c yn /n 
if %errorlevel% == 1 goto Update
if %errorlevel% == 2 goto BypassUpdate

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
goto NodeCheck

:GitInstall
start https://github.com/git-for-windows/git/releases/download/v2.40.0.windows.1/Git-2.40.0-64-bit.exe
echo Install Git, Once done continue.
pause
goto GitCheck

:CobraClientInstall
cd C:\
mkdir CobraClient
attrib +H C:\CobraClient
cd C:\CobraClient
git clone https://github.com/RyanY321/CobraClientInstall.git
goto BypassUpdate