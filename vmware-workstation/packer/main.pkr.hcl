source "vmware-iso" "main" {
  iso_url                  = var.centos_iso_checksum
  iso_checksum             = var.centos_iso_checksum
  cpus                     = var.velociraptor_vm_cpus
  memory                   = var.velociraptor_vm_memory
  guest_os_type            = var.velociraptor_vm_guest_os_type
  boot_wait                = "10s"
  boot_command             = [
    "<up><tab> ",
    "inst.ks=http://127.0.0.1:{{ .HTTPPort }}/ks.cfg<enter>",
  ]
  http_directory           = "../kickstart/"
  ssh_username             = var.velociraptor_vm_admin_username
  ssh_password             = var.velociraptor_vm_admin_password
  shutdown_command         = "echo 'packer' | sudo -S shutdown -P now"
}

build {
  sources                  = [ "source.vmware-iso.main" ]
  provisioner "ansible" {
    playbook_file          = "../ansible/playbook.yaml"
    extra_arguments = [
      "--scp-extra-args", "'-O'"
    ]
  }
}

