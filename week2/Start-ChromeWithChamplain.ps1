$processList = Get-Process | Where-Object {$_.ProcessName -ilike "chrome"}
Write-Host $processList.Length