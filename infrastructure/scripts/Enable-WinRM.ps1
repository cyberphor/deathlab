#Set-ExecutionPolicy -ExecutionPolicy Bypass -Force

## Enable WinRM
#Set-WSManQuickConfig -Force
#
## Configure WinRM server settings
#Set-Item WSMan:\localhost\service\AllowUnencrypted -Value true
#Set-Item WSMan:\localhost\service\Auth\Basic -Value true
#
## Change the firewall's network profile to Private
#Set-NetConnectionProfile -NetworkCategory Private
#
## Configure the firewall's Private network profile to allow inbound WinRM connections
#Set-NetFirewallRule -Name "WinRM-HTTP-In-TCP-NoScope" -Enabled True
#
## Restart WinRM
#Restart-Service WinRM

#winrm quickconfig -quiet
#winrm set winrm/config/service '@{AllowUnencrypted="true"}'
#winrm set winrm/config/service/auth '@{Basic="true"}'

Write-Output "debug" | Out-File "C:\Users\vagrant\Desktop\debug.log"