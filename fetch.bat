@echo on
setlocal enabledelayedexpansion

:: Read each line from the CSV file
for /f "tokens=1,2 delims=," %%a in (podcasts.csv) do (
    :: Remove leading and trailing spaces from the podcast name and URL
    set "name=%%~a"
    set "url=%%~b"
    
    :: Remove spaces from the podcast name
    set "name=!name: =!"
    
    echo Processing podcast "!name!" with URL "!url!"

    :: Create a directory for the podcast if it doesn't exist
    if not exist "!name!" (
        echo Creating directory "!name!"
        mkdir "!name!"
    ) else (
        echo Directory "!name!" already exists.
    )
    
    :: Change to the podcast directory
    echo Changing to directory "!name!"
    cd "!name!"

    :: Download the podcast using youtube-dl
    echo Downloading podcast from "!url!" using youtube-dl.
    youtube-dl -o "%%(playlist_index)s-%%(title)s.%%(ext)s" --playlist-reverse --extract-audio --audio-format mp3 "!url!"

    :: Change back to the parent directory
    echo Changing back to parent directory.
    cd ..
)

endlocal
