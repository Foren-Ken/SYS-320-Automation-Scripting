function skibidiChallenge3() {
. (Join-Path $PSScriptRoot sortStuff.ps1)
. (Join-Path $PSScriptRoot ObtainStuff.ps1)
$skibidiPatterns = skibidiChallenge1
$skibidiLogs = skibidiChallenge2

$patterns = $skibidiPatterns.Pattern
# $patterns
for ($x=0;$x -lt $skibidiLogs.length ; $x++){
    for ($y=0;$y -lt $patterns.length ; $y++){

    $theOne = $patterns[$y]
    # $skibidiLogs[$x]

    if ($skibidiLogs[$x].Page.Contains($theOne)){
    $skibidiLogs[$x]
    break
    }

}
}
}
# skibidiChallenge3 | Format-Table -Autosize -Wrap
