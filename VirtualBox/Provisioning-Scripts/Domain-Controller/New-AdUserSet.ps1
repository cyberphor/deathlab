Import-Csv "C:\Vagrant\UserSet.csv" |
ForEach-Object {
    $Parameters = @{
        GivenName               = $_.GiveName
        Surname                 = $_.Surname
        Name                    = $_.Name 
        SamAccountName          = $_.SamAccountName 
        UserPrincipalName       = $_.UserPrincipalName
        Company                 = $_.Company
        Organization            = $_.Organization
        Description             = $_.Description
        EmployeeId              = $_.EmployeeId
        Path                    = $_.Path
        AccountPassword         = $(ConvertTo-SecureString -AsPlainText -Force "1qaz2wsx!QAZ@WSX")
        ChangePasswordAtLogon   = $true 
        Enabled                 = $true
    }

    New-AdUser @Parameters
}
