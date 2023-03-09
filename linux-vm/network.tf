# create subnet
resource "azurerm_virtual_network" "myvnet" {
 name = "${var.business_unit}-${var.Environment}-${var.virtual_network_name}"
 location = var.location
 resource_group_name = var.resoure_group_name
 address_space = ["10.0.0.0/24"]
      
}
# To create Subnet
resource "azurerm_subnet" "mysubnet" {
   # name = "mysubnet"
   name = "${var.business_unit}-${var.Environment}"
    resource_group_name = var.resoure_group_name
    virtual_network_name = azurerm_virtual_network.myvnet.name
    address_prefixes = ["10.0.0.0/24"]
      
  }
  #To create Public IP
resource "azurerm_public_ip" "public-ip" {
   
 # count = 2
    name = "mypublic-ip"
    location = var.location
    resource_group_name = var.resoure_group_name
    allocation_method = "Static"
    
}

#to create Network Interface
  resource "azurerm_network_interface" "myvmnic" {
   # count = 2
    name = "myvmnic"
   # name = "${var.business_unit}-${var.Environment}"
    location = var.location
    resource_group_name = var.resoure_group_name
    ip_configuration {
      
      name = "internal"
      subnet_id = azurerm_subnet.mysubnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.public-ip.id

    }

  }

  