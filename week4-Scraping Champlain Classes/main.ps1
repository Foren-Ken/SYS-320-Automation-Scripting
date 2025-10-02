. (Join-Path $PSScriptRoot scriptStepI.ps1)

$table = gatherClasses
$table | Where-Object { ($_.Location -ilike "JOYC 310") -and ($_.days -ilike "Monday") } | 
Sort-Object "Time Start" |Select-Object "Time Start", "Time End", "Class Code"