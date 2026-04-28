@echo off 
title System Cleanup Tool


:main_menu
cls
echo ========================================
echo		System Cleanup Tool
echo ========================================

echo. 
echo 1. Clean user temp files
echo 2. Clean Windows temp files
echo 3. Clear browser cache (Chrome/Edge)
echo 4. Clear Windows log files
echo 5. Empty Recycle Bin
echo 6. Run FULL cleanup
echo 0. Exit
echo.
set /p choice=Select an option:


if "%choice%"=="1" goto clean_user_temp
if "%choice%"=="2" goto clean_windows_temp
if "%choice%"=="3" goto clean_browser_cache
if "%choice%"=="4" goto clean_logs
if "%choice%"=="5" goto empty_recycle
if "%choice%"=="6" goto full_cleanup
if "%choice%"=="0" goto exit_script

echo.
echo Invalid choice. Press any key to try again...
pause >nul

goto main_menu

:clean_user_temp
echo.
echo Deleting user temp files...
del /q /f /s "%TEMP%\*.*" >nul 2>&1
echo Done.
pause
goto main_menu


:clean_windows_temp
echo.
echo Deleting Windows temp files...
del /q /f /s "C:Windows\Temp\*.*" >nul 2>&1
echo Done.
pause
goto main_menu


:clean_browser_cache
echo.
echo Clearing browser cache...
del /q /f /s "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
del /q /f /s "%LOCALAPPDATA%\Google\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
echo Done.
pause 
goto main_menu


:clean_logs
echo. 
echo Clearing Windows log files...
del /q /f /s "C:\Windows\Logs\*.*" >nul 2>&1
echo Done.
pause
goto main_menu

:clean_logs
echo.
echo Clearing Windows log files...
del /q /f /s "C:\Windows\logs\*.*" >nul 2>&1
echo Done. 
pause
goto main_menu


:empty_recycle
echo.
echo Clearing Recycle Bin...
Powershell.exe -NoProfile -Comand "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"
echo Done.
pause
goto main_menu


:full_cleanup
echo.
echo Running full cleanup...
call :clean_user_temp_nopause
call :clean_windows_temp_nopause
call :clean_browser_cache_nopause
call :clean_logs_nopause
call :empty_recycle_nopause
echo.
echo Full cleanup Complete.
pause
goto main_menu


:clean_user_temp_nopause
echo Deleting user temp files...
del /q /f /s "%TEMP%\*.*" >nul 2>&1
goto :eof

:clean_windows_temp_nopause
echo Deleting Windows temp files...
del /q /f /s "C:\Windows\Temp\*.*" >nul 2>&1
goto :eof


:clean_browser_cache_nopause
echo Cleaning Browser Cache...
del /q /f /s "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
del /q /f /s "%LOCALAPPDATA%\Google\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
goto :eof
:clean_logs_nopause
echo Clearing Windows log files...
del /q /f /s "C:\Windows\Logs\*.*" >nul 2>&1
goto :eof


:empty_recycle_nopause
echo Emptying Recycle Bin...
PowerShell.exe -NoProfile -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"
goto :eof


:exit_script
echo.
echo Exiting System Cleanup Tool...
timeout /t 1 >nul
exit /b 
