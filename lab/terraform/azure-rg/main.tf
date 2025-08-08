terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.100.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "prefix" {
  type    = string
  default = "infra-day1"
}

variable "location" {
  type    = string
  default = "japaneast"
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg"
  location = var.location
}

output "rg_name" { value = azurerm_resource_group.rg.name }
output "rg_location" { value = azurerm_resource_group.rg.location }

