# create the GPO
$Name = "Wallpaper"
$Comment = "Sets the wallpaper to the company logo."
New-GPO -Name $Name -Comment $Comment

# share the folder containing the wallpaper
New-SmbShare -Name $Name -Path $("C:\Vagrant\" + $Name) -FullAccess "Administrators" -ReadAccess "Everyone"

# set the wallpaper using the share as the path
$Key = "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System"
$Value = '\\' + $env:COMPUTERNAME + '\' + "$Name\evil-corp-wallpaper.jpg"
$Type = "String"
Set-GPRegistryValue -Name $Name -Key $Key -ValueName $Name -Value $Value -Type $Type

# set the wallpaper style
$ValueName = "WallpaperStyle"
$Value = "0" # center
$Type = "String"
Set-GPRegistryValue -Name $Name -Key $Key -ValueName $ValueName -Value $Value -Type $Type

# link the GPO
$Ou = (Get-ADDomain -Current LocalComputer).DistinguishedName
New-GPLink -Name $Name -Target $Ou