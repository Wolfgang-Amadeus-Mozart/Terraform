#OUTPUTIING VM PUBLIC IP ADDRESS
output "vm_ip" {
  description = "shows vm ip"
  value = azurerm_linux_virtual_machine.vm-azure-linux.public_ip_address
}