function gatherClasses(){
$selectPage = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.39/Courses.html

$trs = $selectPage.ParsedHtml.body.GetElementsByTagName("tr")

$skibidiTable = @()

for ($x=1; $x -lt 10; $x++){

$tds = $trs[$x].GetElementsByTagName("td")
$times = $tds[5].innerText.split("-")

# $tds[0].innerText

$skibidiTable += [pscustomobject]@{
"Class Code" = $tds[0].innerText;
"Title" = $tds[1].innerText;
"Days" = $tds[4].innerText;
"Time Start" = $times[0];
"Time End" = $times[1];
"Instructor" = $tds[6].innerText;
"Location" = $tds[9].innerText

}

}
return $skibidiTable

}

gatherClasses