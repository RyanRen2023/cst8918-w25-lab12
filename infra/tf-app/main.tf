provider "azurerm" {
  features {}
  use_oidc = true
}

resource "azurerm_resource_group" "app_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.resource_prefix}-storage-account"
  resource_group_name      = azurerm_resource_group.app_rg.name
  location                 = azurerm_resource_group.app_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  tags = {
    environment = "Production"
  }
}



