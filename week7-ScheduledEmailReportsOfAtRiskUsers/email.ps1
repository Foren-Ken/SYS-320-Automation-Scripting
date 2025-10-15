function SendAlertMail($Body){
$f = "EMAIL" #FROM
$t = "EMAIL" #TO
$s = "Sus Activity"

$pass = "PASSWORD!" | ConvertTo-SecureString -AsPlainText -Force
$Credz = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $f, $pass

Send-MailMessage -From $f -To $t -Subject $s -Body $Body -SmtpServer "smtp.gmail.com" -Port 587 -Credential $Credz -UseSsl
}