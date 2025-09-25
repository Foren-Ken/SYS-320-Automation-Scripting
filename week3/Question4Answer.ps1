function ObtainLogsXDaysAgo($days){
$EventLogArray = @()
$EventLog = Get-EventLog system -source Microsoft-Windows-WinLogon -After (Get-Date).AddDays(-($days))
for ($x=0; $x -lt $eventLog.Count; $x++){

$eventID = $EventLog[$x].InstanceId

if ($eventID = "7001"){
$event = "Logon"
}
else { $event = "Logoff"}

$user = $EventLog[$x].ReplacementStrings[1]
$userTranslated = New-Object System.Security.Principal.SecurityIdentifier($user)

$EventLogArray += [pscustomobject]@{"Time" = $EventLog[$x].TimeGenerated;
                                    "Id" = $EventLog[$x].InstanceId
                                    "Event" = $event
                                    "User" = $userTranslated.Translate([System.Security.Principal.NTAccount]).Value
                                    }
}
return $EventLogArray
}

# ObtainLogsXDaysAgo(100)