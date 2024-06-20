packer {
  required_plugins {
    vmware = {
      source = "github.com/hashicorp/vmware"
      version = "~> 1"
    }
    vagrant = {
      version = "~> 1"
      source = "github.com/hashicorp/vagrant"
    }
    # commenting this out (currently developing Death Lab on Windows; Ansible is not Windows-friendly)
    #ansible = {
    #  source  = "github.com/hashicorp/ansible"
    #  version = "~> 1"
    #}
  }
}

source "vmware-iso" "workstation" {
  iso_url           = "iso-files/windows-11.iso"
  iso_checksum      = "sha256:C8DBC96B61D04C8B01FAF6CE0794FDF33965C7B350EAA3EB1E6697019902945C"
  vm_name           = "Workstation"
  guest_os_type     = "windows9-64"
  cpus              = 2
  memory            = 8192
  disk_adapter_type = "ide"
  disk_size         = 65536
  floppy_files      = [
    "../kickstart/autounattend.xml",
    "scripts/Enable-WinRM.ps1",
  ]
  communicator      = "winrm"
  winrm_username    = "vagrant"
  winrm_password    = "vagrant" 
  shutdown_command  = "shutdown /s /t 000"
  output_directory  = "../virtual-machines/windows-11"
}

source "vmware-iso" "domain-controller" {
  iso_url           = "iso-files/windows-server-2022.iso"
  iso_checksum      = "sha256:3E4FA6D8507B554856FC9CA6079CC402DF11A8B79344871669F0251535255325"
  vm_name           = "Domain-Controller"
  guest_os_type     = "windows2019srv_64"
  cpus              = 2
  memory            = 8192
  disk_adapter_type = "ide"
  disk_size         = 65536
  floppy_files      = [
    "configuration-files/Autounattend.xml",
    "scripts/Enable-WinRM.ps1",
  ]
  communicator      = "winrm"
  winrm_username    = "vagrant"
  winrm_password    = "vagrant" 
  shutdown_command  = "shutdown /s /t 000"
  output_directory  = "../virtual-machines/domain-controller"
}

source "vmware-iso" "event-collector" {
  iso_url           = "iso-files/windows-server-2022.iso"
  iso_checksum      = "sha256:3E4FA6D8507B554856FC9CA6079CC402DF11A8B79344871669F0251535255325"
  vm_name           = "Event-Collector"
  guest_os_type     = "windows2019srv_64"
  cpus              = 2
  memory            = 8192
  disk_adapter_type = "ide"
  disk_size         = 65536
  floppy_files      = [
    "configuration-files/Autounattend.xml",
    "scripts/Enable-WinRM.ps1",
  ]
  communicator      = "winrm"
  winrm_username    = "vagrant"
  winrm_password    = "vagrant" 
  shutdown_command  = "shutdown /s /t 000"
  output_directory  = "../virtual-machines/event-collector"
}

source "vmware-iso" "velociraptor" {
  iso_url           = "../iso-files/CentOS-7-x86_64-Minimal-2009.iso"
  iso_checksum      = "sha256:07b94e6b1a0b0260b94c83d6bb76b26bf7a310dc78d7a9c7432809fb9bc6194a"
  cpus              = "2"
  memory            = "4096"
  http_directory    = "../init-files/"
  boot_wait         = "10s"
  boot_command      = [
    "<up><tab> ",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter>",
  ]
  ssh_username      = "vagrant"
  ssh_password      = "vagrant"
  shutdown_command  = "echo 'vagrant' | sudo -S shutdown -P now"
  output_directory  = "../virtual-machines/velociraptor"
}

source "vmware-iso" "attacker" {
  iso_url           = "../iso-files/CentOS-7-x86_64-Minimal-2009.iso"
  iso_checksum      = "sha256:07b94e6b1a0b0260b94c83d6bb76b26bf7a310dc78d7a9c7432809fb9bc6194a"
  cpus              = "2"
  memory            = "4096"
  http_directory    = "../init-files/"
  boot_wait         = "10s"
  boot_command      = [
    "<up><tab> ",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter>",
  ]
  ssh_username      = "vagrant"
  ssh_password      = "vagrant"
  shutdown_command  = "echo 'vagrant' | sudo -S shutdown -P now"
  output_directory  = "../virtual-machines/attacker"
}

build {
  sources                = [
    #"source.vmware-iso.workstation",
    #"source.vmware-iso.domain-controller",
    #"source.vmware-iso.event-collector",
    #"source.vmware-iso.attacker",
    "source.vmware-iso.velociraptor"
  ]

  # commenting this out (currently developing Death Lab on Windows; Ansible is not Windows-friendly)
  #provisioner "ansible" {
  #  playbook_file          = "../ansible/playbook.yaml"
  #  extra_arguments = [
  #    "--scp-extra-args", "'-O'"
  #  ]
  #}

  post-processor "vagrant" {
    only   = ["vmware-iso.velociraptor"]
    keep_input_artifact  = false
    output               = "../vagrant/boxes/velociraptor.box"
  }
}