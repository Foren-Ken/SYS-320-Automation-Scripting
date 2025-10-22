function skibidiChallenge2() {
$skibidiPath = Join-Path -Path $PSScriptRoot -ChildPath "access.log"
$skibidiStuff = Get-Content $skibidiPath
$skibidideliver = @()
# $skibidiStuff.Length
for ($x=0; $x -lt $skibidiStuff.Length ; $x++){
$skibidiChop = $skibidiStuff[$x].Split(" ")
# $skibidiChop
$skibidideliver += [pscustomobject]@{
                                  "IP" = $skibidiChop[0];
                                  "Time"= $skibidiChop[3].Trim("[");
                                  "Method" = $skibidiChop[5].Trim('"');
                                  "Page" = $skibidiChop[6];
                                  "Protocol" = $skibidiChop[7].Trim('"');
                                  "Response" = $skibidiChop[8];
                                  "Referrer" = $skibidiChop[10];
}

}

return $skibidideliver # | Format-Table -Autosize -Wrap
}
# skibidiChallenge2 | Format-Table -Autosize -Wrap