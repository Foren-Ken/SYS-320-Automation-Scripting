$404Error = Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 '
# $404Error

$regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
$ipUnorg = $regex.Matches($404Error)

# $ipUnorg

$ips = @()
for ($x=0; $x -lt $ipUnorg.Count; $x++){
$ips += [pscustomobject]@{"ip" = $ipUnorg[$x].Value; }

}
$ips | Where-Object {$_.ip -ilike "10.*" }