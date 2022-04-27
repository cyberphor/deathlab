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

function New-AdDomainAdmin {
    $AdDomainServices = (Get-WindowsFeature AD-Domain-Services).InstallState
    if ($AdDomainServices -eq 'Running') {
        $UserExists = [bool](Get-ADUser -Filter {SamAccountName -eq $DomainAdminSamAccountName}) 
        if ($UserExists -ne $true) {
            New-ADUser `
                -GivenName $DomainAdminFirstName `
                -Surname $DomainAdminLastName `
                -Name $DomainAdminFullName `
                -SamAccountName $DomainAdminSamAccountName `
                -UserPrincipalName $DomainAdminUserPrincipalName `
                -AccountPassword $DomainAdminPassword `
                -ChangePasswordAtLogon $true `
                -Description $DomainAdminDescription 
            Add-ADGroupMember -Identity $DomainAdminGroup -Members $DomainAdminSamAccountName
            Enable-ADAccount -Identity $DomainAdminSamAccountName
        }
    }
}

New-AdDomainAdmin