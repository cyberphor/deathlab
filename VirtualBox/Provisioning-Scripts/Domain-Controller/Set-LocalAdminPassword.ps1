$Password = ConvertTo-SecureString -String 'vagrant' -AsPlainText -Force

$Administrator = Get-LocalUser -Name Administrator

$Administrator | Set-LocalUser -Password $Password