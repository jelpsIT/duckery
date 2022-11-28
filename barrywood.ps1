function download {
New-Item -ItemType Directory -Force -Path C:\Temp
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $outpath)

$url = 'https://i.ebayimg.com/images/g/1SEAAOSwKcRhL~15/s-l1600.jpg'
$outpath = "C:\Temp\s-l1600.jpg"
Invoke-WebRequest -Uri $url -OutFile $outpath
}


function Set-Wallpaper {

param (
    [parameter(Mandatory=$True)]
    # Provide path to image
    [string]$Image
    # Provide wallpaper style that you would like applied
)
 
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -PropertyType String -Value $WallpaperStyle -Force
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -PropertyType String -Value 1 -Force
 
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -PropertyType String -Value $WallpaperStyle -Force
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -PropertyType String -Value 0 -Force
 

 
Add-Type -TypeDefinition @" 
using System; 
using System.Runtime.InteropServices;
  
public class Params
{ 
    [DllImport("User32.dll",CharSet=CharSet.Unicode)] 
    public static extern int SystemParametersInfo (Int32 uAction, 
                                                   Int32 uParam, 
                                                   String lpvParam, 
                                                   Int32 fuWinIni);
}
"@ 
  
    $SPI_SETDESKWALLPAPER = 0x0014
    $UpdateIniFile = 0x01
    $SendChangeEvent = 0x02
  
    $fWinIni = $UpdateIniFile -bor $SendChangeEvent
  
    $ret = [Params]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $Image, $fWinIni)
}
 
Set-WallPaper -Image "C:\Temp\s-l1600.jpg"
