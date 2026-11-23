resource "azurerm_resource_group" "demo" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_storage_account" "demo" {
  name                     = var.storage_name
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
