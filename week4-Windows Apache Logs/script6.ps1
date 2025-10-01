$coolArray = Get-Content C:\xampp\apache\logs\*.log | Select-String 'error'
$coolArray[-5..-1]