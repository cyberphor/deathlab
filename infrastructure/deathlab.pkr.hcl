variable "vm_name" {
  type =  string
  default = "Windows-11"
}

source "vmware-iso" "windows11" {
  iso_url             = "operating-systems/Win11_23H2_English_x64v2.iso"
  iso_checksum        = "sha256:36DE5ECB7A0DAA58DCE68C03B9465A543ED0F5498AA8AE60AB45FB7C8C4AE402"
  vm_name             = var.vm_name
  cpus                = 2
  memory              = 8192
  disk_size           = 65536
  disk_adapter_type   = "ide"
  network             = "nat"
  floppy_files        = [
    "configuration-files/autounattend.xml",
    "scripts/Enable-WinRM.ps1"
  ]
  communicator        = "winrm"
  winrm_username      = "victor"
  winrm_password      = "1qaz@WSX3edc$RFV" 
  shutdown_command    = "shutdown /s /t 000"
  output_directory    = "virtual-machines/${var.vm_name}"
}

build {
  sources = [ "sources.vmware-iso.windows11" ]
  #post-processors {
  #  post-processor "artifice" {
  #    files = [
  #      "virtual-machines/${var.vm_name}/*",
  #    ]
  #  }
  #  post-processor "vagrant" {
  #    keep_input_artifact = true
  #    provider_override   = "vmware"
  #  }
  #}
}