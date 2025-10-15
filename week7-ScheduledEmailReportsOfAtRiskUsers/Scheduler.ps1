function ChooseTimeToRun($Time){
$st = Get-ScheduledTask | Where-Object { $_.TaskName -ilike "AwesomeTask" }
if($st -ne $null){
   Write-Host "The task already exists!" | Out-String
   DisableAutoRun
}
Write-Host "Creating new task." | Out-String

$act = New-ScheduledTaskAction -Execute "powershell.exe" -Argument '-File "C:\Users\champuser\SYS-320-Automation-Scripting\week7-ScheduledEmailReportsOfAtRiskUsers\main.ps1"'

$trigger = New-ScheduledTaskTrigger -Daily -At $Time
$princ = New-ScheduledTaskPrincipal -UserId "champuser" -RunLevel Highest
$set = New-ScheduledTaskSettingsSet -RunOnlyIfNetworkAvailable -WakeToRun
$task = New-ScheduledTask -Action $act -Principal $princ -Trigger $trigger -Settings $set

Register-ScheduledTask "AwesomeTask" -InputObject $task

Get-ScheduledTask | Where-Object {$_.TaskName-ilike "AwesomeTask"}
}

function DisableAutoRun(){
$st = Get-ScheduledTask | Where-Object { $_.TaskName -ilike "AwesomeTask"}

if ($st -ne $null){
    Write-Host "Unregistering the task." | Out-String
    Unregister-ScheduledTask -TaskName "AwesomeTask" -Confirm:$false
}
else{Write-Host "Thats not a resgistered task!" | Out-String}

}