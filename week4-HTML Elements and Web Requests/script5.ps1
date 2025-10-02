$scrapped = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.39/ToBeScraped.html
$h2s = $scrapped.ParsedHtml.body# .getElementsByTagName("div") | where { $_.getAttributeNode("class").Value -ilike "div-1" } | Select-Object innerText
$h2s