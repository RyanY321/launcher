::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFAlNTQqbAE+/Fb4I5/jHzOWDq0MaaO4+bYHY0rGcHMMc6FflO58u2Ro=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQIRBCt8bWQ=
::ZQ05rAF9IBncCkqN+0xwdVt1YDSqHQs=
::ZQ05rAF9IAHYFVzEqQITJxlGTUShMGK/CKF8
::eg0/rx1wNQPfEVWB+kM9LVsJDCeNPnm7JbkV7ebvoeiGti0=
::fBEirQZwNQPfEVWB+kM9LVsJDCeNPnm7RpYQ4e31+6qmrl0VVaITeZrV2byLMq5z
::cRolqwZ3JBvQF1fEqQIcKQ5aTwyHLiu8Cadcy+f5/evHgUEUUewrOK7XyryPQA==
::dhA7uBVwLU+EWHSB+Es/Olt5SQCLPSuTCLZSiA==
::YQ03rBFzNR3SWATE2Uc8IRRGDCmHOGK7Zg==
::dhAmsQZ3MwfNWATE2Uc8IRRGDCmHOGK7RpwS66ab
::ZQ0/vhVqMQ3MEVWAtB9wCTdkZCXi
::Zg8zqx1/OA3MEVWAtB9wCTdkZCXi
::dhA7pRFwIByZRRml2HIYCXs=
::Zh4grVQjdCyDJGyX8VAjFAlNTQqbAE+/Fb4I5/jHzMm7o0ENXOMDW4DZyLWtLOkW5FHFeYYl1zRfgM5s
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
chcp 65001 >nul
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
    goto Update
)

:UpdateAutoChecker

if exist "C:\CCLaunchFiles\" (
    goto UpdateAutoLaunchChecker
) else (
    goto MakeAutoLaunchFiles
)

:UpdateAutoLaunchChecker

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
git clone https://github.com/RyanY321/CobraClientInstall.git -b alpha
goto AfterUpdate

:BypassUpdate
:AfterUpdate

cd C:\CobraClient\CobraClientInstall
call C:\CobraClient\CobraClientInstall\CobraClient.bat

cls
echo An error has occured, please try to install the newest version of the launcher or please contact the developers on the issue
pause
exit

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
git clone https://github.com/RyanY321/CobraClientInstall.git -b alpha
goto BypassUpdate

:MakeAutoLaunchFiles

cd C:\
mkdir CCLaunchFiles
attrib +H C:\CCLaunchFiles
goto ColorCheck

:EnableAuto
cd C:\CCLaunchFiles
echo Config: AutoEnabled >>AutoConfig.Cobra
pause
goto AfterUpdate