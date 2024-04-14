@echo off
setlocal
title Wi-Fi Profile Viewer
echo Wi-Fi Profile Viewer v1.0.1
echo.
goto Start

:Start
netsh wlan show profile
goto Profile

:Profile
echo.
set Profile=
set /p Profile="Which Wi-Fi profile do you want to view? "
netsh wlan show profile name="%Profile%" key=clear
if not errorlevel 0 goto Profile
goto Another

:Another
echo.
set Another=
set /p Another="Do you want to view another Wi-Fi profile? (Yes/No) "
if /i "%Another%"=="Yes" goto Profile
if /i "%Another%"=="No" goto Done
echo Invalid Syntax!
goto Another

:Done
endlocal
echo Press any key to close this batch file.
pause > nul
exit
