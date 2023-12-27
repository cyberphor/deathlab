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

### Copyright
This project is licensed under the terms of the [MIT license](/LICENSE).
