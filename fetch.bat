@echo off

REM Check if youtube-dl is installed
where youtube-dl >nul 2>nul
if %errorlevel% neq 0 (
    echo Error: youtube-dl is not installed.
    echo Please install youtube-dl and make sure it is in your system's PATH.
    exit /b
)

REM Check if ffmpeg is installed
where ffmpeg >nul 2>nul
if %errorlevel% neq 0 (
    echo Error: ffmpeg is not installed.
    echo Please install ffmpeg and make sure it is in your system's PATH.
    exit /b
)

REM Run the PowerShell script
powershell -ExecutionPolicy Bypass -File .\fetch.ps1
