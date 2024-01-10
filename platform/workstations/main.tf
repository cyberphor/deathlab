resource "azurerm_virtual_machine" "user" {
  name                  = "user"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [
    var.user_nic_id
  ]
  vm_size               = "Standard_DS1_v2"
  storage_os_disk {
    name                = "user-os-disk"
    caching             = "ReadWrite"
    create_option       = "FromImage"
    managed_disk_type   = "Premium_LRS"
  }
  storage_image_reference {
    publisher           = "MicrosoftWindowsDesktop"
    offer               = "Windows-11"
    sku                 = "win11-22h2-ent"
    version             = "latest"
  }
  os_profile {
    computer_name       = "XYZ9000WK01"
    admin_username      = var.local_admin_username
    admin_password      = var.local_admin_password
  }
  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = false
    timezone                  = "UTC" 
  }
}