# Prompt user for search term
$searchTerm = Read-Host "Enter search term for Google Images"

# Set parameters for Google Images search with safe search on
$url = "https://www.google.com/search?q=$searchTerm&tbm=isch&tbo=u&safe=inactive"

# Send request to Google Images and parse HTML response
$response = Invoke-WebRequest $url
$html = $response.Content
$doc = (New-Object -ComObject "HTMLFile")
$doc.IHTMLDocument2_write($html)

# Find all image elements and extract image source URLs
$imageElements = $doc.getElementsByTagName("img")
$imageUrls = foreach ($image in $imageElements) {
    $image.src
}

# Download each image to the desktop with a unique file name
foreach ($imageUrl in $imageUrls) {
    $imageFileName = [System.IO.Path]::GetRandomFileName() + '.jpg'
    $imageFilePath = "$($env:USERPROFILE)\Desktop\$imageFileName"
    Invoke-WebRequest $imageUrl -OutFile $imageFilePath
}

# Notify user that download is complete
Write-Host "Image download complete."

