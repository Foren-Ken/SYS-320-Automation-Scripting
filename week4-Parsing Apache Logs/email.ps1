function SendAlertMail($Body){
$f = "kenneth.moran@mymail.champlain.edu"
$t = "kenneth.moran@mymail.champlain.edu"
$s = "Sus Activity"

$pass = "uhsi wukq adpp qdjs" | ConvertTo-SecureString -AsPlainText -Force
$Credz = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $f, $pass

Send-MailMessage -From $f -To $t -Subject $s -Body $Body -SmtpServer "smtp.gmail.com" -Port 587 -Credential $Credz -UseSsl
}
