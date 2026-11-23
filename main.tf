# Demonstrating the USE phase of Declare -> Assign -> Use

# Provisioning Azure Resource Group using string and map variables
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.resource_tags
}

# Provisioning Azure Storage Account using Object variable and RG reference
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_profile.name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.storage_profile.tier
  account_replication_type = var.storage_profile.replication
  tags                     = var.resource_tags
}
