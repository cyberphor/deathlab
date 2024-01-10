resource "azurerm_virtual_machine" "dc" {
  name                  = "dc"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [
    var.dc_nic_id
  ]
  vm_size               = "Standard_DS1_v2"
  storage_os_disk {
    name                = "dc-os-disk"
    caching             = "ReadWrite"
    create_option       = "FromImage"
    managed_disk_type   = "Premium_LRS"
  }
  storage_image_reference {
    publisher           = "MicrosoftWindowsServer"
    offer               = "WindowsServer"
    sku                 = "2022-Datacenter"
    version             = "latest"
  }
  os_profile {
    computer_name       = "XYZ9000DC01"
    admin_username      = var.local_admin_username
    admin_password      = var.local_admin_password
  }
  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = false
    timezone                  = "UTC" 
  }
}

resource "azurerm_virtual_machine" "wec" {
  name                  = "wec"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [
    var.wec_nic_id
  ]
  vm_size               = "Standard_DS1_v2"
  storage_os_disk {
    name                = "wec-os-disk"
    caching             = "ReadWrite"
    create_option       = "FromImage"
    managed_disk_type   = "Premium_LRS"
  }
  storage_image_reference {
    publisher           = "MicrosoftWindowsServer"
    offer               = "WindowsServer"
    sku                 = "2022-Datacenter"
    version             = "latest"
  }
  os_profile {
    computer_name       = "XYZ9000WEC1"
    admin_username      = var.local_admin_username
    admin_password      = var.local_admin_password
  }
  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = false
    timezone                  = "UTC" 
  }
}

resource "azurerm_virtual_machine" "velociraptor" {
  name                  = "velociraptor"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [
    var.velociraptor_nic_id
  ]
  vm_size               = "Standard_DS1_v2"
  storage_os_disk {
    name                = "velociraptor-os-disk"
    caching             = "ReadWrite"
    create_option       = "FromImage"
    managed_disk_type   = "Premium_LRS"
  }
  storage_image_reference {
    publisher           = "Canonical"
    offer               = "UbuntuServer"
    sku                 = "16.04.0-LTS"
    version             = "latest"
  }
  os_profile {
    computer_name       = "XYZ9000VR01"
    admin_username      = var.local_admin_username
    admin_password      = var.local_admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}