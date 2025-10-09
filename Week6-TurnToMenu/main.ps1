. (Join-Path $PSScriptRoot ApacheSkibidiLogs.ps1)
. (Join-Path $PSScriptRoot Start-ChromeWithChamplain.ps1)
. (Join-Path $PSScriptRoot Users.ps1)
. (Join-Path $PSScriptRoot Event-Logs.ps1)

clear

$menu = "`n"
$menu += "1 - Display last 10 Apache Logs`n"
$menu += "2 - Display last 10 failed Logins for all Users`n"
$menu += "3 - Display at risk users`n"
$menu += "4 - Start Chrome web browser and naviagte to Champlain.edu`n"
$menu += "5 - Exit program`n"

While ($true) {
    Write-Host $menu | Out-String
    $choice = Read-Host

    if ($choice -eq 1){
    ApacheLogs1 | Select-Object -last 10 | Format-Table | Out-String
    
    }
    elseif ($choice -eq 2) {
    Write-Host "How many days ago for these logs?"
    $days = Read-Host

        if ($days -match "^\d+$"){
    Write-Host "Proper input detected. Processing..."
    }
        else {
    Write-Host "Thats no valid integer :("
    continue
    }

    getFailedLogins($days) | Select-Object -first 10 | Format-Table | Out-String
    
    }

    elseif ($choice -eq 3){
    Write-Host "How many days ago for these logs?"
    $days = Read-Host

        if ($days -match "^\d+$"){
    Write-Host "Proper input detected. Processing..."
    }
        else {
    Write-Host "Thats no valid integer :("
    continue
    }

    $results = atRiskUsers($days)
    Write-Host ($results | Format-Table | Out-string)
    }

    elseif ($choice -eq 4){
    startChamplainChrome
    }

    elseif ($choice -eq 5){
    exit
    }

    else {
    Write-Host "$choice is not a valid option, choose an integer between 1-5"
    }
}