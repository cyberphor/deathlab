Param(
    [String]$DomainName = 'evil.corp',
    [SecureString]$SafeModeAdministratorPassword = $(ConvertTo-SecureString -AsPlainText -Force "1qaz2wsx!QAZ@WSX")
)

Install-WindowsFeature DNS, AD-Domain-Services -IncludeManagementTools

Install-ADDSForest `
    -DomainName $DomainName `
    -InstallDns `
    -SafeModeAdministratorPassword $SafeModeAdministratorPassword `
    -NoRebootOnCompletion `
    -Force