## Death Lab
Welcome to my Detection Engineering and Threat Hunting (DEATH) Lab!

### Getting Started
**Step 1.** Download Death Lab and the ISO files required. 
```bash
git clone https://github.com/cyberphor/death-lab
cd Infrastructure/
# download commands go here
```

**Step 2.** Run Packer.
```bash
packer build death-lab.json
```

**Step 3.** Run Vagrant.
```bash
vagrant box add --name "deathlab/centos" Vagrant-Boxes\CentOS.box --force
vagrant up
```

### Copyright
This project is licensed under the terms of the [MIT license](/LICENSE).
