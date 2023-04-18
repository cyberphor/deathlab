## Death Lab
Welcome to my Detection Engineering and Threat Hunting (DEATH) Lab!

### Getting Started
**Step 1.** Download Death Lab. 
```bash
git clone https://github.com/cyberphor/death-lab
cd Infrastructure/
```

**Step 2.** Download the ISO files required (see [Requirements](/Docs/Requirements.md)). 

**Step 3.** Run Packer.
```bash
packer build death-lab.json
```

**Step 4.** Run Vagrant.
```bash
vagrant plugin update
vagrant box add --name "deathlab/centos" Vagrant-Boxes\CentOS.box --force
vagrant up
```

### Copyright
This project is licensed under the terms of the [MIT license](/LICENSE).
