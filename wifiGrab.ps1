$location = Read-Host "Do you want detailed info? (you really don't) [Y/n] " 

If (($location -eq "yes") -or ($location -eq "Yes") -or ($location -eq "Y") -or ($location -eq "y"))
{
    netsh wlan show profiles
    
    $networkName = Read-Host 'Which of the above is the wifi network that you want to know the password of?'
    
    netsh wlan show profile name=`"$networkName`" key=clear

    Write-host "The Key Content (under Security settings) is the wifi password! Thanks for using this script!"
    Write-host "If you see: " -NoNewline; Write-Host "Key Index  : 1" -ForegroundColor Green -BackgroundColor Black -NoNewline; Write-Host " instead of Key Content, then your network has no password."; 
}
Elseif (($location -eq "no") -or ($location -eq "No") -or ($location -eq "N") -or ($location -eq "n"))
{
    netsh wlan show profiles
    
    $networkName = Read-Host 'Which of the above is the wifi network that you want to know the password of?'

    netsh wlan show profile name=`"$networkName`" key=clear | find "Key Content"
   
    Write-host "Here is the wifi password! Thanks for using this script!"
    Write-host "If nothing was returned then you either typed something in wrong or the network has no password."
}
Else
{ 
    Write-Host -BackgroundColor Black -ForegroundColor Red "INVALID ENTRY! Please try again."
}

Write-Host -NoNewLine 'Press any key to exit...';

$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
