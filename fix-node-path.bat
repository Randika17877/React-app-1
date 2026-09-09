@echo off
setlocal enabledelayedexpansion

echo ===================================================
echo   Node.js Environment Diagnostic ^& Auto-Fixer
echo ===================================================
echo.

:: Define search paths
set "NODE_PATH_1=C:\Program Files\nodejs"
set "NODE_PATH_2=C:\Program Files (x86)\nodejs"
set "NODE_PATH_3=%USERPROFILE%\AppData\Local\nvm"

:: Check if node.exe exists in common locations
if exist "%NODE_PATH_1%\node.exe" (
    set "FOUND_PATH=%NODE_PATH_1%"
) else if exist "%NODE_PATH_2%\node.exe" (
    set "FOUND_PATH=%NODE_PATH_2%"
) else if exist "%NODE_PATH_3%\node.exe" (
    set "FOUND_PATH=%NODE_PATH_3%"
)

if defined FOUND_PATH (
    echo [FOUND] Node.js was found at: "!FOUND_PATH!"
    echo.
    
    :: Check if it's already in the PATH
    echo %PATH% | findstr /I /C:"!FOUND_PATH!" >nul
    if !errorlevel! EQU 0 (
        echo [OK] Node.js is already in your environment PATH.
        echo.
        echo If you are still seeing the error, please:
        echo 1. Close ALL open Command Prompt / PowerShell / VS Code windows.
        echo 2. Open a NEW terminal window and try running the command again.
    ) else (
        echo [FIXING] Node.js is not in your environment PATH. Adding it now...
        
        :: Retrieve current User PATH
        for /f "tokens=2*" %%A in ('reg query "HKCU\Environment" /v Path 2^>nul') do set "USER_PATH=%%B"
        
        :: Append node path to User PATH
        if defined USER_PATH (
            setx PATH "!USER_PATH!;!FOUND_PATH!" >nul
        ) else (
            setx PATH "!FOUND_PATH!" >nul
        )
        
        echo [SUCCESS] Node.js path has been added to your User PATH variable!
        echo.
        echo IMPORTANT:
        echo Please CLOSE all your current VS Code/terminal windows and open a NEW one.
        echo Environment variables only take effect in new terminal sessions.
    )
) else (
    echo [ERROR] Node.js could not be found on your computer.
    echo.
    echo Please download and install Node.js from the official website:
    echo --^> https://nodejs.org/
    echo.
    echo Make sure to check "Add to PATH" during installation.
)

echo.
echo ===================================================
pause
