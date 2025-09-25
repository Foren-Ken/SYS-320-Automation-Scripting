function ObtainGLogsXDaysAgo($days){
$EventLogArray = @()
$EventLog = Get-EventLog system -After (Get-Date).AddDays(-($days)) | Where-Object {$_.EventID -in @(6006, 6005)}
# Write-Host $EventLog

for ($x=0; $x -lt $EventLog.Count; $x++){

$eventID = $EventLog[$x].EventID

if ($eventID -eq "6006"){
$event = "Shutdown"
}
else { $event = "Start"}

$EventLogArray += [pscustomobject]@{"Time" = $EventLog[$x].TimeGenerated;
                                    "Id" = $EventLog[$x].EventID;
                                    "Event" = $event;
                                    "User" = "System"
                                    }
}
return $EventLogArray
}
# ObtainGLogsXDaysAgo(100)