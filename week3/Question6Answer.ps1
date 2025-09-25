. (Join-Path $PSScriptRoot Question5Answer.ps1)
. (Join-Path $PSScriptRoot Question4Answer.ps1)

# Logs from Question 5:
$ShutdownStartup = ObtainGLogsXDaysAgo(100)
$ShutdownStartup

# Logs from Question 4:
$Login = ObtainLogsXDaysAgo(100)
$login
