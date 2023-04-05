## Death Lab
Welcome to my Detection Engineering and Threat Hunting (DEATH) Lab!

### Getting Started
**Step 1.** Download Death Lab and the ISO files required. 
```
git clone https://github.com/cyberphor/death-lab
cd Infrastructure/
# download commands go here
```

**Step 2.** Run Packer.
```
packer build Vagrantboxes.json
```

**Step 3.** Run Vagrant.
```
vagrant box add --name "deathlab/centos" Vagrant-Boxes\CentOS.box 
vagrant up
```

### Copyright
This project is licensed under the terms of the [MIT license](/LICENSE).
