## Requirements

### Hardware
* CPU: 16 cores
* RAM: 32 GBs
* Disk Space: 500 GBs 

### Software
**Programs**  
[VirtualBox (7.0.6)](https://www.virtualbox.org/wiki/Downloads)
* Error 1: Multiple CPUs. 
  * `["modifyvm", "{{.Name}}", "--ioapic", "on"]`
  * `["modifyvm", "{{.Name}}", "--nic1", "bridged"]`
* Error 2: "ERROR [COM]: aRC=VBOX_E_NOT_SUPPORTED (0x80bb0009) aIID={00892186-a4af-4627-b21f-fc561ce4473c} aComponent={GuestWrap}".
  * Removed `disk_size: 60000`

[Packer (1.8.6)](https://developer.hashicorp.com/packer/downloads)
```pwsh
$env:PACKER_LOG=1
$env:PACKER_LOG_PATH="packer.log"
```
  
[Vagrant (2.3.4)](https://developer.hashicorp.com/vagrant/downloads)

**WinRM Parameters**  
You must use "Plaintext" for your WinRM communication transport because the default "Negotiate" will stop working after the Domain Controller is installed.   
* [https://groups.google.com/forum/#!topic/vagrant-up/sZantuCM0q4](https://groups.google.com/forum/#!topic/vagrant-up/sZantuCM0q4)  
* [https://github.com/StefanScherer/adfs2/blob/master/Vagrantfile](https://github.com/StefanScherer/adfs2/blob/master/Vagrantfile)
