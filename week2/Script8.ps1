cd $PSScriptRoot

$files=(Get-ChildItem)
for ($x=0; $x -le $files.Count; $x++){

    if ($files[$x].Name -ilike "*ps1"){
        Write-Host $files[$x].Name
    }
}