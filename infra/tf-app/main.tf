provider "azurerm" {
  features {}
}

variable "resource_prefix" {
  description = "A prefix to add to all resources"
  type        = string
  default     = "ren00055-a12"
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_prefix}-rg"
  location = "westus3"
}

