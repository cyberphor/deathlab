$Script = <<-'SCRIPT'
New-Item -Type Directory -Path "C:\Tools"
SCRIPT

Vagrant.configure("2") do |config|
    config.vm.box = "salesforce/server2019"
    config.vm.provider "virtualbox" do |vb|
      vb.name = "Domain-Controller"
      vb.cpus = 2
      vb.memory = 2048
      vb.check_guest_additions = false
      vb.gui = true
    end
    config.vm.hostname = "dc1"
    config.vm.network :private_network,
      name: "VirtualBox Host-Only Ethernet Adapter"
      ip: "192.168.5.10", 
      netmask: "255.255.255.0"
      config.vm.communicator = "winrm"
    config.vm.provision "shell", inline: $Script
  end