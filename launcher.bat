@echo off
chcp 65001 >nul

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