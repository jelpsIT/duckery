function Show-Menu {
    Write-Host "1. Lock PC"
    Write-Host "2. Custom Function"
    Write-Host "3. Test Function"
    Write-Host "4. Exit"
}

function Select-IPAddress {
    $ipAddress = Read-Host "Enter the client's IP address: "
    return $ipAddress
}

function Send-CodeToClient {
    param(
        [string]$IPAddress,
        [int]$Port,
        [string]$FunctionName,
        [string]$CustomCode
    )

    $client = New-Object System.Net.Sockets.TcpClient($IPAddress, $Port)
    $stream = $client.GetStream()
    $writer = New-Object System.IO.StreamWriter($stream)

    # Define functions
    $functions = @{
        "LockPC" = {
            Start-Process -FilePath "rundll32.exe" -ArgumentList "user32.dll,LockWorkStation"
            Write-Host "PC Locked."
        }
        "Custom" = {
            # Custom code goes here
            Write-Host "Custom function executed."
        }
        "Test" = {
            Write-Host "This is a test, to the client PC."
        }
    }

    while ($true) {
        Show-Menu
        $selection = Read-Host "Select a function (1-4): "

        # Validate the selection
        if ($selection -eq 4) {
            break  # Exit the loop and return to IP selection screen
        }
        elseif ($selection -lt 1 -or $selection -gt 3) {
            Write-Host "Invalid selection."
            continue  # Continue to next iteration of the loop
        }

        # Get the function name based on the selection
        $functionName = @{
            1 = "LockPC"
            2 = "Custom"
            3 = "Test"
        }[[int]$selection]  # Cast $selection as an integer

        # Select the appropriate function based on the provided FunctionName
        if ($functions.ContainsKey($functionName)) {
            $code = $functions[$functionName].ToString()
        }
        else {
            Write-Host "Invalid FunctionName."
            continue  # Continue to next iteration of the loop
        }

        $writer.WriteLine($code)
        $writer.Flush()
    }

    $writer.Close()
    $stream.Close()
    $client.Close()
}

$ipAddress = Select-IPAddress
Send-CodeToClient -IPAddress $ipAddress -Port 1234
