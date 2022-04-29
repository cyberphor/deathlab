$Retries = 3
do {
    $AdwsServiceHasStarted = Get-Service "ADWS" | Where-Object { $_.status -eq "Running" }
    $Retries--
    Start-Sleep -Seconds 10
} until ($AdwsServiceHasStarted -or $Retries -eq 0)