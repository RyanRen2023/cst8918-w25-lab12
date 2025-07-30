provider "azurerm" {
  features {}
  use_oidc = true
}

resource "azurerm_resource_group" "app_rg" {
  name     = "ren00055-a12-rg"
  location = "canadacentral"
}