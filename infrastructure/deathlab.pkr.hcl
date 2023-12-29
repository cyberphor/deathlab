variable "vm_name" {
  type    = string
  default = "Windows-11"
}

source "vmware-iso" "windows11" {
  iso_url           = "operating-systems/Windows-11.iso"
  iso_checksum      = "sha256:C8DBC96B61D04C8B01FAF6CE0794FDF33965C7B350EAA3EB1E6697019902945C"
  vm_name           = var.vm_name
  cpus              = 2
  memory            = 8192
  disk_adapter_type = "scsi"
  disk_size         = 65536
  floppy_files      = [
    "configuration-files/Autounattend.xml",
    "scripts/Enable-WinRM.ps1",
  ]
  communicator      = "winrm"
  winrm_username    = "vagrant"
  winrm_password    = "vagrant" 
  shutdown_command  = "shutdown /s /t 000"
  output_directory  = "virtual-machines/${var.vm_name}"
}

build {
  sources                = [ "sources.vmware-iso.windows11" ]
  #post-processor "vagrant" {
  #  keep_input_artifact  = false
  #  output               = "vagrant/${var.vm_name}.box"
  #  vagrantfile_template = "vagrant/${var.vm_name}.template"
  #}
}