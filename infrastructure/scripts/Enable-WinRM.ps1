# Stop WinRM
Stop-Service -Name winrm -Force
Start-Sleep 60

# Configure WinRM
winrm quickconfig -quiet
winrm quickconfig -transport:http
winrm set winrm/config '@{MaxTimeoutms="1800000"}'
winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="2048"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config/client/auth '@{Basic="true"}'
winrm set winrm/config/listener?Address=*+Transport=HTTP '@{Port="5985"}'

# Start WinRM
Set-Service -Name winrm -StartupType Automatic
Start-Service -Name winrm

# Configure firewall
New-NetFirewallRule -DisplayName "WinRM" -Direction Inbound -Protocol TCP -LocalPort 5985 -Action Allow