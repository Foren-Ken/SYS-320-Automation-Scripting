. (Join-Path $PSScriptRoot scriptStepI.ps1)

$table = gatherClasses
$applicable = $table | Where-Object {
($_."Class Code" -ilike "SYS*") -or
($_."Class Code" -ilike "NET*") -or
($_."Class Code" -ilike "SEC*") -or
($_."Class Code" -ilike "FOR*") -or
($_."Class Code" -ilike "CSI*") -or
($_."Class Code" -ilike "DAT*")
} | Sort-Object "Instructor" | Select-Object "Instructor" -Unique

$table | Where-Object {$_.Instructor -in $applicable.Instructor} | 
Group-Object "Instructor" | Select-Object "Count","Name" | Sort-Object Count -Descending