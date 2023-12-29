## Death Lab
Detection Engineering and Threat Hunting (DEATH) Lab is a platform for developing security-related rules and queries. 

### Getting Started
**Local Deployment**
**Step 1.** Download Death Lab. 
```bash
git clone https://github.com/cyberphor/deathlab
```

**Step 2.** Download the software required. 

**Step 3.** Run Packer.
```bash
cd infrastructure/
packer build deathlab.pkr.hcl
```

**Step 4.** Run Vagrant.
```bash
vagrant plugin update
vagrant box add --name "deathlab/siem-server" vagrant-boxes\SIEM-Server.box --force
vagrant up
```

### Troubleshooting
**Packer Cache**  
Deleting the "packer_cache" folder between builds seems helpful for developing/debugging the autounattend.xml files.

**could not find a supported CD ISO creation command (the supported commands are: xorriso, mkisofs, hdiutil, oscdimg)**  
If you're going to host Death Lab on a Windows machine, [Windows Assessment and Deployment Kit (ADK)](https://go.microsoft.com/fwlink/?linkid=2196127) includes "oscdimg." Make sure to update your execution path after installing the Windows ADK.

### References
**DetectionLab GitHub Repository**  
[https://github.com/clong/DetectionLab](https://github.com/clong/DetectionLab)

**Unattended Windows Setup Reference**  
[https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/)

**Installing Oscdimg Using the Windows 11 Assessment and Deployment Kit**  
[https://answers.microsoft.com/en-us/windows/forum/all/downloading-the-oscdimg-utility-for-windows-11/bd0b478d-6df0-4dd9-8cae-3adb469405a0](https://answers.microsoft.com/en-us/windows/forum/all/downloading-the-oscdimg-utility-for-windows-11/bd0b478d-6df0-4dd9-8cae-3adb469405a0)

### Copyright
This project is licensed under the terms of the [MIT license](/LICENSE).
