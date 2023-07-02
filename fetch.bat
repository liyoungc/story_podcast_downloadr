@echo off
setlocal enabledelayedexpansion

:: Read each line from the CSV file
for /f "tokens=1,2 delims=," %%a in (podcasts.csv) do (
    :: Remove spaces from the podcast name
    set "name=%%a"
    set "name=!name: =!"

    :: Create a directory for the podcast if it doesn't exist
    if not exist "!name!" mkdir "!name!"
    
    :: Change to the podcast directory
    cd "!name!"

    :: Download the podcast using youtube-dl
    youtube-dl -o "%%(playlist_index)s-%%(title)s.%%(ext)s" --playlist-reverse --extract-audio --audio-format mp3 "%%b"

    :: Change back to the parent directory
    cd ..
)

endlocal
