terraform {
  required_version = ">= 1.9.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.96.0"
    }
  }

  backend "azurerm" {
    use_oidc = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}



