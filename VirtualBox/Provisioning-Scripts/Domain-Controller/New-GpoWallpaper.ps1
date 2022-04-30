# create the GPO
$Name = "Wallpaper"
New-GPO -Name $Name -Comment "Sets the wallpaper to the company logo."

# copy the wallpaper to the guest
$PathToWallpaper = "C:\Windows\SYSVOL\Domain\Scripts\Wallpaper.jpg"
Copy-Item -Path "C:\Vagrant\Wallpapers\evil-corp-wallpaper.jpg" -Destination $PathToWallpaper

# set the wallpaper path
$Key = "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System"
Set-GPRegistryValue -Name $Name -Key $Key -ValueName $Name -Value $PathToWallpaper -Type "String"

# set the wallpaper style
Set-GPRegistryValue -Name $Name -Key $Key -ValueName "WallpaperStyle" -Value "0" -Type "String"

# link the GPO to the domain root
New-GPLink -Name $Name -Target $(Get-ADDomain -Current LocalComputer).DistinguishedName