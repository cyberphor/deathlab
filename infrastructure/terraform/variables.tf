variable "resource_group_location" {
  type        = string
  description = "Location of all resources"
  default     = "eastus"
}

variable "resource_group_name" {
  type        = string
  description = "Name of resource group"
  default     = "vm_webservices"
}

variable "network_name" {
  type        = string
  default     = "network_webservices"
}

variable "subnet_name" {
  type        = string
  default     = "subnet_webservices"
}

variable "network_security_group_name" {
  type        = string
  default     = "WebServiceNSG"
}

variable "server_size" {
  type        = string
  default     = "Standard_B1s"
}

variable "os_disk_caching" {
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  type        = string
  default     = "Standard_LRS"
}

variable "source_image_publisher" {
  type        = string
  default     = "Canonical"
}

variable "source_image_offer" {
  type        = string
  default     = "UbuntuServer"
}

variable "source_image_sku" {
  type        = string
  default     = "18.04-LTS"
}

variable "source_image_version" {
  type        = string
  default     = "latest"
}

variable "admin_username" {
  type        = string
  description = "Username of local administrator"
  default     = "clouduser"
}

variable "prod_server_1" {
  type        = string
  default     = "Prod-Server-1"
}

variable "prod_server_2" {
  type        = string
  default     = "Prod-Server-2"
}

variable "qa_server_1" {
  type        = string
  default     = "QA-Server-1"
}

variable "ansible_host_group_prod" {
  type        = string
  default     = "linux_virtual_machines_prod"
}

variable "ansible_host_group_qa" {
  type        = string
  default     = "linux_virtual_machines_qa"
}

variable "ansible_inventory_file_path" {
  type        = string
  default     = "../ansible/inventory.yaml"
}