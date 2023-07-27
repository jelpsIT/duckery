# Function to query installed software on a device
Function Get-InstalledSoftware {
    $software = Get-WmiObject Win32_Product | Select-Object Name, Version, Vendor
    return $software
}

# Function to query antivirus software on a device
Function Get-AntivirusSoftware {
    $antivirusSoftware = @()
    $antivirusKeys = Get-ChildItem -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" -ErrorAction SilentlyContinue |
        Get-ItemProperty |
        Where-Object { $_.DisplayName -like "*Bitdefender*" }

    foreach ($key in $antivirusKeys) {
        $antivirus = [PSCustomObject]@{
            "Name"    = $key.DisplayName
            "Version" = $key.DisplayVersion
            "Vendor"  = $key.Publisher
        }
        $antivirusSoftware += $antivirus
    }

    return $antivirusSoftware
}

# Function to query CPU information on a device
Function Get-CPUInfo {
    $cpu = Get-CimInstance -ClassName Win32_Processor
    return $cpu
}

# Function to query RAM information on a device
Function Get-RAMInfo {
    $ram = Get-CimInstance -ClassName Win32_PhysicalMemory
    return $ram
}

# Function to query available disk space on a device
Function Get-DiskInfo {
    $disks = Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }
    return $disks
}

# Function to create a JSON object for device inventory details
Function Create-DeviceInventoryJson {
    $device = Get-CimInstance -ClassName Win32_ComputerSystem
    $os = Get-CimInstance -ClassName Win32_OperatingSystem
    $serialNumber = Get-WmiObject -Class Win32_BIOS | Select-Object -ExpandProperty SerialNumber

    $deviceInventory = @{
        "DeviceName"       = $device.Name
        "Manufacturer"     = $device.Manufacturer
        "Model"            = $device.Model
        "SerialNumber"     = $serialNumber
        "OperatingSystem"  = $os.Caption
        "OSVersion"        = $os.Version
        "Processor"        = $device.SystemType
        "MemoryGB"         = [Math]::Round($device.TotalPhysicalMemory / 1GB, 2)
    }

    $cpuInfo = Get-CPUInfo
    $deviceInventory.Add("CPUName", $cpuInfo.Name)
    $deviceInventory.Add("Cores", $cpuInfo.NumberOfCores)
    $deviceInventory.Add("Threads", $cpuInfo.NumberOfLogicalProcessors)
    $deviceInventory.Add("MaxSpeedMHz", $cpuInfo.MaxClockSpeed)

    $ramInfo = Get-RAMInfo
    $totalRAM = ($ramInfo | Measure-Object -Property Capacity -Sum).Sum
    $deviceInventory.Add("TotalRAMGB", [Math]::Round($totalRAM / 1GB, 2))

    $ramSlotIndex = 1  # Initialize RAM slot index

    $ramInfo | ForEach-Object {
        $ramSlotKey = "Slot$ramSlotIndex"  # Use a different key for each RAM slot
        $deviceInventory.Add($ramSlotKey, [Math]::Round($_.Capacity / 1GB, 2))
        $ramSlotIndex++  # Increment the RAM slot index for the next iteration
    }

    $diskInfo = Get-DiskInfo
    $diskInfo | ForEach-Object {
        $deviceInventory.Add("Drive$($_.DeviceID)FreeSpaceGB", [Math]::Round($_.FreeSpace / 1GB, 2))
        $deviceInventory.Add("Drive$($_.DeviceID)TotalSpaceGB", [Math]::Round($_.Size / 1GB, 2))
    }

    $installedSoftware = Get-InstalledSoftware
    $deviceInventory.Add("InstalledSoftware", $installedSoftware)

    $antivirusSoftware = Get-AntivirusSoftware
    $deviceInventory.Add("AntivirusSoftware", $antivirusSoftware)

    $jsonOutput = ConvertTo-Json $deviceInventory -Depth 5
    return $jsonOutput
}

# Usage
$deviceInventoryJson = Create-DeviceInventoryJson
Write-Output $deviceInventoryJson
