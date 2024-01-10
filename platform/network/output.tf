output "attacker_nic_id" {
  value = azurerm_network_interface.attacker_nic.id
}

output "dc_nic_id" {
  value = azurerm_network_interface.dc_nic.id
}

output "wec_nic_id" {
  value = azurerm_network_interface.wec_nic.id
}

output "velociraptor_nic_id" {
  value = azurerm_network_interface.velociraptor_nic.id
}

output "user_nic_id" {
  value = azurerm_network_interface.user_nic.id
}