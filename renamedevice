$renameDTInput = $null
$renameOInput = $null
$OffChoice = $null
$DTChoice = $null
$inputString = $null
function rename-DeviceType {
    [cmdletbinding()]
    param (
        [string]$title = 'Select device type'
    )
    Write-Host "================ $title ================" -ForegroundColor Yellow

    Write-Host "1: Laptop" -ForegroundColor Green
    Write-Host "2: Desktop" -ForegroundColor Green

    $renameDTInput = Read-Host "Please select a device type.."
    return $renameDTInput
}
try {
	$errorMsg = $null
    $DTChoice = $null
    while ($DTChoice -notin 1, 2) {
        Clear-Host
        $welcomeScreen = "IF9fICBfXyAgICBfXyAgX19fX19fICBfX19fX18gIF9fX19fXwovXCBcL1wgIi0uLyAgXC9cICBfXyBcL1wgIF9fX1wvXCAgX19fXApcIFwgXCBcIFwtLi9cIFwgXCAgX18gXCBcIFxfXyBcIFwgIF9fXAogXCBcX1wgXF9cIFwgXF9cIFxfXCBcX1wgXF9fX19fXCBcX19fX19cCiAgXC9fL1wvXy8gIFwvXy9cL18vXC9fL1wvX19fX18vXC9fX19fXy8KIF9fX19fICAgX19fX19fICBfX19fX18gIF9fICAgICAgX19fX19fICBfXyAgX18KL1wgIF9fLS4vXCAgX19fXC9cICA9PSBcL1wgXCAgICAvXCAgX18gXC9cIFxfXCBcClwgXCBcL1wgXCBcICBfX1xcIFwgIF8tL1wgXCBcX19fXCBcIFwvXCBcIFxfX19fIFwKIFwgXF9fX18tXCBcX19fX19cIFxfXCAgIFwgXF9fX19fXCBcX19fX19cL1xfX19fX1wKICBcL19fX18vIFwvX19fX18vXC9fLyAgICBcL19fX19fL1wvX19fX18vXC9fX19fXy8KICAgICAgIF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCiAgICAgICA9PT09PT0gTEYgQXNzZXQgUmVnaXN0cmF0aW9uID09PT09PQogICAgICAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKio="
        Write-Host $([system.text.encoding]::UTF8.GetString([system.convert]::FromBase64String($welcomeScreen)))
        Start-Sleep -Seconds 2
        $DTChoice = rename-DeviceType
    }
    if($DTChoice -eq 1)
        {
            $NewPCName = "LT-"
        }
        else
        {
            $NewPCName = "DT-"
        }
}
catch {
    $errorMsg = $_.Exception.Message
}
function rename-DeviceOffice {
    [cmdletbinding()]
    param (
        [string]$title = 'Select your office'
    )
    Write-Host "================ $title ================" -ForegroundColor Yellow

    Write-Host "1: Portsmouth" -ForegroundColor Green
    Write-Host "2: Bristol" -ForegroundColor Green
    Write-Host "3: Bournemouth" -ForegroundColor Green

    $renameOInput = Read-Host "Please select an office.."
    return $renameOInput
}
try {
	$errorMsg1 = $null
    $OffChoice = $null
    while ($OffChoice -notin 1, 2, 3) {
        $OffChoice = rename-DeviceOffice
    }
    if($OffChoice -eq 1)
        {
            $Location = "POR-"
        }
        elseif($OffChoice -eq 2)
        {
            $Location = "BRS-"
        }             
		else
        {
            $Location = "BOU-"
        }
}
catch {
    $errorMsg1 = $_.Exception.Message
}
#endregion
#region Main process
$ComputerName = $NewPCName + $Location + $inputString
$inputStringOK = $false
$match = "\b\d{1,5}\b$"
While (-not $inputStringOK) {
    $inputString = Read-Host "Enter Asset Number"
    If ( ($inputString -match $match)) {
        $inputStringOK = $true
		$ComputerName = $NewPCName + $Location + $inputString
        Write-host You entered asset number: $ComputerName
    }
    else {
        Write-Host "`You must enter a numeric value that is no longer than 5 characters"
    }
}


Remove-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -name "Hostname" 
Remove-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -name "NV Hostname" 

Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\Computername\Computername" -name "Computername" -value $ComputerName
Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\Computername\ActiveComputername" -name "Computername" -value $ComputerName
Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -name "Hostname" -value $ComputerName
Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -name "NV Hostname" -value  $ComputerName
Set-ItemProperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -name "AltDefaultDomainName" -value $ComputerName
Set-ItemProperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -name "DefaultDomainName" -value $ComputerName

$renameDTInput = $null
$renameOInput = $null
$OffChoice = $null
$DTChoice = $null
$inputString = $null
