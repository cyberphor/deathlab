$SecurityPolicy = "C:\secpol.cfg"

secedit /export /cfg $SecurityPolicy

(Get-Content $SecurityPolicy).replace("PasswordComplexity = 1", "PasswordComplexity = 0") | Out-File $SecurityPolicy

secedit /configure /db C:\Windows\security\local.sdb /cfg $SecurityPolicy /areas SECURITYPOLICY

Remove-Item C:\secpol.cfg -Force