@echo off
echo Cleaning system... please wait.

:: Clear user temp
echo Deleting %TEMP% files...
del /q /f /s "%TEMP%\*.*" >nul 2>&1

:: Clear Windows temp
echo Deleting Windows temp files...
del /q /f /s "C:\Windows\Temp\*.*" >nul 2>&1

:: Clear Edge/Chrome cache
echo Clearing browser cache...
del /q /f /s "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
del /q /f /s "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1

:: Clear Windows log files
echo Clearing log files...
del /q /f /s "C:\Windows\Logs\*.*" >nul 2>&1

:: Empty recycle bin
echo Emptying recycle bin...
PowerShell.exe -NoProfile -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"

echo Done!
pause

