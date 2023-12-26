# Packer

**Step 1.** Install VMWare Workstation Pro. 
* [VMWare Workstation Pro](https://www.vmware.com/products/workstation-pro.html)

**Step 2.** Download Packer.
* [Packer](https://developer.hashicorp.com/packer/downloads).  

**Step 3.** Download the ISOs. 
* [Microsoft Windows 11](https://www.microsoft.com/software-download/windows11)
* [CentOS](https://www.centos.org/centos-linux/)

**Step 4.** Edit the `autounattend.xml` file. 

**Step 5.** Edit the Packer var file. 

**Step 6.** Run Packer.
```pwsh
# Download Packer plugins
packer.exe init "windows11-22h2.json.pkr.hcl"

# Build
packer.exe build `
  "windows11-22h2.json.pkr.hcl" `
  -var-file="windows11-22h2.auto.pkrvars.hcl" `
  -var "winrm_username=administrator" `
  -var "winrm_password=PasswordGoesHere" `
```

## Troubleshooting
* Error: "Could not determine network mappings..."
  * Fix: [https://www.vgemba.net/vmware/Packer-Workstation-Error/](https://www.vgemba.net/vmware/Packer-Workstation-Error/)

## Kickstart and Answer Files
**Microsoft Windows**  
[http://www.windowsafg.com](http://www.windowsafg.com)

## References
* [https://www.ivobeerens.nl/2022/05/31/build-a-windows-10-image-with-packer-using-vmware-workstation/](https://www.ivobeerens.nl/2022/05/31/build-a-windows-10-image-with-packer-using-vmware-workstation/)
* [https://github.com/ibeerens/Packer](https://github.com/ibeerens/Packer)