## Requirements
**Software** (work-in-progress)  
* VirtualBox
* Vagrant

**Hardware** (work-in-progress)  
* CPU: 16 cores
* RAM: 32 GBs
* Disk Space: 500 GBs 

**WinRM Parameters**  
You must use "Plaintext" for your WinRM communication transport because the default "Negotiate" will stop working after the Domain Controller is installed.   
* [https://groups.google.com/forum/#!topic/vagrant-up/sZantuCM0q4](https://groups.google.com/forum/#!topic/vagrant-up/sZantuCM0q4)  
* [https://github.com/StefanScherer/adfs2/blob/master/Vagrantfile](https://github.com/StefanScherer/adfs2/blob/master/Vagrantfile)