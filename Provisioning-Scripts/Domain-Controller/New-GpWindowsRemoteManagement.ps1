$Policy = 'Windows-Remote-Management'
$Comment = 'Enables and configures the "Windows Remote Management (WinRM)" service.'
New-GPO $Policy -Comment $Comment

$Key = 'HKLM\Software\Policies\Microsoft\Windows\WinRM\Service'
$ValueName = 'AllowAutoConfig'
$Value = 1
$Type = 'Dword'
Set-GPRegistryValue -Name $Policy -Key $Key -ValueName $ValueName -Value $Value -Type $Type

$ValueName = 'IPv4Filter'
$Value = '*'
$Type = 'String'
Set-GPRegistryValue -Name $Policy -Key $Key -ValueName $ValueName -Value $Value -Type $Type

$ValueName = 'IPv6Filter'
$Value = '*'
$Type = 'String'
Set-GPRegistryValue -Name $Policy -Key $Key -ValueName $ValueName -Value $Value -Type $Type

$fwrule = 'v2.10|Action=Allow|Active=TRUE|Dir=In|Protocol=6|LPort=5985|'
'App=System|Name=@FirewallAPI.dll,-30253|Desc=@FirewallAPI.dll'
$fwrule += ',-30256|EmbedCtxt=@FirewallAPI.dll,-30252'
$Key = 'HKLM\Software\Policies\Microsoft\WindowsFirewall\FirewallRules'    
$ValueName = 'WINRM-HTTP-In-TCP'
$Value = $fwrule
$Type = 'String'
Set-GPRegistryValue -Name $Policy -Key $Key -ValueName $ValueName -Value $Value -Type $Type

$Key = 'HKLM\SYSTEM\CurrentControlSet\Services\WinRM'    
$ValueName = 'Start'
$Value = 2
$Type = 'Dword'
Set-GPRegistryValue -Name $Policy -Key $Key -ValueName $ValueName -Value $Value -Type $Type

$Ou = (Get-ADDomain -Current LocalComputer).DistinguishedName
New-GPLink -Name $Policy -Target $Ou