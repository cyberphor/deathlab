resource "azurerm_marketplace_agreement" "barracuda" {
  publisher = "kali-linux"
  offer     = "kali"
  plan      = "kali"
}

resource "azurerm_virtual_machine" "attacker" {
  name                  = "attacker"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [
    var.attacker_nic_id
  ]
  vm_size               = "Standard_DS1_v2"
  storage_os_disk {
    name                = "attacker-os-disk"
    caching             = "ReadWrite"
    create_option       = "FromImage"
    managed_disk_type   = "Premium_LRS"
  }
  plan {
    name                = "kali"
    publisher           = "kali-linux"
    product             = "kali-2023-4"
  }
  os_profile {
    computer_name       = "attacker"
    admin_username      = var.attacker_username
    admin_password      = var.attacker_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
    #ssh_keys {
    #  path = "~/.ssh/authorized_keys"
    #  key_data = file("~/.ssh/id_rsa.pub")
    #}
  }
}