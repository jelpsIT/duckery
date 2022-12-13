# Removes Webroot SecureAnywhere by force
# Run the script once, reboot, then run again

# Webroot SecureAnywhere registry keys
$RegKeys = @(
    "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\WRUNINST",
    "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\WRUNINST",
    "HKLM:\SOFTWARE\WOW6432Node\WRData",
    "HKLM:\SOFTWARE\WOW6432Node\WRCore",
    "HKLM:\SOFTWARE\WOW6432Node\WRMIDData",
    "HKLM:\SOFTWARE\WOW6432Node\webroot",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WRUNINST",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\WRUNINST",
    "HKLM:\SOFTWARE\WRData",
    "HKLM:\SOFTWARE\WRMIDData",
    "HKLM:\SOFTWARE\WRCore",
    "HKLM:\SOFTWARE\webroot",
    "HKLM:\SYSTEM\ControlSet001\services\WRSVC",
    "HKLM:\SYSTEM\ControlSet001\services\WRkrn",
    "HKLM:\SYSTEM\ControlSet001\services\WRBoot",
    "HKLM:\SYSTEM\ControlSet001\services\WRCore",
    "HKLM:\SYSTEM\ControlSet001\services\WRCoreService",
    "HKLM:\SYSTEM\ControlSet001\services\wrUrlFlt",
    "HKLM:\SYSTEM\ControlSet002\services\WRSVC",
    "HKLM:\SYSTEM\ControlSet002\services\WRkrn",
    "HKLM:\SYSTEM\ControlSet002\services\WRBoot",
    "HKLM:\SYSTEM\ControlSet002\services\WRCore",
    "HKLM:\SYSTEM\ControlSet002\services\WRCoreService",
    "HKLM:\SYSTEM\ControlSet002\services\wrUrlFlt",
    "HKLM:\SYSTEM\CurrentControlSet\services\WRSVC",
    "HKLM:\SYSTEM\CurrentControlSet\services\WRkrn",
    "HKLM:\SYSTEM\CurrentControlSet\services\WRBoot",
    "HKLM:\SYSTEM\CurrentControlSet\services\WRCore",
    "HKLM:\SYSTEM\CurrentControlSet\services\WRCoreService",
    "HKLM:\SYSTEM\CurrentControlSet\services\wrUrlFlt"
)

# Webroot SecureAnywhere startup registry item paths
$RegStartupPaths = @(
    "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
)

# Webroot SecureAnywhere folders
$Folders = @(
    "C:\ProgramData\WRData",
    "C:\ProgramData\WRCore",
    "C:\ProgramFiles\Webroot",
    "C:\ProgramFiles(x86)\Webroot",
    "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Webroot SecureAnywhere"
)

# Stop & Delete Webroot SecureAnywhere service
taskkill /im wrsa.exe /f
sc.exe stop WRSVC
sc.exe stop WRCoreService
sc.exe stop WRSkyClient
sc.exe delete WRSVC
sc.exe delete WRCoreService
sc.exe delete WRSkyClient

# Stop Webroot SecureAnywhere process
Stop-Process -Name "WRSA" -Force

# Remove Webroot SecureAnywhere registry keys
ForEach ($RegKey in $RegKeys) {
    Write-Host "Removing $RegKey"
    Remove-Item -Path $RegKey -Recurse -ErrorAction SilentlyContinue
}

# Remove Webroot SecureAnywhere registry startup items
ForEach ($RegStartupPath in $RegStartupPaths) {
    Write-Host "Removing WRSVC from $RegStartupPath"
    Remove-ItemProperty -Path $RegStartupPath -Name "WRSVC"
}

# Remove Webroot SecureAnywhere folders
ForEach ($Folder in $Folders) {
    Write-Host "Removing $Folder"
    Remove-Item -Path "$Folder" -Recurse 
}

Write-Host A212-WRSM-AEDA-C43C-4681

# Remove Teams Machine-Wide Installer
Write-Host "Removing Webroot SecureAnywhere" -ForegroundColor Yellow

$MachineWide = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Webroot SecureAnywhere"}
$MachineWide.Uninstall()
$application = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq “Webroot SecureAnywhere”}
$application2 = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq “Webroot SecureAnywhere”}
$application.Uninstall()
$application2.Uninstall()

Remove-Item -Path "C:\Program Files\Webroot" -Recurse
Remove-Item -Path "C:\ProgramData\WRData" -Recurse
Remove-Item -Path "C:\ProgramData\WRCore" -Recurse
Remove-Item -Path "C:\Users\All Users\Webroot" -Recurse

# Delete the Webroot registry keys
reg delete HKLM\SOFTWARE\WOW6432Node\webroot /f
reg delete HKLM\SOFTWARE\WOW6432Node\WRData /f
reg delete HKLM\SOFTWARE\WOW6432Node\WRData /f

# Delete any remaining Webroot files
Remove-Item -Path "C:\*Webroot*" -Recurse
Remove-Item -Path "C:\Users\*\AppData\Local\Webroot" -Recurse
Remove-Item -Path "C:\Users\*\AppData\Roaming\Webroot" -Recurse

# Try to Uninstall - https://community.webroot.com/webroot-secureanywhere-antivirus-12/pc-uninstallation-option-missing-from-control-panel-34688
Start-Process -FilePath "${Env:ProgramFiles(x86)}\Webroot\WRSA.exe" -ArgumentList "-uninstall" -Wait -ErrorAction SilentlyContinue
Start-Process -FilePath "${Env:ProgramFiles}\Webroot\WRSA.exe" -ArgumentList "-uninstall" -Wait -ErrorAction SilentlyContinue
