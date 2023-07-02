@echo off
setlocal enabledelayedexpansion

for /f "tokens=1,2 delims=," %%a in (podcasts.csv) do (
    set "name=%%a"
    set "url=%%b"

    rem Trim leading whitespace from the url
    for /f "tokens=*" %%c in ("!url!") do set "url=%%c"

    rem Create the directory if it doesn't exist and navigate into it
    if not exist "!name!" mkdir "!name!"
    cd "!name!"

    rem Download the podcast
    youtube-dl -o "%%(playlist_index)s-%%(title)s.%%(ext)s" --playlist-reverse --extract-audio --audio-format mp3 "!url!"

    rem Navigate back to the parent directory
    cd ..
)
