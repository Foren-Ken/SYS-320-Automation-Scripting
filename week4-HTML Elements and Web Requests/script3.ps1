$scrapped = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.39/ToBeScraped.html
$scrapped.Links | Select-Object outerText, href