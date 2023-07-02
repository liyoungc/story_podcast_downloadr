# Specify the path to your CSV file
$filename = "podcasts.csv"

# Read the CSV file
$csv = Import-Csv -Path $filename -Header Name, Url -Delimiter ","

# Loop over each line in the CSV file
foreach ($row in $csv) {
    # Get the name and URL from the CSV row
    $name = $row.Name
    $url = $row.Url.Trim()

    # Change to the podcast directory, create it if it doesn't exist
    if (!(Test-Path -Path $name)) {
        New-Item -ItemType Directory -Force -Path $name
    }
    Set-Location -Path $name

    # Download the podcast
    youtube-dl -o "%(playlist_index)s-%(title)s.%(ext)s" --playlist-reverse --extract-audio --audio-format mp3 $url

    # Go back to the parent directory
    Set-Location -Path ..
}
