terraform {
  required_providers {
    azurerm   = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "deathlab"
  location = var.location
}

module "production" {
  source              = "./production"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

output "bastion_ip_address" {
  value = module.production.bastion_ip_address
}