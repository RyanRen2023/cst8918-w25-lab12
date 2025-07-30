variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
  default     = "ren00055-a12-rg"
}

variable "resource_group_location" {
  type        = string
  description = "The Azure region for the resource group"
  default     = "canadacentral"
}

variable "resource_prefix" {
  type        = string
  description = "The prefix for the resource"
  default     = "ren00055-a12"
}
