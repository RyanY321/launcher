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
::cxY6rQJ7JhzQF1fEqQJhZksaHGQ=
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbAs=
::ZQ05rAF9IAHYFVzEqQITJxlGTUShMGK/CKFcxOnu4emPp199
::eg0/rx1wNQPfEVWB+kM9LVsJDAiDKWW5DrAOpur6+4o=
::fBEirQZwNQPfEVWB+kM9LVsJDCiDKWW5DrAOiA==
::cRolqwZ3JBvQF1fEqQIcKQ5aTwyHLiu8Cadcy+f5/evHgUEUUewrNu8=
::dhA7uBVwLU+EWHSB+Es/Olt5SQCLPSuTCLZSiA==
::YQ03rBFzNR3SWATE2Uc8IRRGDCmHOGK7RpwS66ab
::dhAmsQZ3MwfNWATE2Uc8IRRGDCmHOGK7RpwS66ab
::ZQ0/vhVqMQ3MEVWAtB9weVUEAlTi
::Zg8zqx1/OA3MEVWAtB9weVUEAlTi
::dhA7pRFwIByZRRnVuhJ+eHs=
::Zh4grVQjdCyDJGyX8VAjFAlNTQqbAE+/Fb4I5/jHzOWDq0MaaO4+bYHY0rGcHOwS/0vnfZM/mH9Cnas=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
chcp 65001 >nul

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