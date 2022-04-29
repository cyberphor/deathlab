$Retries = 6
do {
    Write-Output "Waiting for Active Directory Web Services to start..."
    $AdwsServiceHasStarted = (Get-Service "ADWS").Status -eq "Running"
    $AdwsServiceHasStarted
    $Retries--
    Start-Sleep -Seconds 30
} until ($AdwsServiceHasStarted -or $Retries -eq 0)