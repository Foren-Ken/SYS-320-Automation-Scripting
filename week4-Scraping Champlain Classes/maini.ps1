. (Join-Path $PSScriptRoot scriptStepI.ps1)

$table = gatherClasses
$table | Select-Object "Class Code", Instructor, Location, Days, "Time Start", "Time End" |
Where-Object {$_.Instructor -ilike "*Furkan*"}