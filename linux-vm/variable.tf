variable "resoure_group_name" {
  description = "Resource Group Name"
  type = string
  default = "ODL-azure-872442"
}

variable "location" {
    type = string
    default = "eastus"
  }

variable "mysubnet" {
  default = "IT"
  type = string  
}

variable "business_unit" {
  default = "blrg"
  type = string
}

variable "Environment" {
 default = "dev"
  type = string
}


 # Virtual Network Name
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type = string
  default = "myvnet"
}


variable "vnet_adddress_space_dev" {

  description = "Vnet address space for dev environmanet"
  type = list(string)
  default = [ "10.0.0.0/16" ]
}


 #set TF_VAR_virtual_network_name=yourvnet
 # export TF_VAR_virtual_network_name=yourvnet
 # SET Environment Variables

#echo $TF_VAR_virtual_network_name, $TF_VAR_subnet_name