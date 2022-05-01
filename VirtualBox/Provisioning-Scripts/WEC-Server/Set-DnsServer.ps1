$IpAddress = "192.168.5.12"
$DnsServer = "192.168.5.10"
$InterfaceIndex = Get-NetIpAddress | Where-Object { $_.IpAddress -like $IpAddress } | Select-Object -ExpandProperty InterfaceIndex
Set-DnsClientServerAddress -InterfaceIndex $InterfaceIndex -ServerAddresses ($DnsServer)