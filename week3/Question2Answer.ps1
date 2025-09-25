$EventLogArray = @()
$EventLog = Get-EventLog system -source Microsoft-Windows-WinLogon

for ($x=0; $x -lt $eventLog.Count; $x++){

$eventID = $EventLog[$x].InstanceId

if ($eventID = "7001"){
$event = "Logon"
}
else { $event = "Logoff"}

$user = $EventLog[$x].ReplacementStrings[1]


$EventLogArray += [pscustomobject]@{"Time" = $EventLog[$x].TimeGenerated;
                                    "Id" = $EventLog[$x].InstanceId
                                    "Event" = $event
                                    "User" = $user
                                    }
}
$EventLogArray
