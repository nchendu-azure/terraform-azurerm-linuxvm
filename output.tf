output "public_ip" {
value = azurerm_linux_virtual_machine.mylinuxvm.public_ip_address

}

output "vmusername" {
  value = azurerm_linux_virtual_machine.mylinuxvm.admin_username
}