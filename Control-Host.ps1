function Show-Menu {
    Write-Host "1. Lock PC"
    Write-Host "2. Custom Function"
    Write-Host "3. Test Function"
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
            Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;

    public class MessageBox
    {
        [DllImport("user32.dll", CharSet = CharSet.Unicode)]
        public static extern int MessageBoxW(IntPtr hWnd, string text, string caption, uint type);
    }
"@

$counter = 0
$screenCount = [System.Windows.Forms.Screen]::AllScreens.Length

while ($counter -lt 120) {
    $x = Get-Random -Minimum 0 -Maximum ($screenCount * [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width)
    $y = Get-Random -Minimum 0 -Maximum [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height

    [MessageBox]::MessageBoxW(0, "???", "Random Pop-up", 0)

    $counter++
}

            Write-Host "Custom function executed."
        }
        "Test" = {
            Write-Host "This is a test, to the client PC."
        }
    }

    Show-Menu
    $selection = Read-Host "Select a function (1-3): "

    # Validate the selection
    if ($selection -lt 1 -or $selection -gt 3) {
        Write-Host "Invalid selection."
        return
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
        return
    }

    $writer.WriteLine($code)
    $writer.Flush()

    $writer.Close()
    $stream.Close()
    $client.Close()
}


$ipAddress = Read-Host "Enter the client's IP address: "
Send-CodeToClient -IPAddress $ipAddress -Port 1234
