$IpAddress = "192.168.5.10"
$DnsServer = "127.0.0.1"
$InterfaceIndex = Get-NetIpAddress | Where-Object { $_.IpAddress -like $IpAddress } | Select-Object -ExpandProperty InterfaceIndex
Set-DnsClientServerAddress -InterfaceIndex $InterfaceIndex -ServerAddresses ($DnsServer)