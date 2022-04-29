$Parameters = @{
    GivenName               = "Elliot"
    Surname                 = "Alderson"
    Name                    = "Alderson, Elliot" 
    SamAccountName          = "elliot.alderson.da" 
    UserPrincipalName       = "elliot.alderson.da@evil.corp" 
    AccountPassword         = $(ConvertTo-SecureString -AsPlainText -Force "1qaz2wsx!QAZ@WSX")
    ChangePasswordAtLogon   = $true 
    Enabled                 = $true
}

(Get-Service "ADWS").WaitForStatus("Running")
New-ADUser @Parameters
Add-ADGroupMember -Identity "Domain Admins" -Members "elliot.alderson.da"
Enable-ADAccount -Identity "elliot.alderson.da"