::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFAlNTQqbAE+/Fb4I5/jHzOWDq0MaaO4+bYHY0rGcHMMc6FflO58u2Ro=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJiZko0
::ZQ05rAF9IBncCkqN+0xwdVsGAlXi
::ZQ05rAF9IAHYFVzEqQITJxlGTUShMGK/CKFcxOnu4emPp199
::eg0/rx1wNQPfEVWB+kM9LVsJDAiDKWW5DrAOpur6+4o=
::fBEirQZwNQPfEVWB+kM9LVsJDCiDKWW5DrAOiA==
::cRolqwZ3JBvQF1fEqQIcKQ5aTwyHLiu8Cadcy+f5/evHgUEUUewrNu8=
::dhA7uBVwLU+EWHSB+Es/Olt5SQCLPSuTCLZSiA==
::YQ03rBFzNR3SWATE2Uc8IRRGDCmHOGK7RpwS66ab
::dhAmsQZ3MwfNWATE2Uc8IRRGDCmHOGK7RpwS66ab
::ZQ0/vhVqMQ3MEVWAtB9welUFLA==
::Zg8zqx1/OA3MEVWAtB9welUFLA==
::dhA7pRFwIByZRRnWuhNQ
::Zh4grVQjdCyDJGyX8VAjFAlNTQqbAE+/Fb4I5/jHzOWDq0MaaO4+bYHY0rGcHMMc6FflVpok03ROtMoZAhhQewDlaxcxyQ==
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
goto NodeCheck

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
echo Would you like to Update Cobra Client? [Y/N] or [A] for AutoUpdates or [C] to change install channels
choice /c ynac /n 
if %errorlevel% == 1 goto Update
if %errorlevel% == 2 goto BypassUpdate
if %errorlevel% == 3 goto EnableAuto
if %errorlevel% == 4 goto ChangeChannels

:ChangeChannels
cls
echo.
echo Which Cobra Client Channel Would you like to switch to?
echo.
if exist "C:\CCLaunchFiles\Channel\StableChannel.Cobra" ( echo 1 - Stable[Current Channel] ) else ( echo 1 - Stable )
if exist "C:\CCLaunchFiles\Channel\BetaChannel.Cobra" ( echo 2 - Beta[Current Channel] ) else ( echo 2 - Beta )
if exist "C:\CCLaunchFiles\Channel\CanaryChannel.Cobra" ( echo 3 - Canary[Current Channel] ) else ( echo 3 - Canary )

set /p Channel=What channel would you like to switch to? 
if %Channel% == 1 goto SwitchStable
if %Channel% == Stable goto SwitchStable
if %Channel% == stable goto SwitchStable
if %Channel% == 2 goto SwitchBeta
if %Channel% == Beta goto SwitchBeta
if %Channel% == beta goto SwitchBeta
if %Channel% == 3 goto SwitchCanary
if %Channel% == Canary goto SwitchCanary
if %Channel% == canary goto SwitchCanary

:SwitchStable
cd C:\
rmdir /S /Q C:\CCLaunchFiles\Channel
cd C:CCLaunchFiles
mkdir Channel
cd C:\CCLaunchFiles\Channel
echo Stable>>StableChannel.Cobra
goto UpdatePrompt

:SwitchBeta
cd C:\
rmdir /S /Q C:\CCLaunchFiles\Channel
cd C:CCLaunchFiles
mkdir Channel
cd C:\CCLaunchFiles\Channel
echo Beta>>BetaChannel.Cobra
goto UpdatePrompt

:SwitchCanary
cd C:\
rmdir /S /Q C:\CCLaunchFiles\Channel
cd C:CCLaunchFiles
mkdir Channel
cd C:\CCLaunchFiles\Channel
echo Canary>>CanaryChannel.Cobra
goto UpdatePrompt

:UpdateAuto
:Update

if exist "C:\CCLaunchFiles\Channel\StableChannel.Cobra" (
    goto StableDownload
) else (
    if exist "C:\CCLaunchFiles\Channel\BetaChannel.Cobra" (
        goto BetaDownload
    ) else (
        if exist "C:\CCLaunchFiles\Channel\CanaryChannel.Cobra" (
            goto CanaryDownload
        ) else (
            goto NormalDownload
        )
    )
)

:StableDownload
TASKKILL /F /IM hsscp.exe
timeout 3 >nul
cd C:\
rmdir /S /Q C:\CobraClient
mkdir CobraClient
attrib +H C:\CobraClient
cd C:\CobraClient
git clone https://github.com/RyanY321/CobraClientFiles.git -b Stable
goto AfterUpdate

:BetaDownload
TASKKILL /F /IM hsscp.exe
timeout 3 >nul
cd C:\
rmdir /S /Q C:\CobraClient
mkdir CobraClient
attrib +H C:\CobraClient
cd C:\CobraClient
git clone https://github.com/RyanY321/CobraClientFiles.git -b Beta
goto AfterUpdate

:CanaryDownload
TASKKILL /F /IM hsscp.exe
timeout 3 >nul
cd C:\
rmdir /S /Q C:\CobraClient
mkdir CobraClient
attrib +H C:\CobraClient
cd C:\CobraClient
git clone https://github.com/RyanY321/CobraClientFiles.git -b Canary
goto AfterUpdate

:NormalDownload
TASKKILL /F /IM hsscp.exe
timeout 3 >nul
cd C:\
rmdir /S /Q C:\CobraClient
mkdir CobraClient
attrib +H C:\CobraClient
cd C:\CobraClient
git clone https://github.com/RyanY321/CobraClientFiles.git -b Stable
goto AfterUpdate

:BypassUpdate
:AfterUpdate

cd C:\CobraClient\CobraClientFiles
call C:\CobraClient\CobraClientFiles\CobraClient.bat

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
TASKKILL /F /IM hsscp.exe
timeout 3 >nul
cd C:\
mkdir CobraClient
attrib +H C:\CobraClient
cd C:\CobraClient
git clone https://github.com/RyanY321/CobraClientFiles.git -b Stable
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
goto Update