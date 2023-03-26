# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.49.0"
    }
  }

  required_version = ">= 1.1.0"

  cloud {
    organization = "altfatterz"
    workspaces {
      name = "azure-terraform-demo"
    }
  }
}

provider "azurerm" {
  features {}
}