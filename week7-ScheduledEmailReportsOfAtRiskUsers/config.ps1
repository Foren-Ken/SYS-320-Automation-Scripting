$configlocal = "C:\Users\champuser\SYS-320-Automation-Scripting\week7-ScheduledEmailReportsOfAtRiskUsers\config.txt"

function showconfig(){
    $content = Get-Content $configlocal
    # $configTable = @()
    $configTable = [PSCustomObject]@{
    "Days" = $content[0];
    "ExeTime" = $content[1];
    }
    $content
    return $configTable
}

function readConfig(){
    $content = Get-Content $configlocal


    $configTable = [PSCustomObject]@{
    "Days" = $content[0];
    "ExeTime" = $content[1];
    }

    # $theTable = showconfig -conlog $configlocal

    return $configTable
}

function changeConfig(){
$replacementData = @()
    $replacementData += Read-Host -Prompt "How many days in the config file?`n"
    if ($replacementData[0] -match "^\d+$") {
    Write-Host "Valid number of days. Processing..."
    }

    else {
    Write-Host "Invalid Number :("
    continue
    }

    $replacementData += Read-Host -Prompt "At what time in the config file?`n"
    
    if ($replacementData[1] -match "^1[0-2]:[0-5]\d (PM|AM)$"){
    Write-Host "Valid Time. Processing..."     
    }
    
    elseif ($replacementData[1] -match "^[1-9]:[0-5]\d (PM|AM)$"){
    Write-Host "Valid Time. Processing..."
    }

    else {
        Write-Host "Thats not a valid time. Here are some examples:
        10:12 PM
        9:52 AM
        12:12 AM
        1:01 PM
        "
    }
    Set-Content -Value $replacementData -Path $configlocal
}

function configMenu{
clear
$menu = "`n"
$menu += "1 - Show config `n"
$menu += "2 - Change config `n"
$menu += "3 - Exit `n"

While (1) {
Write-Host $menu 
# Write-Host "Wuz I here?"
$choice = Read-Host -Prompt "Please choose one of the above options `n"

# Write-Host "I wuz here $choice"
if ($choice -eq 1) { 
    $output = readConfig
    $output | Format-Table
    }

elseif ($choice -eq 2){
    changeConfig
}


elseif ($choice -eq 3){ exit }
}
}
