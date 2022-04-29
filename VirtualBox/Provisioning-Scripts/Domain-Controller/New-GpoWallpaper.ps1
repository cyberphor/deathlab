# create the GPO
$Policy = "Wallpaper"
$Comment = "Sets the wallpaper to the company logo."
New-GPO -Name $Policy -Comment $Comment

# share the folder containing the wallpaper
$Wallpaper = "$Policy\evil-corp-wallpaper.jpg"
$Path = "C:\" + $Wallpaper
New-SmbShare -Name $Policy -Path $Path -FullAccess "Administrators" -ReadAccess "Domain Users"

# set the wallpaper using the share as the path
$Key = "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System"
$ValueName = "Wallpaper"
$Value = '\\' + $env:COMPUTERNAME + '\' + $Wallpaper
$Type = "String"
Set-GPRegistryValue -Name $Policy -Key $Key -ValueName $ValueName -Value $Value -Type $Type

# set the wallpaper style
$ValueName = "WallpaperStyle"
$Value = "4" # fill
$Type = "String"
Set-GPRegistryValue -Name $Policy -Key $Key -ValueName $ValueName -Value $Value -Type $Type

# link the GPO
$Ou = (Get-ADDomain -Current LocalComputer).DistinguishedName
New-GPLink -Name $Policy -Target $Ou