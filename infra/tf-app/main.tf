provider "azurerm" {
  features {}
  use_oidc = true
}

resource "azurerm_resource_group" "app_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

