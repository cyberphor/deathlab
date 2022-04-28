Param(
    [String]$DomainName = 'evil.corp',
    [SecureString]$SafeModeAdministratorPassword = $(ConvertTo-SecureString -AsPlainText -Force "1qaz2wsx!QAZ@WSX")
)

Install-WindowsFeature DNS, AD-Domain-Services -IncludeManagementTools

$Parameters = @{
    DomainName                    = $DomainName
    InstallDns                    = $True
    SafeModeAdministratorPassword = $SafeModeAdministratorPassword
    NoRebootOnCompletion          = $True
    Force                         = $True
}

Install-ADDSForest @Parameters