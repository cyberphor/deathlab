# create .vmx file
# ??? .vmf
# create disk
# add network 
# add memory
# add disk
# add cpu

Import-Module vmxtoolkit

$VMXName = "Elastic"
$GuestOS = "centos7-64"
$Firmware = "EFI"
$MemoryMB = 8192
$NewDiskSize = 60GB
$NewDiskName = "SCSIO_0"
$LUN = 0
$Controller = 0
$ISOFilePath = "D:\CentOS-7-x86_64-DVD-2009.iso"
$NetAdapter = 0
$NetConnectionType = "nat"
$NetAdapterType = "e1000e"

New-VMX -VMXName $VMXName -GuestOS $GuestOS -Firmware $Firmware |
New-VMXScsiDisk -NewDiskSize $NewDiskSize -NewDiskname $NewDiskName |
Add-VMXScsiDisk -LUN $LUN -Controller $Controller |
Set-VMXDisplayName -DisplayName $VMXName 

Set-VMXmemory -VMXName $VMXName -MemoryMB $MemoryMB 
Set-VMXprocessor -VMXName $VMXName -Processorcount 4 
Connect-VMXcdromImage -VMXName $VMXName -ISOfile $ISOFilePath 
Set-VMXNetworkAdapter -VMXName $VMXName -Adapter $NetAdapter -ConnectionType $NetConnectionType -AdapterType $NetAdapterType
Start-VMX -VMXName $VMXName -nowait