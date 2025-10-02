function ApacheLogs1() {
$unformattedLogs = Get-Content C:\xampp\apache\logs\access.log
$deliverable = @()

for($x=0; $x -lt $unformattedLogs.Length; $x++){
# $x
$chopper = $unformattedLogs[$x].Split(" ")
# $chopper

$deliverable += [pscustomobject]@{"IP" = $chopper[0];
                                  "Time"= $chopper[3].Trim("[");
                                  "Method" = $chopper[5].Trim('"');
                                  "Page" = $chopper[6];
                                  "Protocol" = $chopper[7].Trim('"');
                                  "Response" = $chopper[8];
                                  "Referrer" = $chopper[10];
                                  "Client" =  $chopper[11..($chopper.Count)];}

}
return $deliverable | Where-Object {$_.IP -ilike "10.*"}
}
# $deliverable = ApacheLogs1
# $deliverable | Format-Table -Autosize -Wrap