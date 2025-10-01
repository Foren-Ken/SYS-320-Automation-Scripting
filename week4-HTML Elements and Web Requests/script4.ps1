$scrapped = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.39/ToBeScraped.html
$h2s = $scrapped.ParsedHtml.body.getElementsByTagName("h2") | Select-Object outerText

$h2s