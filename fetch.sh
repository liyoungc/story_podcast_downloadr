#!/bin/bash

# Specify the path to your CSV file
filename="podcasts.csv"

while IFS=',' read -r name url
do
    # Trim leading whitespace from the URL
    url="${url#"${url%%[![:space:]]*}"}"

    # Change to the podcast directory, create it if it doesn't exist
    mkdir -p "$name"
    cd "$name"

    # Download the podcast
    youtube-dl -o "%(playlist_index)s-%(title)s.%(ext)s" --playlist-reverse --extract-audio --audio-format mp3 "$url"

    # Go back to the parent directory
    cd ..
done < "$filename"
