$Retries = 6
do {
    Write-Output "Waiting 30 seconds for Active Directory Web Services to start..."
    $AdwsServiceHasStarted = (Get-Service "ADWS").Status -eq "Running"
    $Retries--
    Start-Sleep -Seconds 30
} until ($AdwsServiceHasStarted -or $Retries -eq 0)