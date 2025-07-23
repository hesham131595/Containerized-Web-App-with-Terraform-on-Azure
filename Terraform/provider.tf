terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.37.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "stretchai-tfstate"
    storage_account_name = "stretchaitfstate26888"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id  = "0600564b-e223-44ce-a689-77dd8aac07b9"
}