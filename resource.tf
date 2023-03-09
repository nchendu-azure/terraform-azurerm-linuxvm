
resource "azurerm_storage_account" "NCS-Storage" {
  resource_group_name = var.resoure_group_name
  location = var.location
  name = "ncsstorage1234"
  account_tier = "Standard"
  account_replication_type = "LRS"
 }
