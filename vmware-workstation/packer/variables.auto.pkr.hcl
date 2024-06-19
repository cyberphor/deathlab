
variable "centos_iso_url" {
  type = string
  default = "../iso-files/CentOS-7-x86_64-Minimal-2009.iso"
}

variable "centos_iso_checksum" {
  type = string
  default = "07b94e6b1a0b0260b94c83d6bb76b26bf7a310dc78d7a9c7432809fb9bc6194a"
}

variable "velociraptor_vm_name" {
  type = string
  default = "velociraptor"
}

variable "velociraptor_vm_cpus" {
  type = string
  default = "2"
}

variable "velociraptor_vm_memory" {
  type = string
  default = "4096"
}

variable "velociraptor_vm_guest_os_type" {
  type = string
  default = "RedHat_64"
}

variable "velociraptor_vm_admin_username" {
  type = string
  default = "packer"
}

variable "velociraptor_vm_admin_password" {
  type = string
  default = "packer"
}

