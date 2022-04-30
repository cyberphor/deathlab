# create the GPO
Import-GPO -BackupGpoName "Windows-Remote-Management" -Path "C:\Vagrant\Group-Policy-Objects\Windows-Remote-Management" -TargetName "Windows-Remote-Management"

# link the GPO
New-GPLink -Name "Windows-Remote-Management" -Target $(Get-ADDomain -Current LocalComputer).DistinguishedName