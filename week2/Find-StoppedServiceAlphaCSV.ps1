$CSVOUTPUT = "$PSScriptRoot\cool.csv"
(Get-Service | Where-Object {$_.Status -ilike "Stopped"}).DisplayName | sort | Export-Csv $CSVOUTPUT
