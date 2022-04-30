$Retries = 3
do {
    Write-Output "Waiting 60 seconds for Active Directory Web Services to start..."
    $AdwsServiceHasStarted = (Get-Service "ADWS").Status -eq "Running"
    $Retries--
    Start-Sleep -Seconds 60
} until ($AdwsServiceHasStarted -or $Retries -eq 0)