Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled = True" | select DHCPServer |`
Format-Table -HideTableHeaders