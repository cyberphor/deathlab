Param(
    [String]$DomainName = 'evil.corp',
    [SecureString]$DirectoryServicesRestoreModePassword = $(ConvertTo-SecureString -AsPlainText -Force "1qaz2wsx!QAZ@WSX")
)

function Install-RequiredFeatures {
    $AdDomainServices = (Get-WindowsFeature AD-Domain-Services).InstallState
    $Dns = (Get-WindowsFeature DNS).InstallState

    if ($AdDomainServices -ne 'Installed') {
        (Install-WindowsFeature AD-Domain-Services -IncludeManagementTools).ExitCode
    } 

    if ($Dns -ne 'Installed') {
        (Install-WindowsFeature DNS -IncludeManagementTools).ExitCode
    }
}

function Install-AdForest {
    $ActiveDirectoryWebServices = (Get-Service -Name ADWS).Status
    if ($ActiveDirectoryWebServices -ne 'Running') {
        Install-ADDSForest -DomainName $DomainName -InstallDns -SafeModeAdministratorPassword $DirectoryServicesRestoreModePassword -NoRebootOnCompletion -Force
    }
}

Install-RequiredFeatures
Install-AdForest