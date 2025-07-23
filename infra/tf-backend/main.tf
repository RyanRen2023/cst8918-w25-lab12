provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "backend" {
  name     = "ren00055-githubactions-rg"
  location = "Canada Central"
}

resource "azurerm_storage_account" "backend" {
  name                     = "ren00055githubactions"
  resource_group_name      = azurerm_resource_group.backend.name
  location                 = azurerm_resource_group.backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.backend.name
  container_access_type = "private"
}

output "resource_group_name" {
  value = azurerm_resource_group.backend.name
}

output "storage_account_name" {
  value = azurerm_storage_account.backend.name
}

output "container_name" {
  value = azurerm_storage_container.tfstate.name
}

output "arm_access_key" {
  value     = azurerm_storage_account.backend.primary_access_key
  sensitive = true
}
