
output "admin_username" {
  value = var.admin_username
}

resource "null_resource" "create_ansible_host_inventory" {
  triggers = {
    always = timestamp()
  }

  for_each = {
    prod1 = azurerm_linux_virtual_machine.prod_server_1.public_ip_address,
    prod2 = azurerm_linux_virtual_machine.prod_server_2.public_ip_address,
    qa3 = azurerm_linux_virtual_machine.qa_server_1.public_ip_address
  }

  provisioner "local-exec" {
    command = <<-EOF
      case ${each.key} in
        prod*) HOST_GROUP=${var.ansible_host_group_prod}
          ;;
        qa*) HOST_GROUP=${var.ansible_host_group_qa}
      esac
      
      python3 ../ansible/inventory.py \
        --file-path "${var.ansible_inventory_file_path}" \
        --host-group "$HOST_GROUP" \
        --host "${each.value}"
      EOF
  }
}