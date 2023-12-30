source "vmware-iso" "windows-11" {
  iso_url           = "operating-systems/windows-11.iso"
  iso_checksum      = "sha256:C8DBC96B61D04C8B01FAF6CE0794FDF33965C7B350EAA3EB1E6697019902945C"
  vm_name           = "Windows-11"
  guest_os_type     = "windows9-64"
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
  output_directory  = "virtual-machines/windows-11"
}

build {
  sources                = [
    "source.vmware-iso.windows-11"
  ]

  post-processor "vagrant" {
    only   = ["vmware-iso.windows-11"]
    keep_input_artifact  = false
    vagrantfile_template = "vagrant/templates/windows-11.template"
    output               = "vagrant/boxes/windows-11.box"
  }

  #post-processor "vagrant" {
  #  only   = ["amazon-ebs.first-example"]
  #  keep_input_artifact  = false
  #  vagrantfile_template = "vagrant/${var.vm_name}.template"
  #  output               = "vagrant/${var.vm_name}.box"
  #}

  #post-processor "vagrant" {
  #  only   = ["amazon-ebs.first-example"]
  #  keep_input_artifact  = false
  #  vagrantfile_template = "vagrant/${var.vm_name}.template"
  #  output               = "vagrant/${var.vm_name}.box"
  #}

  #post-processor "vagrant" {
  #  only   = ["amazon-ebs.first-example"]
  #  keep_input_artifact  = false
  #  vagrantfile_template = "vagrant/${var.vm_name}.template"
  #  output               = "vagrant/${var.vm_name}.box"
  #}
}