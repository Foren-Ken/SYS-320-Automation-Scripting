. "C:\Users\champuser\SYS-320-Automation-Scripting\Week6-TurnToMenu\Event-Logs.ps1"
. "C:\Users\champuser\SYS-320-Automation-Scripting\week7-ScheduledEmailReportsOfAtRiskUsers\email.ps1"
. "C:\Users\champuser\SYS-320-Automation-Scripting\week7-ScheduledEmailReportsOfAtRiskUsers\Scheduler.ps1"
. "C:\Users\champuser\SYS-320-Automation-Scripting\week7-ScheduledEmailReportsOfAtRiskUsers\config.ps1"

$configuration = showconfig

$failed = atRiskUsers $configuration.Days

# Write-Host $failed

SendAlertMail ($Failed | Format-Table | Out-String)

ChooseTimeToRun($configuration.ExeTime)