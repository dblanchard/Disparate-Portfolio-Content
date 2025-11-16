@echo off
setlocal enabledelayedexpansion

for /f "tokens=*" %%i in ('netsh wlan show profiles ^| findstr "All User Profile"') do (
    set "line=%%i"
    set "ssid=!line:~27!"
    echo SSID: !ssid!
    netsh wlan show profile name="!ssid!" key=clear | findstr "Key Content"
    echo.
)
pause
