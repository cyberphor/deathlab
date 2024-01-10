resource "azurerm_virtual_network" "attacker" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = "attacker"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_virtual_network_peering" "attacker_to_main" {
  name                      = "attacker-to-main"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.attacker.name
  remote_virtual_network_id = azurerm_virtual_network.main.id
}

resource "azurerm_subnet" "attacker" {
  name                 = "default"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.attacker.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_interface" "attacker_nic" {
  location                        = var.location
  resource_group_name             = var.resource_group_name
  name                            = "attacker-nic"
  ip_configuration {
    subnet_id                     = azurerm_subnet.attacker.id
    name                          = "attacker-nic-config"
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.0.75"
  }
}

resource "azurerm_virtual_network" "main" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = "network"
  address_space       = ["192.168.0.0/16"]
}

resource "azurerm_virtual_network_peering" "main_to_attacker" {
  name                      = "main-to-attacker"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.main.name
  remote_virtual_network_id = azurerm_virtual_network.attacker.id
}

resource "azurerm_subnet" "gateway" {
  name                 = "gateway"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["192.168.0.0/24"]
}

resource "azurerm_public_ip" "gateway" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = "gateway-public-ip"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_subnet" "servers" {
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  name                 = "servers"
  address_prefixes     = ["192.168.1.0/24"]
}

resource "azurerm_network_interface" "dc_nic" {
  location                        = var.location
  resource_group_name             = var.resource_group_name
  name                            = "dc-nic"
  ip_configuration {
    subnet_id                     = azurerm_subnet.servers.id
    name                          = "dc-nic-config"
    private_ip_address_allocation = "Static"
    private_ip_address            = "192.168.1.10"
  }
}

resource "azurerm_network_interface" "wec_nic" {
  location                        = var.location
  resource_group_name             = var.resource_group_name
  name                            = "wec-nic"
  ip_configuration {
    subnet_id                     = azurerm_subnet.servers.id
    name                          = "wec-nic-config"
    private_ip_address_allocation = "Static"
    private_ip_address            = "192.168.1.20"
  }
}

resource "azurerm_network_interface" "velociraptor_nic" {
  location                        = var.location
  resource_group_name             = var.resource_group_name
  name                            = "velociraptor-nic"
  ip_configuration {
    subnet_id                     = azurerm_subnet.servers.id
    name                          = "velociraptor-nic-config"
    private_ip_address_allocation = "Static"
    private_ip_address            = "192.168.1.30"
  }
}

resource "azurerm_subnet" "workstations" {
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  name                 = "workstations"
  address_prefixes     = ["192.168.2.0/24"]
}

resource "azurerm_network_interface" "user_nic" {
  location                        = var.location
  resource_group_name             = var.resource_group_name
  name                            = "user-nic"
  ip_configuration {
    subnet_id                     = azurerm_subnet.workstations.id
    name                          = "user-nic-config"
    private_ip_address_allocation = "Static"
    private_ip_address            = "192.168.2.69"
  }
}

