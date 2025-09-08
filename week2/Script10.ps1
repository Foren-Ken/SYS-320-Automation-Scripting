$currentDirectory = pwd
$folderpath = $PSScriptRoot + "/outfolder/"
$filepath = $folderpath + "out.csv"

(Get-ChildItem | Where-Object {$_.Name -ilike "*.ps1"}).Name | Export-Csv -Path $filepath