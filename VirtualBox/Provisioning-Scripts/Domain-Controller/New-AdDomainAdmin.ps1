Param(
    [String]$DomainName = 'evil.corp',
    [String]$DomainAdminFirstName = 'Elliot',
    [String]$DomainAdminLastName = 'Alderson',
    [SecureString]$DomainAdminPassword = $(ConvertTo-SecureString -AsPlainText -Force "1qaz2wsx!QAZ@WSX"),
    [String]$DomainAdminDescription = 'Domain Administrator',
    [String]$DomainAdminGroup = 'Domain Admins',
    [String]$DomainAdminFullName = $DomainAdminLastName + ', ' + $DomainAdminFirstName,
    [String]$DomainAdminAccountName = $DomainAdminFirstName.ToLower() + '.' + $DomainAdminLastName.ToLower(),
    [String]$DomainAdminUserPrincipalName = $DomainAdminSamAccountName + '@' + $DomainName
)

$Parameters = @{
    GivenName               = $DomainAdminFirstName
    Surname                 = $DomainAdminLastName
    Name                    = $DomainAdminFullName 
    SamAccountName          = $DomainAdminSamAccountName 
    UserPrincipalName       = $DomainAdminUserPrincipalName 
    AccountPassword         = $DomainAdminPassword 
    ChangePasswordAtLogon   = $true 
    Description             = $DomainAdminDescription 
}

while ($AdWebServicesIsNotRunning) {
    Start-Sleep -Seconds 5
    $AdWebServicesIsNotRunning = (Get-Service "ADWS").Status -eq "Running"
}

New-ADUser @Parameters
Add-ADGroupMember -Identity $DomainAdminGroup -Members $DomainAdminSamAccountName
Enable-ADAccount -Identity $DomainAdminSamAccountName