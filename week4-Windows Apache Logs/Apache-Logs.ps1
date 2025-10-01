function Apache-Logs($page, [int]$httpCode, $webBrowser) {
# $page ; $httpCode ; $webBrowser


$404Error = Get-Content C:\xampp\apache\logs\access.log | Select-String " $httpCode "
# $404Error


$regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
$ipUnorg = $regex.Matches($404Error)

# $ipUnorg

$ips = @()
for ($x=0; $x -lt $ipUnorg.Count; $x++){
if ($404Error -imatch $webBrowser){

$ips += [pscustomobject]@{"ip" = $ipUnorg[$x].Value; "page" = $page; "webBrowser" = $webBrowser; "httpResponse" = $httpCode}
}

# $ipUnorg[$x].Value
}
# $ips

$ipcount = $ips | Where-Object {$_.ip -ilike "10.*" }
$count = $ipcount | Group-Object ip, page, webBrowser, httpResponse
return $count | Select-Object Count, @{Name="IP";Expression={($_.Name -split ', ')[0]}}, 
                                    @{Name="Page";Expression={($_.Name -split ', ')[1]}},
                                    @{Name="WebBrowser";Expression={($_.Name -split ', ')[2]}},
                                    @{Name="HttpResponse";Expression={($_.Name -split ', ')[3]}}



# $ipcount = $ips | Where-Object {$_.ip -ilike "10.*" }
# $count = $ipcount | Group-Object page
# $count | Select-Object Count, Name

}
# Apache-Logs index.html 404 Chrome 