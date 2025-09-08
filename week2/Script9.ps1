$folderpath = $PSScriptRoot + "\outfolder\"
if (Get-ChildItem $folderpath){
    Write-Host "Folder already exists"
}
else {
    New-Item -ItemType Directory -Path $folderpath
}