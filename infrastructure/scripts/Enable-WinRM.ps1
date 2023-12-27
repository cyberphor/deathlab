Write-Output "Start" | Out-File -Append C:\debug.log

# Enable WinRM
Set-WSManQuickConfig -Force

# Configure WinRM client settings
Set-Item WSMan:\localhost\client\AllowUnencrypted -Value true
Set-Item WSMan:\localhost\client\Auth\Basic -Value true

# Configure WinRM server settings
Set-Item WSMan:\localhost\service\AllowUnencrypted -Value true
Set-Item WSMan:\localhost\service\Auth\Basic -Value true

# Allow WinRM through the firewall (Public)
Set-NetFirewallRule -Name "WinRM-HTTP-In-TCP" -RemoteAddress Any 

# Allow WinRM through the firewall (Private and Domain)
Set-NetFirewallRule -Name "WinRM-HTTP-In-TCP-NoScope" -RemoteAddress Any