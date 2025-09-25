$processList = Get-Process | Where-Object {$_.ProcessName -ilike "chrome"}
if ($processList.Count -eq 0){
    Start-Process "https://Champlain.edu"
}
 else {
    Stop-Process $processList
}
# Use the following to check if its working. 
# Write-Host $processList
