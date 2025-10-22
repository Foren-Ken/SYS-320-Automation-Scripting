function skibidiChallenge1() {
$selectPage = Invoke-WebRequest -TimeoutSec 10 http://127.0.0.1/IOC.html

$skibidi = $selectPage.ParsedHTML.body.GetElementsByTagName("tr")

$skibidiTable = @()

for ($x=1; $x -lt $skibidi.length; $x++){
$doubleskibidi = $skibidi[$x].GetElementsByTagName("td")

$skibidiTable += [pscustomobject]@{
    "Pattern" = $doubleskibidi[0].innerText; 
    "Explaination" = $doubleskibidi[1].innerText; 
}
}
# $skibidiTable | Format-Table -AutoSize
return $skibidiTable
}
# skibidiChallenge1 | Format-Table -AutoSize