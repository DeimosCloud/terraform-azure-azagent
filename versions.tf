terraform {
  required_version = ">= 0.13"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 0.0.1"
    }
  }
}
