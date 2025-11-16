# Dump Wi-Fi passwords on Windows
# Does not require admin privileges

@echo off
for /f "tokens=2 delims=: " %%a in ('netsh wlan show profiles ^| find "All User Profile"') do (
    netsh wlan show profile name="%%a" key=clear | findstr "SSID Name Key Content"
    echo.
)
pause > nul
