@echo off
CLS
set currentpath=%cd%
echo "Starting automatic file installation by chocolatey"
echo "Script made by Luukgr"
echo "Run at your own risk"
echo "Script needs to run in admin mode"
ECHO.
:MENU
ECHO ...............................................
ECHO WELCOME 
ECHO CHOOSE YOUR OPTION (1-4)
ECHO ...............................................
ECHO.
ECHO 1 - Basic apps
ECHO 2 - Install Chocolatey (For the first time using this)
ECHO 3 - Upgrade apps
ECHO 4 - EXIT
ECHO.


SET /P M=Type 1, 2, 3, or 4 then press ENTER:
IF %M%==1 GOTO GEN
IF %M%==3 GOTO FIR
IF %M%==4 GOTO UPG
IF %M%==5 GOTO EOF

:FIR
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco feature enable -n allowGlobalConfirmation
choco upgrade chocolatey
ECHO ...............................................
ECHO A RESTART OF THE BATCH FILE IS MAYBE NECESSARY!!
ECHO ...............................................
ECHO ...............................................
GOTO MENU

:UPG
choco upgrade all
GOTO MENU

:GEN
REM basic apps
choco install %currentpath%\defaultapps.config   
GOTO MENU

:EOF
