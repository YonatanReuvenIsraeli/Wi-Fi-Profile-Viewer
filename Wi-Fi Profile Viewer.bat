@echo off
setlocal
title Wi-Fi Profile Viewer
echo Program Name: Wi-Fi Profile Viewer
echo Version: 1.1.7
echo License: GNU General Public License v3.0
echo Developer: @YonatanReuvenIsraeli
echo GitHub: https://github.com/YonatanReuvenIsraeli
echo Sponsor: https://github.com/sponsors/YonatanReuvenIsraeli
goto "Start"

:"Start"
"%windir%\System32\netsh.exe" wlan show profile
if not "%errorlevel%"=="0" goto "Error1"
goto "Profile"

:"Error1"
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "Start"

:"Profile"
echo.
set Profile=
set /p Profile="Which Wi-Fi profile do you want to view? "
"%windir%\System32\netsh.exe" wlan show profile name="%Profile%" key=clear
if not "%errorlevel%"=="0" goto "Error2"
goto "Another"

:"Error2"
echo Profile %Profile% does not exist! Pleas try again.
goto "Profile"

:"Another"
echo.
set Another=
set /p Another="Do you want to view another Wi-Fi profile? (Yes/No) "
if /i "%Another%"=="Yes" goto "Profile"
if /i "%Another%"=="No" goto "Done"
echo Invalid syntax!
goto "Another"

:"Done"
endlocal
echo.
echo Press any key to close this batch file.
pause > nul 2>&1
exit
