

/*

resource "tls_private_key" "linux_test_ssh" {
    algorithm = "RSA"
    rsa_bits = 4096
}
*/

# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "mylinuxvm" {
  name                = "mylinuxvm"
  computer_name       = "devlinux" # Hostname of the VM
  resource_group_name = var.resoure_group_name
  location            = var.location
  size                = "Standard_D2s_v3"
  admin_username      = "azureuser"
  admin_password = "Cegedim@123"
  network_interface_ids = [azurerm_network_interface.myvmnic.id]
  admin_ssh_key {
    username   = "azureuser"
    #public_key =  tls_private_key.linux_test_ssh.public_key_openssh
     public_key = file("${path.module}/ssh/id_rsa.pub")  
  }
  
  os_disk {
    name = "osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

   source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
#custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")





