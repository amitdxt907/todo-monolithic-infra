terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-dhondu"
    storage_account_name = "tfstatestgname"
    container_name       = "tfstates"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "9310c7e6-e982-4f41-acd7-8de043face09"
}
