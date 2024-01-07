resource "azurerm_virtual_network" "production" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = "network"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.production.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_subnet" "servers" {
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.production.name
  name                 = "servers"
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "workstations" {
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.production.name
  name                 = "workstations"
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "bastion" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = "bastion-public-ip"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "main" {
  location               = var.location
  resource_group_name    = var.resource_group_name
  name                   = "bastion"
  ip_configuration {
    name                 = "bastion-nic-config"
    subnet_id            = azurerm_subnet.bastion.id
    public_ip_address_id = azurerm_public_ip.bastion.id
  }
}

resource "azurerm_network_interface" "dc-nic" {
  location                        = var.location
  resource_group_name             = var.resource_group_name
  name                            = "dc-nic"
  ip_configuration {
    subnet_id                     = azurerm_subnet.servers.id
    name                          = "dc-nic-config"
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.4"
  }
}

resource "azurerm_network_interface" "user-nic" {
  location                        = var.location
  resource_group_name             = var.resource_group_name
  name                            = "user-nic"
  ip_configuration {
    subnet_id                     = azurerm_subnet.workstations.id
    name                          = "user-nic-config"
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.2.13"
  }
}

resource "azurerm_virtual_machine" "dc" {
  name                  = "dc"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [
    azurerm_network_interface.dc-nic.id
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
    admin_username      = var.admin_username
    admin_password      = var.admin_password
  }
  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = false
    timezone                  = "UTC" 
  }
}

resource "azurerm_virtual_machine" "user" {
  name                  = "usr"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [
    azurerm_network_interface.user-nic.id
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
    admin_username      = var.admin_username
    admin_password      = var.admin_password
  }
  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = false
    timezone                  = "UTC" 
  }
}

output "bastion_ip_address" {
  value = azurerm_public_ip.bastion.ip_address
}
