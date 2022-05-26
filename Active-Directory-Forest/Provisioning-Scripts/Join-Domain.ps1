$DomainName = "evil.corp"
$Username = "$DomainName\vagrant"
$Password = ConvertTo-SecureString "vagrant" -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential $Username, $Password
Add-Computer -DomainName $DomainName -Credential $Credential