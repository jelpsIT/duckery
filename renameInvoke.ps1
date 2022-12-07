powershell -ExecutionPolicy Bypass -Command "[scriptblock]::Create((Invoke-WebRequest "https://raw.githubusercontent.com/jelpsIT/duckery/main/renamedevice.ps1").Content).Invoke();"
