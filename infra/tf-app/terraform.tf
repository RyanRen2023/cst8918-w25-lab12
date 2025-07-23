terraform {

  required_version = "~> 1.5"

  backend "azurerm" {
    resource_group_name  = "ren00055-cst8918-tf-backend"
    storage_account_name = "ren00055tfstorage"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.96.0"
    }
  }
}