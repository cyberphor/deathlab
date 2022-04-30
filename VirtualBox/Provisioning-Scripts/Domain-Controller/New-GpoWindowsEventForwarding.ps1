Param(
    [string]$Collector
)

$Policy = 'Windows-Event-Forwarding'
$Comment = 'Configures domain-joined computers to forward Windows events to the domain Windows Event Collector.'
New-GPO -Name $Policy -Comment $Comment

$Key = 'HKLM\Software\Policies\Microsoft\Windows\EventLog\EventForwarding\SubscriptionManager'
$Value = 'Server=http://' + $Collector + ':5985/wsman/SubscriptionManager/WEC,Refresh=60'
$Type = 'String'
Set-GPRegistryValue -Name $Policy -Key $Key -Value $Value -Type $Type

$Ou = (Get-ADDomain -Current LocalComputer).DistinguishedName
New-GPLink -Name $Policy -Target $Ou